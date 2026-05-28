module Api
  module V1
    class QuizSessionSerializer < ApplicationSerializer
      def call
        {
          id:              @resource.id,
          deck_id:         @resource.deck_id,
          quiz_type:       @resource.quiz_type,
          total_questions: @resource.total_questions,
          correct_answers: @resource.correct_answers,
          score:           @resource.score,
          completed:       @resource.completed?,
          completed_at:    @resource.completed_at,
          created_at:      @resource.created_at,
          questions:       QuizQuestionSerializer.collection(@resource.quiz_questions)
        }
      end
    end
  end
end
