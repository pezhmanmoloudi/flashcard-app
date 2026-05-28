module Account
  class UpdateEmailService < ApplicationService
    def initialize(user:, email:)
      @user  = user
      @email = email
    end

    def call
      return Failure(["Email is required"]) if @email.blank?
      return Failure(["Email is already taken"]) if email_taken?
      return Failure(@user.errors.full_messages) unless @user.update(email: @email)

      Success(@user)
    end

    private

    def email_taken?
      User.where.not(id: @user.id).exists?(email: @email.downcase)
    end
  end
end
