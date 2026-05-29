module FlashcardSets
  class FindFlashcardSetQuery
    def self.call(deck:, id:)
      new(deck: deck, id: id).call
    end

    def initialize(deck:, id:)
      @deck = deck
      @id   = id
    end

    def call
      @deck.flashcard_sets.find(@id)
    end
  end
end
