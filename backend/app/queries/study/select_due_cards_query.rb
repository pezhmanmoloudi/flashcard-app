module Study
  # Returns cards due for the given user, deck, and set.
  # New cards (no progress row) are included alongside reviewed cards that
  # are due and not currently in the reinforcement inbox.
  # Reviewed cards surface first (ordered by priority score), then new cards.
  class SelectDueCardsQuery
    DAILY_LIMIT = 20

    def self.call(user:, deck:, flashcard_set_id: nil)
      new(user: user, deck: deck, flashcard_set_id: flashcard_set_id).call
    end

    def initialize(user:, deck:, flashcard_set_id: nil)
      @user             = user
      @deck             = deck
      @flashcard_set_id = flashcard_set_id
    end

    def call
      scope = Flashcard
        .joins(:flashcard_set)
        .where(flashcard_sets: { deck_id: @deck.id })
        .joins(progress_join)
        .where(due_condition)
        .order(Arel.sql(order_clause))
        .limit(DAILY_LIMIT)
        .includes(:flashcard_set)

      scope = scope.where(flashcard_sets: { id: @flashcard_set_id }) if @flashcard_set_id.present?
      scope
    end

    private

    def progress_join
      "LEFT JOIN card_progresses ON card_progresses.flashcard_id = flashcards.id " \
      "AND card_progresses.user_id = #{@user.id.to_i}"
    end

    def due_condition
      [
        "(card_progresses.id IS NULL OR card_progresses.next_review_at <= ?) " \
        "AND (card_progresses.id IS NULL OR card_progresses.needs_review = false)",
        Time.current,
      ]
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
      "CASE WHEN card_progresses.id IS NULL THEN 1 ELSE 0 END ASC, " \
      "(#{PRIORITY_SCORE_SQL}) DESC, " \
      "card_progresses.next_review_at ASC NULLS LAST, " \
      "flashcards.created_at ASC"
    end
  end
end
