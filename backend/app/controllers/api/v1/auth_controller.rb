module Api
  module V1
    class AuthController < BaseController
      def signup
        result = Auth::RegisterUserService.new(signup_params).call

        if result[:success]
          render_created({ token: result[:token], user: result[:user] })
        else
          render_error(result[:errors].join(", "))
        end
      end

      def login
        result = Auth::AuthenticateUserService.new(
          email: login_params[:email],
          password: login_params[:password]
        ).call

        if result[:success]
          render_ok({ token: result[:token], user: result[:user] })
        else
          render_error(result[:errors].join(", "), status: :unauthorized)
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
