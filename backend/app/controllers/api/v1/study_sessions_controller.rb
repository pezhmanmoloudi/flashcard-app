module Api
  module V1
    class StudySessionsController < BaseController
      include Authenticatable
      include Paginatable

      before_action :set_deck,          only: [:create]
      before_action :set_study_session, only: [:update, :complete]

      def index
        pagy, sessions = paginate(Study::ListStudySessionsQuery.call(user: current_user))
        render_collection(Api::V1::StudySessionSerializer.collection(sessions), pagy)
      end

      def create
        result = Study::CreateStudySessionService.call(user: current_user, deck: @deck)

        if result.success?
          render_created(Api::V1::StudySessionSerializer.call(result.value!))
        else
          render_error(result.failure.join(", "))
        end
      end

      def update
        result = Study::UpdateStudySessionService.call(
          study_session: @study_session,
          params:        study_session_params
        )

        if result.success?
          render_ok(Api::V1::StudySessionSerializer.call(result.value!))
        else
          render_error(result.failure.join(", "))
        end
      end

      def complete
        result = StudySessions::CompleteSessionService.call(study_session: @study_session)

        if result.success?
          render_ok(Api::V1::StudySessionSerializer.call(result.value!))
        else
          render_error(result.failure.join(", "))
        end
      end

      private

      def set_deck
        @deck = Decks::FindDeckQuery.call(user: current_user, id: params[:deck_id])
      end

      def set_study_session
        @study_session = current_user.study_sessions.find(params[:id])
      end

      def study_session_params
        params.require(:study_session).permit(:cards_studied)
      end
    end
  end
end
