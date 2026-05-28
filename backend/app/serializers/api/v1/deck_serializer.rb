module Api
  module V1
    class DeckSerializer < ApplicationSerializer
      def call
        {
          id:              @resource.id,
          name:            @resource.name,
          description:     @resource.description,
          flashcard_count: @resource.flashcards.size,
          created_at:      @resource.created_at
        }
      end
    end
  end
end
