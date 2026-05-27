module Flashcards
  class ListFlashcardsQuery
    def self.call(deck:)
      new(deck: deck).call
    end

    def initialize(deck:)
      @deck = deck
    end

    def call
      @deck.flashcards.ordered
    end
  end
end
