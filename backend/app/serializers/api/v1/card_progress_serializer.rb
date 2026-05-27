module Api
  module V1
    class CardProgressSerializer < ApplicationSerializer
      def call
        {
          id:              @resource.id,
          flashcard_id:    @resource.flashcard_id,
          repetitions:     @resource.repetitions,
          easiness_factor: @resource.easiness_factor.to_f,
          interval_days:   @resource.interval_days,
          next_review_at:  @resource.next_review_at,
          due:             @resource.due?
        }
      end
    end
  end
end
