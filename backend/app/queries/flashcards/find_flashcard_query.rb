module Flashcards
  class FindFlashcardQuery
    def self.call(user:, id:)
      new(user: user, id: id).call
    end

    def initialize(user:, id:)
      @user = user
      @id   = id
    end

    def call
      Flashcard.joins(:deck)
               .where(decks: { user_id: @user.id })
               .find(@id)
    end
  end
end
