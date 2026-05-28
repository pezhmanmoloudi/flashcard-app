module Study
  class SelectDueCardsQuery
    DAILY_LIMIT = 20

    def self.call(user:, deck:)
      new(user: user, deck: deck).call
    end

    def initialize(user:, deck:)
      @user = user
      @deck = deck
    end

    def call
      Flashcard
        .where(deck_id: @deck.id)
        .joins(progress_join)
        .where("card_progresses.id IS NULL OR card_progresses.next_review_at <= ?", Time.current)
        .order(Arel.sql(order_clause))
        .limit(DAILY_LIMIT)
    end

    private

    def progress_join
      # Left-join user-scoped progress so cards with no progress record are included.
      # @user.id is a PK integer — safe to interpolate.
      "LEFT JOIN card_progresses ON card_progresses.flashcard_id = flashcards.id " \
      "AND card_progresses.user_id = #{@user.id.to_i}"
    end

    def order_clause
      # Overdue cards first (oldest due date = most urgent), new cards last.
      "CASE WHEN card_progresses.id IS NULL THEN 1 ELSE 0 END ASC, " \
      "card_progresses.next_review_at ASC NULLS LAST, " \
      "flashcards.created_at ASC"
    end
  end
end
