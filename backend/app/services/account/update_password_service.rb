module Account
  class UpdatePasswordService < ApplicationService
    def initialize(user:, current_password:, password:, password_confirmation:)
      @user                  = user
      @current_password      = current_password
      @password              = password
      @password_confirmation = password_confirmation
    end

    def call
      return Failure(["Current password is incorrect"]) unless @user.authenticate(@current_password)
      return Failure(["Password confirmation doesn't match"]) if @password != @password_confirmation

      return Failure(@user.errors.full_messages) unless @user.update(
        password: @password,
        password_confirmation: @password_confirmation
      )

      Success(nil)
    end
  end
end
