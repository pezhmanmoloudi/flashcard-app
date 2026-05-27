module Api
  module V1
    class ProfilesController < BaseController
      include Authenticatable

      def show
        render_ok(Api::V1::UserSerializer.call(current_user))
      end
    end
  end
end
