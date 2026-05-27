module Api
  module V1
    class DecksController < BaseController
      include Authenticatable

      before_action :set_deck, only: [:show, :update, :destroy]

      def index
        decks = current_user.decks.ordered
        render_ok(decks.map { |d| serialize(d) })
      end

      def show
        render_ok(serialize(@deck))
      end

      def create
        deck = current_user.decks.build(deck_params)

        if deck.save
          render_created(serialize(deck))
        else
          render_error(deck.errors.full_messages.join(", "))
        end
      end

      def update
        if @deck.update(deck_params)
          render_ok(serialize(@deck))
        else
          render_error(@deck.errors.full_messages.join(", "))
        end
      end

      def destroy
        @deck.destroy
        render_no_content
      end

      private

      def set_deck
        @deck = current_user.decks.find(params[:id])
      end

      def deck_params
        params.require(:deck).permit(:name, :description)
      end

      def serialize(deck)
        {
          id: deck.id,
          name: deck.name,
          description: deck.description,
          created_at: deck.created_at
        }
      end
    end
  end
end
