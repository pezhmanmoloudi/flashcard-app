module FlashcardSets
  class UpdateFlashcardSetService < ApplicationService
    def initialize(flashcard_set:, params:)
      @flashcard_set = flashcard_set
      @params        = params
    end

    def call
      return Failure(@flashcard_set.errors.full_messages) unless @flashcard_set.update(@params)

      Success(@flashcard_set)
    end
  end
end
