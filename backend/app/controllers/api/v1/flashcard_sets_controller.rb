module Api
  module V1
    class FlashcardSetsController < BaseController
      include Authenticatable

      before_action :set_deck,          only: [:index, :create]
      before_action :set_flashcard_set, only: [:show, :update, :destroy]

      def index
        sets = FlashcardSets::ListFlashcardSetsQuery.call(deck: @deck)
        render_ok(Api::V1::FlashcardSetSerializer.collection(sets))
      end

      def show
        render_ok(Api::V1::FlashcardSetSerializer.call(@flashcard_set))
      end

      def create
        result = FlashcardSets::CreateFlashcardSetService.call(deck: @deck, params: flashcard_set_params)

        if result.success?
          render_created(Api::V1::FlashcardSetSerializer.call(result.value!))
        else
          render_error(result.failure.join(", "))
        end
      end

      def update
        result = FlashcardSets::UpdateFlashcardSetService.call(
          flashcard_set: @flashcard_set,
          params:        flashcard_set_params
        )

        if result.success?
          render_ok(Api::V1::FlashcardSetSerializer.call(result.value!))
        else
          render_error(result.failure.join(", "))
        end
      end

      def destroy
        FlashcardSets::DestroyFlashcardSetService.call(flashcard_set: @flashcard_set)
        render_no_content
      end

      private

      def set_deck
        @deck = Decks::FindDeckQuery.call(user: current_user, id: params[:deck_id])
      end

      def set_flashcard_set
        @flashcard_set = FlashcardSet.joins(:deck)
                                     .where("decks.user_id = ? OR decks.is_system = ?", current_user.id, true)
                                     .find(params[:id])
      end

      def flashcard_set_params
        params.require(:flashcard_set).permit(:name, :description, :position)
      end
    end
  end
end
