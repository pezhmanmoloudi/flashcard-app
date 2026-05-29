module Api
  module V1
    class StudySessionReviewsController < BaseController
      include Authenticatable

      before_action :set_study_session

      def create
        result = StudySessions::RecordReviewService.call(
          study_session: @study_session,
          flashcard_id:  review_params[:flashcard_id],
          result:        review_params[:result]
        )

        if result.success?
          render_created(Api::V1::CardProgressSerializer.call(result.value!))
        else
          render_error(result.failure.join(", "))
        end
      end

      private

      def set_study_session
        @study_session = current_user.study_sessions.find(params[:study_session_id])
      end

      def review_params
        params.permit(:flashcard_id, :result)
      end
    end
  end
end
