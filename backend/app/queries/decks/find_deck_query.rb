module Decks
  class FindDeckQuery
    def self.call(user:, id:)
      new(user: user, id: id).call
    end

    def initialize(user:, id:)
      @user = user
      @id   = id
    end

    def call
      Deck.accessible_to(@user).find(@id)
    end
  end
end
