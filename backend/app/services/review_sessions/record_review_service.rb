module ReviewSessions
  # Records a flashcard review inside a ReviewSession (language-pair scoped).
  # Shares the same card-progress state machine as StudySessions::RecordReviewService
  # but validates card accessibility by language_pair rather than deck_id.
  class RecordReviewService < ApplicationService
    RESULT_TO_QUALITY = { "known" => 4, "again" => 1, "hard" => 3, "good" => 4, "easy" => 5 }.freeze

    REINFORCEMENT_SCHEDULE = { 1 => 1, 2 => 2, 3 => 4, 4 => 7 }.freeze
    MAX_DELAY_DAYS         = 14
    GRADUATION_THRESHOLD   = 3
    COOLDOWN_HOURS         = 1

    def initialize(review_session:, flashcard_id:, result:, response_time_ms: nil)
      @review_session   = review_session
      @flashcard_id     = flashcard_id
      @result           = result.to_s
      @response_time_ms = response_time_ms&.to_i
    end

    def call
      quality = RESULT_TO_QUALITY[@result]
      return Failure(["Invalid result '#{@result}'"]) unless quality

      flashcard = find_flashcard
      return Failure(["Flashcard not found"]) unless flashcard

      progress = CardProgress.find_or_initialize_by(
        user:      @review_session.user,
        flashcard: flashcard
      )

      sm2 = SpacedRepetition::Sm2Algorithm.call(
        quality:         quality,
        repetitions:     progress.repetitions,
        easiness_factor: progress.easiness_factor,
        interval_days:   progress.interval_days
      )

      progress.assign_attributes(
        repetitions:     sm2.repetitions,
        easiness_factor: sm2.easiness_factor,
        interval_days:   sm2.interval_days,
        next_review_at:  sm2.next_review_at
      )

      if @result == "again"
        unless spam_protected?(progress)
          new_streak = progress.fail_streak + 1
          delay      = REINFORCEMENT_SCHEDULE.fetch(new_streak, MAX_DELAY_DAYS)
          progress.fail_streak          = new_streak
          progress.inbox_success_count  = 0
          progress.reinforcement_due_at = delay.days.from_now
        end
        progress.needs_review      = true
        progress.reviewed_again_at = Time.current
      elsif progress.needs_review?
        new_count = progress.inbox_success_count + 1
        if new_count >= GRADUATION_THRESHOLD
          progress.needs_review         = false
          progress.fail_streak          = 0
          progress.inbox_success_count  = 0
          progress.reinforcement_due_at = nil
        else
          progress.inbox_success_count  = new_count
          progress.reinforcement_due_at = 1.day.from_now
        end
      end

      if progress.reinforcement_due_at.present?
        progress.next_review_at = [sm2.next_review_at, progress.reinforcement_due_at].max
      end

      progress.last_response_time_ms = @response_time_ms if @response_time_ms&.positive?

      saved = false

      ActiveRecord::Base.transaction do
        if progress.save
          @review_session.increment!(:cards_reviewed)
          saved = true
        else
          raise ActiveRecord::Rollback
        end
      end

      return Failure(progress.errors.full_messages) unless saved

      Success(progress)
    end

    private

    def spam_protected?(progress)
      progress.needs_review? &&
        progress.reviewed_again_at.present? &&
        progress.reviewed_again_at > COOLDOWN_HOURS.hours.ago
    end

    def find_flashcard
      user = @review_session.user
      Flashcard
        .joins(flashcard_set: :deck)
        .where(
          "id = :fid AND decks.language_pair = :lp AND (decks.user_id = :uid OR decks.is_system = :sys)",
          fid: @flashcard_id,
          lp:  @review_session.language_pair,
          uid: user.id,
          sys: true
        )
        .first
    end
  end
end
