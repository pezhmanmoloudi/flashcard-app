module Flashcards
  class UpdateFlashcardService < ApplicationService
    def initialize(flashcard:, params:)
      @flashcard = flashcard
      @params    = params
    end

    def call
      return Failure(@flashcard.errors.full_messages) unless @flashcard.update(@params)

      Success(@flashcard)
    end
  end
end
