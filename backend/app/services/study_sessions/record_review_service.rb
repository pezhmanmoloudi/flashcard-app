module StudySessions
  class RecordReviewService < ApplicationService
    # Maps the two-state swipe UX to SM-2 quality scores.
    # known → 4 (correct with hesitation), again → 1 (wrong but answer felt familiar)
    RESULT_TO_QUALITY = { "known" => 4, "again" => 1 }.freeze

    def initialize(study_session:, flashcard_id:, result:)
      @study_session = study_session
      @flashcard_id  = flashcard_id
      @result        = result.to_s
    end

    def call
      quality = RESULT_TO_QUALITY[@result]
      return Failure(["Invalid result '#{@result}': must be 'known' or 'again'"]) unless quality

      flashcard = find_flashcard
      return Failure(["Flashcard not found in this deck"]) unless flashcard

      progress = CardProgress.find_or_initialize_by(
        user:      @study_session.user,
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

      saved = false

      ActiveRecord::Base.transaction do
        if progress.save
          @study_session.increment!(:cards_studied)
          saved = true
        else
          raise ActiveRecord::Rollback
        end
      end

      return Failure(progress.errors.full_messages) unless saved

      Success(progress)
    end

    private

    def find_flashcard
      Flashcard
        .joins(flashcard_set: :deck)
        .where(id: @flashcard_id, decks: { id: @study_session.deck_id })
        .first
    end
  end
end
