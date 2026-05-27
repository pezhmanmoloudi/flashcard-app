module Api
  module V1
    class FlashcardSerializer < ApplicationSerializer
      def call
        {
          id:               @resource.id,
          deck_id:          @resource.deck_id,
          front_text:       @resource.front_text,
          back_text:        @resource.back_text,
          source_language:  @resource.source_language,
          target_language:  @resource.target_language,
          example_sentence: @resource.example_sentence,
          image_url:        @resource.image_url,
          audio_url:        @resource.audio_url,
          created_at:       @resource.created_at
        }
      end
    end
  end
end
