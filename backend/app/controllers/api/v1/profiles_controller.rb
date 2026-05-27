module Api
  module V1
    class ProfilesController < BaseController
      include Authenticatable

      def show
        render_ok({ user: { id: current_user.id, email: current_user.email } })
      end
    end
  end
end
