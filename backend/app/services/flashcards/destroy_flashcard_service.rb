module Flashcards
  class DestroyFlashcardService < ApplicationService
    def initialize(flashcard:)
      @flashcard = flashcard
    end

    def call
      @flashcard.destroy
      Success(true)
    end
  end
end
