module Api
  module V1
    class ReviewSessionSerializer < ApplicationSerializer
      def call
        {
          id:             @resource.id,
          language_pair:  @resource.language_pair,
          cards_reviewed: @resource.cards_reviewed,
          completed:      @resource.completed?,
          completed_at:   @resource.completed_at,
          created_at:     @resource.created_at,
        }
      end
    end
  end
end
