module Decks
  class ListDecksQuery
    def self.call(user:)
      new(user: user).call
    end

    def initialize(user:)
      @user = user
    end

    def call
      Deck.accessible_to(@user)
          .includes(flashcard_sets: :flashcards)
          .ordered
    end
  end
end
