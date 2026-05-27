module Auth
  class AuthenticateUserService < ApplicationService
    def initialize(email:, password:)
      @email    = email&.downcase
      @password = password
    end

    def call
      user = User.find_by(email: @email)
      return Failure(["Invalid email or password"]) unless user&.authenticate(@password)

      token = JsonWebToken.encode(user_id: user.id)
      Success({ token: token, user: Api::V1::UserSerializer.call(user) })
    end
  end
end
