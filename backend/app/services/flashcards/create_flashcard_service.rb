module Flashcards
  class CreateFlashcardService < ApplicationService
    def initialize(flashcard_set:, params:)
      @flashcard_set = flashcard_set
      @params        = params
    end

    def call
      flashcard = @flashcard_set.flashcards.build(@params)
      return Failure(flashcard.errors.full_messages) unless flashcard.save

      Success(flashcard)
    end
  end
end
