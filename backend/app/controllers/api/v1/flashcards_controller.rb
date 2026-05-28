module Api
  module V1
    class FlashcardsController < BaseController
      include Authenticatable
      include Paginatable

      before_action :set_deck,         only: [:index, :create]
      before_action :set_deck_by_id,   only: [:due]
      before_action :set_flashcard,    only: [:show, :update, :destroy]

      def index
        pagy, flashcards = paginate(Flashcards::ListFlashcardsQuery.call(deck: @deck))
        render_collection(Api::V1::FlashcardSerializer.collection(flashcards), pagy)
      end

      def due
        flashcards = Study::SelectDueCardsQuery.call(user: current_user, deck: @deck)
        render json: { data: Api::V1::FlashcardSerializer.collection(flashcards) }, status: :ok
      end

      def show
        render_ok(Api::V1::FlashcardSerializer.call(@flashcard))
      end

      def create
        result = Flashcards::CreateFlashcardService.call(deck: @deck, params: flashcard_params)

        if result.success?
          render_created(Api::V1::FlashcardSerializer.call(result.value!))
        else
          render_error(result.failure.join(", "))
        end
      end

      def update
        result = Flashcards::UpdateFlashcardService.call(flashcard: @flashcard, params: flashcard_params)

        if result.success?
          render_ok(Api::V1::FlashcardSerializer.call(result.value!))
        else
          render_error(result.failure.join(", "))
        end
      end

      def destroy
        Flashcards::DestroyFlashcardService.call(flashcard: @flashcard)
        render_no_content
      end

      private

      def set_deck
        @deck = Decks::FindDeckQuery.call(user: current_user, id: params[:deck_id])
      end

      def set_deck_by_id
        @deck = Decks::FindDeckQuery.call(user: current_user, id: params[:id])
      end

      def set_flashcard
        @flashcard = Flashcards::FindFlashcardQuery.call(user: current_user, id: params[:id])
      end

      def flashcard_params
        params.require(:flashcard).permit(
          :front_text, :back_text,
          :source_language, :target_language,
          :example_sentence, :translated_sentence, :grammar_notes,
          :image_url, :audio_url
        )
      end
    end
  end
end
