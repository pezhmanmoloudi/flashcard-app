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
      Flashcard.joins(flashcard_set: :deck)
               .where("decks.user_id = ? OR decks.is_system = ?", @user.id, true)
               .find(@id)
    end
  end
end
