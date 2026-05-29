module Api
  module V1
    class StudyQueueController < BaseController
      include Authenticatable

      def index
        queue = Study::ReviewQueueQuery.call(user: current_user)
        render json: { data: queue }, status: :ok
      end
    end
  end
end
