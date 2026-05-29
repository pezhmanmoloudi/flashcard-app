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
          .order(Arel.sql(
            "language_pair ASC NULLS LAST, level ASC NULLS LAST, position ASC, created_at DESC"
          ))
    end
  end
end
