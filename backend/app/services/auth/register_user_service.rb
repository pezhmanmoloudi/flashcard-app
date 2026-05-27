module Auth
  class RegisterUserService
    def initialize(params)
      @params = params
    end

    def call
      user = User.new(@params)
      if user.save
        token = JsonWebToken.encode(user_id: user.id)
        { success: true, token: token, user: serialize(user) }
      else
        { success: false, errors: user.errors.full_messages }
      end
    end

    private

    def serialize(user)
      { id: user.id, email: user.email }
    end
  end
end
