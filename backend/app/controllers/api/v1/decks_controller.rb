module Api
  module V1
    class DecksController < BaseController
      include Authenticatable

      before_action :set_deck, only: [:show, :update, :destroy]

      def index
        decks = Decks::ListDecksQuery.call(user: current_user)
        render_ok(Api::V1::DeckSerializer.collection(decks))
      end

      def show
        render_ok(Api::V1::DeckSerializer.call(@deck))
      end

      def create
        result = Decks::CreateDeckService.call(user: current_user, params: deck_params)

        if result.success?
          render_created(Api::V1::DeckSerializer.call(result.value!))
        else
          render_error(result.failure.join(", "))
        end
      end

      def update
        result = Decks::UpdateDeckService.call(deck: @deck, params: deck_params)

        if result.success?
          render_ok(Api::V1::DeckSerializer.call(result.value!))
        else
          render_error(result.failure.join(", "))
        end
      end

      def destroy
        Decks::DestroyDeckService.call(deck: @deck)
        render_no_content
      end

      private

      def set_deck
        @deck = Decks::FindDeckQuery.call(user: current_user, id: params[:id])
      end

      def deck_params
        params.require(:deck).permit(:name, :description)
      end
    end
  end
end
