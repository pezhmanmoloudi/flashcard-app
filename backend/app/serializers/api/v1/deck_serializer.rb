module Api
  module V1
    class DeckSerializer < ApplicationSerializer
      def self.with_progress(deck, is_completed:, is_unlocked:,
                              completed_cards_count:, total_cards_count:,
                              progress_percentage:)
        new(deck).call.merge(
          is_completed:          is_completed,
          is_unlocked:           is_unlocked,
          completed_cards_count: completed_cards_count,
          total_cards_count:     total_cards_count,
          progress_percentage:   progress_percentage
        )
      end

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
