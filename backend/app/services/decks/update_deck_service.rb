module Decks
  class UpdateDeckService < ApplicationService
    def initialize(deck:, params:)
      @deck   = deck
      @params = params
    end

    def call
      return Failure(@deck.errors.full_messages) unless @deck.update(@params)

      Success(@deck)
    end
  end
end
