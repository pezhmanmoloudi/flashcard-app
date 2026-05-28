module Study
  class DeckStatsQuery
    MASTERY_THRESHOLD = 3

    DeckStats = Struct.new(
      :total_cards, :new_count, :due_count, :mastered_count, :learning_count,
      keyword_init: true
    )

    def self.call(user:, deck:)
      new(user: user, deck: deck).call
    end

    def initialize(user:, deck:)
      @user = user
      @deck = deck
    end

    def call
      total = @deck.flashcards.count
      return DeckStats.new(total_cards: total, new_count: 0, due_count: 0, mastered_count: 0, learning_count: 0) if total.zero?

      progresses   = user_progresses
      new_count    = total - progresses.count
      overdue      = progresses.where("next_review_at IS NULL OR next_review_at <= ?", Time.current).count
      mastered     = progresses.where(repetitions: MASTERY_THRESHOLD..).count
      learning     = progresses.where("repetitions > 0 AND repetitions < ?", MASTERY_THRESHOLD)
                               .where("next_review_at > ?", Time.current).count

      DeckStats.new(
        total_cards:    total,
        new_count:      new_count,
        due_count:      overdue + new_count,
        mastered_count: mastered,
        learning_count: learning
      )
    end

    private

    def user_progresses
      CardProgress.joins(:flashcard)
                  .where(flashcards: { deck_id: @deck.id }, user: @user)
    end
  end
end
