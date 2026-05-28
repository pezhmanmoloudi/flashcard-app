module Quiz
  class SubmitQuizAnswerService < ApplicationService
    def initialize(quiz_question:, user_answer:)
      @quiz_question = quiz_question
      @user_answer   = user_answer.to_s.strip
    end

    def call
      return Failure(["Question has already been answered"]) if @quiz_question.answered?
      return Failure(["Answer cannot be blank"])             if @user_answer.blank?

      correct = @user_answer.downcase == @quiz_question.correct_answer.downcase

      ActiveRecord::Base.transaction do
        @quiz_question.update!(
          user_answer:        @user_answer,
          answered_correctly: correct
        )

        if correct
          @quiz_question.quiz_session.increment!(:correct_answers)
        end
      end

      Success(@quiz_question)
    rescue ActiveRecord::RecordInvalid => e
      Failure([e.message])
    end
  end
end
