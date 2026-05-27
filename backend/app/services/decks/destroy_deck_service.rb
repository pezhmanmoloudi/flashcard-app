module Decks
  class DestroyDeckService < ApplicationService
    def initialize(deck:)
      @deck = deck
    end

    def call
      @deck.destroy
      Success(true)
    end
  end
end
