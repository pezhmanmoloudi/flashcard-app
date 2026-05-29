module Study
  class SelectDueCardsQuery
    DAILY_LIMIT = 20

    def self.call(user:, deck:, flashcard_set_id: nil, reviews_only: false)
      new(user: user, deck: deck, flashcard_set_id: flashcard_set_id, reviews_only: reviews_only).call
    end

    def initialize(user:, deck:, flashcard_set_id: nil, reviews_only: false)
      @user             = user
      @deck             = deck
      @flashcard_set_id = flashcard_set_id
      @reviews_only     = reviews_only
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
      # @user.id is a PK integer — safe to interpolate.
      # LEFT JOIN keeps new cards visible when reviews_only is false.
      "LEFT JOIN card_progresses ON card_progresses.flashcard_id = flashcards.id " \
      "AND card_progresses.user_id = #{@user.id.to_i}"
    end

    def due_condition
      if @reviews_only
        # Only cards the user has already reviewed and that are due again.
        ["card_progresses.id IS NOT NULL AND card_progresses.next_review_at <= ?", Time.current]
      else
        # New cards (no progress) + cards whose review is due.
        ["card_progresses.id IS NULL OR card_progresses.next_review_at <= ?", Time.current]
      end
    end

    def order_clause
      if @reviews_only
        "card_progresses.next_review_at ASC, flashcards.created_at ASC"
      else
        # Overdue cards first (oldest due date = most urgent), new cards last.
        "CASE WHEN card_progresses.id IS NULL THEN 1 ELSE 0 END ASC, " \
        "card_progresses.next_review_at ASC NULLS LAST, " \
        "flashcards.created_at ASC"
      end
    end
  end
end
