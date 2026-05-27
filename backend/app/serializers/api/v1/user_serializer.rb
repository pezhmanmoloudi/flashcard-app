module Api
  module V1
    class UserSerializer < ApplicationSerializer
      def call
        {
          id:    @resource.id,
          email: @resource.email
        }
      end
    end
  end
end
