module Api
  module V1
    class CardProgressesController < BaseController
      include Authenticatable

      before_action :set_flashcard

      def show
        progress = @flashcard.card_progress

        return render_error("No progress found", status: :not_found) unless progress

        render_ok(serialize(progress))
      end

      def create
        progress = CardProgress.new(
          card_progress_params.merge(user: current_user, flashcard: @flashcard)
        )

        if progress.save
          render_created(serialize(progress))
        else
          render_error(progress.errors.full_messages.join(", "))
        end
      end

      def update
        progress = current_user.card_progresses.find_by(flashcard: @flashcard)

        return render_error("No progress found", status: :not_found) unless progress

        if progress.update(card_progress_params)
          render_ok(serialize(progress))
        else
          render_error(progress.errors.full_messages.join(", "))
        end
      end

      private

      def set_flashcard
        @flashcard = Flashcard.joins(:deck)
                               .where(decks: { user_id: current_user.id })
                               .find(params[:flashcard_id])
      end

      def card_progress_params
        params.require(:card_progress).permit(
          :repetitions, :easiness_factor, :interval_days, :next_review_at
        )
      end

      def serialize(progress)
        {
          id:              progress.id,
          flashcard_id:    progress.flashcard_id,
          repetitions:     progress.repetitions,
          easiness_factor: progress.easiness_factor.to_f,
          interval_days:   progress.interval_days,
          next_review_at:  progress.next_review_at,
          due:             progress.due?
        }
      end
    end
  end
end
