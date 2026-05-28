module Api
  module V1
    class QuizQuestionSerializer < ApplicationSerializer
      def call
        {
          id:                 @resource.id,
          quiz_session_id:    @resource.quiz_session_id,
          flashcard_id:       @resource.flashcard_id,
          question_type:      @resource.question_type,
          prompt:             @resource.prompt,
          options:            @resource.options,
          correct_answer:     @resource.correct_answer,
          user_answer:        @resource.user_answer,
          answered_correctly: @resource.answered_correctly,
          answered:           @resource.answered?,
          position:           @resource.position
        }
      end
    end
  end
end
