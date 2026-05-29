module FlashcardSets
  class DestroyFlashcardSetService < ApplicationService
    def initialize(flashcard_set:)
      @flashcard_set = flashcard_set
    end

    def call
      @flashcard_set.destroy
      Success(nil)
    end
  end
end
