module Study
  # Returns one summary row per language pair that has cards due for review.
  # Each row includes:
  #   language_pair  — e.g. "de_to_fa"
  #   inbox_due      — cards with needs_review = true  AND reinforcement_due_at <= now
  #   sm2_due        — cards with needs_review = false AND next_review_at <= now
  #   total_due      — inbox_due + sm2_due
  #
  # Only language pairs with at least one due card are returned.
  class ReviewQueueSummaryQuery
    def self.call(user:)
      new(user: user).call
    end

    def initialize(user:)
      @user = user
    end

    def call
      rows = Flashcard
        .joins(flashcard_set: :deck)
        .joins(progress_join)
        .where(any_inbox_or_sm2_due_condition)
        .group("decks.language_pair")
        .order("decks.language_pair ASC")
        .select(
          "decks.language_pair AS language_pair",
          "COUNT(CASE WHEN card_progresses.needs_review = true " \
          "           AND (card_progresses.reinforcement_due_at IS NULL " \
          "                OR card_progresses.reinforcement_due_at <= NOW()) THEN 1 END) AS inbox_due",
          "COUNT(CASE WHEN card_progresses.needs_review = false " \
          "           AND card_progresses.next_review_at <= NOW() THEN 1 END) AS sm2_due",
          "COUNT(CASE WHEN card_progresses.needs_review = true " \
          "           AND card_progresses.reinforcement_due_at > NOW() THEN 1 END) AS inbox_waiting"
        )

      rows.map do |row|
        inbox   = row.inbox_due.to_i
        sm2     = row.sm2_due.to_i
        waiting = row.inbox_waiting.to_i
        {
          language_pair: row.language_pair,
          inbox_due:     inbox,
          sm2_due:       sm2,
          total_due:     inbox + sm2,
          inbox_waiting: waiting,
        }
      end
    end

    private

    def progress_join
      "INNER JOIN card_progresses ON card_progresses.flashcard_id = flashcards.id " \
      "AND card_progresses.user_id = #{@user.id.to_i}"
    end

    def any_inbox_or_sm2_due_condition
      [
        "card_progresses.needs_review = true" \
        " OR (card_progresses.needs_review = false AND card_progresses.next_review_at <= :now)",
        { now: Time.current },
      ]
    end
  end
end
