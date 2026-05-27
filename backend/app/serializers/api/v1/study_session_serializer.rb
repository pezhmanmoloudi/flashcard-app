module Api
  module V1
    class StudySessionSerializer < ApplicationSerializer
      def call
        {
          id:            @resource.id,
          deck_id:       @resource.deck_id,
          cards_studied: @resource.cards_studied,
          completed:     @resource.completed?,
          completed_at:  @resource.completed_at,
          created_at:    @resource.created_at
        }
      end
    end
  end
end
