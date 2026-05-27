module Api
  module V1
    class CardProgressesController < BaseController
      include Authenticatable

      before_action :set_flashcard

      def show
        progress = Study::FindCardProgressQuery.call(user: current_user, flashcard: @flashcard)
        return render_error("No progress found", status: :not_found) unless progress

        render_ok(Api::V1::CardProgressSerializer.call(progress))
      end

      def create
        result = Study::CreateCardProgressService.call(
          user:      current_user,
          flashcard: @flashcard,
          params:    card_progress_params
        )

        if result.success?
          render_created(Api::V1::CardProgressSerializer.call(result.value!))
        else
          render_error(result.failure.join(", "))
        end
      end

      def update
        progress = Study::FindCardProgressQuery.call(user: current_user, flashcard: @flashcard)
        return render_error("No progress found", status: :not_found) unless progress

        result = Study::UpdateCardProgressService.call(progress: progress, params: card_progress_params)

        if result.success?
          render_ok(Api::V1::CardProgressSerializer.call(result.value!))
        else
          render_error(result.failure.join(", "))
        end
      end

      private

      def set_flashcard
        @flashcard = Flashcards::FindFlashcardQuery.call(user: current_user, id: params[:flashcard_id])
      end

      def card_progress_params
        params.require(:card_progress).permit(
          :repetitions, :easiness_factor, :interval_days, :next_review_at
        )
      end
    end
  end
end
