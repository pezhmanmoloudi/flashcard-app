module Api
  module V1
    class StatsController < BaseController
      include Authenticatable

      def show
        stats = Study::UserStatsQuery.call(user: current_user)
        render_ok(Api::V1::UserStatsSerializer.call(stats))
      end
    end
  end
end
