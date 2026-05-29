module Api
  module V1
    class DeckSerializer < ApplicationSerializer
      def call
        {
          id:                 @resource.id,
          name:               @resource.name,
          description:        @resource.description,
          is_system:          @resource.is_system,
          level:              @resource.level,
          language_pair:      @resource.language_pair,
          position:           @resource.position,
          flashcard_set_count: @resource.flashcard_sets.size,
          flashcard_count:    @resource.flashcards.size,
          created_at:         @resource.created_at
        }
      end
    end
  end
end
