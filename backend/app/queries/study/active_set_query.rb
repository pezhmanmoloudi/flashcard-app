module Study
  # Returns the first flashcard set that is unlocked but not yet completed
  # for the given user within a deck — the set the user should study next.
  # Returns nil when all sets in the deck are completed.
  class ActiveSetQuery
    def self.call(user:, deck:)
      new(user: user, deck: deck).call
    end

    def initialize(user:, deck:)
      @user = user
      @deck = deck
    end

    def call
      sets = @deck.flashcard_sets.includes(:flashcards).ordered.to_a
      return nil if sets.empty?

      completed_ids = FlashcardSets::SetCompletionQuery.call(user: @user, sets: sets)

      sets.each_with_index do |set, idx|
        is_completed = completed_ids.include?(set.id)
        is_unlocked  = idx.zero? || completed_ids.include?(sets[idx - 1].id)
        return set if is_unlocked && !is_completed
      end

      nil
    end
  end
end
