module Api
  module V1
    class ProfilesController < BaseController
      include Authenticatable

      def show
        render_ok(Api::V1::UserSerializer.call(current_user))
      end

      def update_email
        result = Account::UpdateEmailService.call(
          user:  current_user,
          email: email_params[:email]
        )

        if result.success?
          render_ok(Api::V1::UserSerializer.call(result.value!))
        else
          render_error(result.failure.join(", "))
        end
      end

      def update_password
        result = Account::UpdatePasswordService.call(
          user:                  current_user,
          current_password:      password_params[:current_password],
          password:              password_params[:password],
          password_confirmation: password_params[:password_confirmation]
        )

        if result.success?
          render_no_content
        else
          render_error(result.failure.join(", "))
        end
      end

      private

      def email_params
        params.require(:email).permit(:email)
      end

      def password_params
        params.require(:password).permit(:current_password, :password, :password_confirmation)
      end
    end
  end
end
