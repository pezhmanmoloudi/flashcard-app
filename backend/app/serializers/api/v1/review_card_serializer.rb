module Api
  module V1
    # Extends FlashcardSerializer with review-context metadata:
    # set name, deck name, and CEFR level.
    # Requires the flashcard to have flashcard_set.deck eager-loaded.
    class ReviewCardSerializer < ApplicationSerializer
      def call
        flashcard_set = @resource.flashcard_set
        deck          = flashcard_set.deck

        {
          id:                  @resource.id,
          flashcard_set_id:    @resource.flashcard_set_id,
          deck_id:             deck.id,
          front_text:          @resource.front_text,
          back_text:           @resource.back_text,
          source_language:     @resource.source_language,
          target_language:     @resource.target_language,
          example_sentence:    @resource.example_sentence,
          translated_sentence: @resource.translated_sentence,
          grammar_notes:       @resource.grammar_notes,
          image_url:           @resource.image_url,
          audio_url:           @resource.audio_url,
          created_at:          @resource.created_at,
          set_name:            flashcard_set.name,
          deck_name:           deck.name,
          deck_level:          deck.level,
        }
      end
    end
  end
end
