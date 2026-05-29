module Api
  module V1
    class FlashcardSetSerializer < ApplicationSerializer
      def call
        {
          id:             @resource.id,
          deck_id:        @resource.deck_id,
          name:           @resource.name,
          description:    @resource.description,
          position:       @resource.position,
          flashcard_count: @resource.flashcards.size,
          created_at:     @resource.created_at
        }
      end
    end
  end
end
