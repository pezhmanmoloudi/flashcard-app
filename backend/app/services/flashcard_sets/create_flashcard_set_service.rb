module FlashcardSets
  class CreateFlashcardSetService < ApplicationService
    def initialize(deck:, params:)
      @deck   = deck
      @params = params
    end

    def call
      set = @deck.flashcard_sets.build(@params)
      return Failure(set.errors.full_messages) unless set.save

      Success(set)
    end
  end
end
