module Quiz
  class CompleteQuizService < ApplicationService
    def initialize(quiz_session:)
      @quiz_session = quiz_session
    end

    def call
      return Failure(["Quiz is already completed"]) if @quiz_session.completed?

      @quiz_session.update!(completed_at: Time.current)
      Success(@quiz_session)
    rescue ActiveRecord::RecordInvalid => e
      Failure([e.message])
    end
  end
end
