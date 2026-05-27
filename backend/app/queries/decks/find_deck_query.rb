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
      @user.decks.find(@id)
    end
  end
end
