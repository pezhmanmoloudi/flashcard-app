module Decks
  class CreateDeckService < ApplicationService
    def initialize(user:, params:)
      @user   = user
      @params = params
    end

    def call
      deck = @user.decks.build(@params)
      return Failure(deck.errors.full_messages) unless deck.save

      Success(deck)
    end
  end
end
