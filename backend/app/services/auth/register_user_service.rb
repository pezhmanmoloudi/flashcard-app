module Auth
  class RegisterUserService < ApplicationService
    def initialize(params:)
      @params = params
    end

    def call
      user = User.new(@params)
      return Failure(user.errors.full_messages) unless user.save

      token = JsonWebToken.encode(user_id: user.id)
      Success({ token: token, user: Api::V1::UserSerializer.call(user) })
    end
  end
end
