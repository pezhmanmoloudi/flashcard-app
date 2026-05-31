module Study
  # Returns a flat, ordered list of flashcards due for review for a given user
  # and language pair. Merges two sources into one prioritised stream:
  #
  #   1. Inbox cards  — needs_review = true  AND reinforcement_due_at <= now
  #      Ordered: fail_streak DESC (hardest first), then inbox_success_count ASC
  #
  #   2. SM-2 cards   — needs_review = false AND next_review_at <= now
  #      Ordered: PRIORITY_SCORE DESC (overdue × difficulty × response time)
  #
  # Inbox cards are always surfaced before SM-2 cards so the user clears
  # recovering material before moving on to scheduled reviews.
  class FlatReviewCardsQuery
    LIMIT = 50

    def self.call(user:, language_pair:, include_waiting: false)
      new(user: user, language_pair: language_pair, include_waiting: include_waiting).call
    end

    def initialize(user:, language_pair:, include_waiting: false)
      @user            = user
      @language_pair   = language_pair
      @include_waiting = include_waiting
    end

    def call
      Flashcard
        .joins(flashcard_set: :deck)
        .joins(progress_join)
        .where("decks.language_pair = ?", @language_pair)
        .where(due_condition)
        .order(Arel.sql(order_clause))
        .limit(LIMIT)
        .includes(flashcard_set: :deck)
    end

    private

    def progress_join
      "INNER JOIN card_progresses ON card_progresses.flashcard_id = flashcards.id " \
      "AND card_progresses.user_id = #{@user.id.to_i}"
    end

    def due_condition
      if @include_waiting
        [
          "card_progresses.needs_review = true" \
          " OR (card_progresses.needs_review = false AND card_progresses.next_review_at <= :now)",
          { now: Time.current },
        ]
      else
        [
          "(card_progresses.needs_review = true " \
          "  AND (card_progresses.reinforcement_due_at IS NULL OR card_progresses.reinforcement_due_at <= :now))" \
          " OR " \
          "(card_progresses.needs_review = false AND card_progresses.next_review_at <= :now)",
          { now: Time.current },
        ]
      end
    end

    PRIORITY_SCORE_SQL = <<~SQL.squish
      LEAST(EXTRACT(EPOCH FROM (NOW() - card_progresses.next_review_at)) / 86400.0, 30)
      + (3.5 - COALESCE(card_progresses.easiness_factor, 2.5)) * 8
      + CASE
          WHEN card_progresses.last_response_time_ms IS NULL    THEN 0
          WHEN card_progresses.last_response_time_ms <  3000    THEN -3
          WHEN card_progresses.last_response_time_ms <  6000    THEN  0
          WHEN card_progresses.last_response_time_ms < 10000    THEN  2
          ELSE 4
        END
      + CASE WHEN COALESCE(card_progresses.repetitions, 0) < 3 THEN 2 ELSE 0 END
    SQL

    def order_clause
      <<~SQL.squish
        CASE WHEN card_progresses.needs_review = true THEN 0 ELSE 1 END ASC,
        CASE WHEN card_progresses.needs_review = true
             THEN card_progresses.fail_streak END DESC NULLS LAST,
        CASE WHEN card_progresses.needs_review = true
             THEN card_progresses.inbox_success_count END ASC NULLS LAST,
        CASE WHEN card_progresses.needs_review = false
             THEN (#{PRIORITY_SCORE_SQL}) END DESC NULLS LAST,
        flashcards.created_at ASC
      SQL
    end
  end
end
