module Api
  module V1
    class QuizSessionsController < BaseController
      include Authenticatable
      include Paginatable

      before_action :set_deck,         only: [:create]
      before_action :set_quiz_session, only: [:show, :update]

      def index
        pagy, sessions = paginate(Quiz::ListQuizSessionsQuery.call(user: current_user))
        render_collection(Api::V1::QuizSessionSerializer.collection(sessions), pagy)
      end

      def show
        render_ok(Api::V1::QuizSessionSerializer.call(@quiz_session))
      end

      def create
        result = Quiz::GenerateQuizService.call(
          user:      current_user,
          deck:      @deck,
          quiz_type: quiz_session_params[:quiz_type] || "mixed",
          count:     quiz_session_params[:count] || 10
        )

        if result.success?
          render_created(Api::V1::QuizSessionSerializer.call(result.value!))
        else
          render_error(result.failure.join(", "))
        end
      end

      def update
        result = Quiz::CompleteQuizService.call(quiz_session: @quiz_session)

        if result.success?
          render_ok(Api::V1::QuizSessionSerializer.call(result.value!))
        else
          render_error(result.failure.join(", "))
        end
      end

      private

      def set_deck
        @deck = Decks::FindDeckQuery.call(user: current_user, id: params[:deck_id])
      end

      def set_quiz_session
        @quiz_session = current_user.quiz_sessions
                                    .includes(quiz_questions: :flashcard)
                                    .find(params[:id])
      end

      def quiz_session_params
        params.permit(:quiz_type, :count)
      end
    end
  end
end
