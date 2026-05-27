module Api
  module V1
    class FlashcardsController < BaseController
      include Authenticatable

      before_action :set_deck,      only: [:index, :create]
      before_action :set_flashcard, only: [:show, :update, :destroy]

      def index
        render_ok(@deck.flashcards.ordered.map { |f| serialize(f) })
      end

      def show
        render_ok(serialize(@flashcard))
      end

      def create
        flashcard = @deck.flashcards.build(flashcard_params)

        if flashcard.save
          render_created(serialize(flashcard))
        else
          render_error(flashcard.errors.full_messages.join(", "))
        end
      end

      def update
        if @flashcard.update(flashcard_params)
          render_ok(serialize(@flashcard))
        else
          render_error(@flashcard.errors.full_messages.join(", "))
        end
      end

      def destroy
        @flashcard.destroy
        render_no_content
      end

      private

      def set_deck
        @deck = current_user.decks.find(params[:deck_id])
      end

      def set_flashcard
        # Joins through deck to enforce ownership without needing deck_id in URL
        @flashcard = Flashcard.joins(:deck)
                               .where(decks: { user_id: current_user.id })
                               .find(params[:id])
      end

      def flashcard_params
        params.require(:flashcard).permit(
          :front_text, :back_text,
          :source_language, :target_language,
          :example_sentence, :image_url, :audio_url
        )
      end

      def serialize(flashcard)
        {
          id:               flashcard.id,
          deck_id:          flashcard.deck_id,
          front_text:       flashcard.front_text,
          back_text:        flashcard.back_text,
          source_language:  flashcard.source_language,
          target_language:  flashcard.target_language,
          example_sentence: flashcard.example_sentence,
          image_url:        flashcard.image_url,
          audio_url:        flashcard.audio_url,
          created_at:       flashcard.created_at
        }
      end
    end
  end
end
