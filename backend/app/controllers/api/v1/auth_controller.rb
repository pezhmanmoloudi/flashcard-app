module Api
  module V1
    class AuthController < BaseController
      def signup
        result = Auth::RegisterUserService.call(params: signup_params)

        if result.success?
          render_created(result.value!)
        else
          render_error(result.failure.join(", "))
        end
      end

      def login
        result = Auth::AuthenticateUserService.call(
          email:    login_params[:email],
          password: login_params[:password]
        )

        if result.success?
          render_ok(result.value!)
        else
          render_error(result.failure.join(", "), status: :unauthorized)
        end
      end

      private

      def signup_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end

      def login_params
        params.require(:user).permit(:email, :password)
      end
    end
  end
end
