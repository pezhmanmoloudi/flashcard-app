module Decks
  class ListDecksQuery
    def self.call(user:)
      new(user: user).call
    end

    def initialize(user:)
      @user = user
    end

    def call
      @user.decks.ordered
    end
  end
end
