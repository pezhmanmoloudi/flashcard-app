module Auth
  class AuthenticateUserService
    def initialize(email:, password:)
      @email = email&.downcase
      @password = password
    end

    def call
      user = User.find_by(email: @email)

      if user&.authenticate(@password)
        token = JsonWebToken.encode(user_id: user.id)
        { success: true, token: token, user: serialize(user) }
      else
        { success: false, errors: ["Invalid email or password"] }
      end
    end

    private

    def serialize(user)
      { id: user.id, email: user.email }
    end
  end
end
