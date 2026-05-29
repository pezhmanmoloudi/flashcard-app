module Api
  module V1
    class DecksController < BaseController
      include Authenticatable
      include Paginatable

      before_action :set_deck, only: [:show, :update, :destroy, :stats]

      def index
        pagy, decks  = paginate(Decks::ListDecksQuery.call(user: current_user))
        decks_array  = decks.to_a
        progress_map = Decks::DeckProgressQuery.call(user: current_user, decks: decks_array)

        by_group   = decks_array.group_by { |d| [d.language_pair, d.level] }
        unlock_map = {}
        by_group.each do |_group_key, group|
          group.each_with_index do |deck, idx|
            unlock_map[deck.id] = idx.zero? || begin
              prev      = progress_map[group[idx - 1].id]
              prev_tot  = prev&.dig(:total_count).to_i
              prev_done = prev&.dig(:completed_count).to_i
              prev_tot > 0 && prev_done >= prev_tot
            end
          end
        end

        data = decks_array.map do |deck|
          p     = progress_map[deck.id] || { completed_count: 0, total_count: 0 }
          total = p[:total_count]
          done  = p[:completed_count]
          Api::V1::DeckSerializer.with_progress(
            deck,
            is_completed:          total > 0 && done >= total,
            is_unlocked:           unlock_map[deck.id] || false,
            completed_cards_count: done,
            total_cards_count:     total,
            progress_percentage:   total > 0 ? (done.to_f / total * 100).round : 0
          )
        end

        render_collection(data, pagy)
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

      def stats
        deck_stats = Study::DeckStatsQuery.call(user: current_user, deck: @deck)
        render_ok(Api::V1::DeckStatsSerializer.call(deck_stats))
      end

      private

      def set_deck
        @deck = Decks::FindDeckQuery.call(user: current_user, id: params[:id])
      end

      def deck_params
        params.require(:deck).permit(:name, :description, :level, :language_pair, :position)
      end
    end
  end
end
