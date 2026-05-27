module Flashcards
  class CreateFlashcardService < ApplicationService
    def initialize(deck:, params:)
      @deck   = deck
      @params = params
    end

    def call
      flashcard = @deck.flashcards.build(@params)
      return Failure(flashcard.errors.full_messages) unless flashcard.save

      Success(flashcard)
    end
  end
end
