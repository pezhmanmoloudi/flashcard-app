module FlashcardSets
  class ListFlashcardSetsQuery
    def self.call(deck:)
      new(deck: deck).call
    end

    def initialize(deck:)
      @deck = deck
    end

    def call
      @deck.flashcard_sets.includes(:flashcards).ordered
    end
  end
end
