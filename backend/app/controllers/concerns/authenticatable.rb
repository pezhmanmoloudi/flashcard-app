module Authenticatable
  extend ActiveSupport::Concern

  included do
    before_action :authorize_request
  end

  private

  def authorize_request
    token = extract_bearer_token
    return render_error("Missing token", status: :unauthorized) if token.blank?

    payload = JsonWebToken.decode(token)
    @current_user = User.find(payload[:user_id])
  rescue JsonWebToken::TokenExpiredError
    render_error("Token has expired", status: :unauthorized)
  rescue JsonWebToken::InvalidTokenError
    render_error("Invalid token", status: :unauthorized)
  rescue ActiveRecord::RecordNotFound
    render_error("User not found", status: :unauthorized)
  end

  def current_user
    @current_user
  end

  def extract_bearer_token
    header = request.headers["Authorization"]
    header&.start_with?("Bearer ") ? header.split(" ").last : nil
  end
end
