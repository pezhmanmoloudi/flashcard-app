module Api
  module V1
    class HealthController < BaseController
      def show
        render_ok({ status: "ok" })
      end
    end
  end
end
