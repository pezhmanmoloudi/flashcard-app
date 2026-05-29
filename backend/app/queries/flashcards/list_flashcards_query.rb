module Flashcards
  class ListFlashcardsQuery
    def self.call(deck:)
      new(deck: deck).call
    end

    def initialize(deck:)
      @deck = deck
    end

    def call
      @deck.flashcards.includes(:flashcard_set).ordered
    end
  end
end
