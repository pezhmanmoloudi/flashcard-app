module Api
  module V1
    class QuizQuestionsController < BaseController
      include Authenticatable

      before_action :set_quiz_question

      def answer
        result = Quiz::SubmitQuizAnswerService.call(
          quiz_question: @quiz_question,
          user_answer:   answer_params[:answer]
        )

        if result.success?
          render_ok(Api::V1::QuizQuestionSerializer.call(result.value!))
        else
          render_error(result.failure.join(", "))
        end
      end

      private

      def set_quiz_question
        @quiz_question = QuizQuestion
          .joins(:quiz_session)
          .where(quiz_sessions: { user_id: current_user.id })
          .find(params[:id])
      end

      def answer_params
        params.require(:quiz_question).permit(:answer)
      end
    end
  end
end
