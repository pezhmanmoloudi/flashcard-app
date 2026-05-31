module Api
  module V1
    class FlashcardsController < BaseController
      include Authenticatable
      include Paginatable

      before_action :set_deck,          only: [:index, :due]
      before_action :set_flashcard_set, only: [:create]
      before_action :set_flashcard,     only: [:show, :update, :destroy]

      def index
        pagy, flashcards = paginate(Flashcards::ListFlashcardsQuery.call(deck: @deck))
        render_collection(Api::V1::FlashcardSerializer.collection(flashcards), pagy)
      end

      def due
        active_set = Study::ActiveSetQuery.call(user: current_user, deck: @deck)
        flashcards = active_set ? Study::SelectDueCardsQuery.call(
          user:             current_user,
          deck:             @deck,
          flashcard_set_id: active_set.id
        ) : []

        render json: { data: Api::V1::FlashcardSerializer.collection(flashcards) }, status: :ok
      end

      def show
        render_ok(Api::V1::FlashcardSerializer.call(@flashcard))
      end

      def create
        result = Flashcards::CreateFlashcardService.call(
          flashcard_set: @flashcard_set,
          params:        flashcard_params
        )

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
        @deck = Decks::FindDeckQuery.call(user: current_user, id: params[:deck_id].presence || params[:id])
      end

      def set_flashcard_set
        @flashcard_set = FlashcardSet.joins(:deck)
                                     .where("decks.user_id = ? OR decks.is_system = ?", current_user.id, true)
                                     .find(params[:flashcard_set_id])
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
