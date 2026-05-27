require "rails_helper"

RSpec.describe "GET /api/v1/profile", type: :request do
  let(:user) { create(:user) }

  def auth_headers(token)
    { "Authorization" => "Bearer #{token}" }
  end

  context "with a valid token" do
    it "returns the current user" do
      token = JsonWebToken.encode(user_id: user.id)

      get "/api/v1/profile", headers: auth_headers(token)

      expect(response).to have_http_status(:ok)
      expect(response.parsed_body["user"]["email"]).to eq(user.email)
    end
  end

  context "with an invalid token" do
    it "returns unauthorized" do
      get "/api/v1/profile", headers: auth_headers("not.a.valid.token")

      expect(response).to have_http_status(:unauthorized)
      expect(response.parsed_body["error"]).to eq("Invalid token")
    end
  end

  context "with an expired token" do
    it "returns unauthorized" do
      expired_token = JWT.encode(
        { user_id: user.id, exp: 1.hour.ago.to_i },
        Rails.application.secret_key_base,
        "HS256"
      )

      get "/api/v1/profile", headers: auth_headers(expired_token)

      expect(response).to have_http_status(:unauthorized)
      expect(response.parsed_body["error"]).to eq("Token has expired")
    end
  end

  context "without a token" do
    it "returns unauthorized" do
      get "/api/v1/profile"

      expect(response).to have_http_status(:unauthorized)
      expect(response.parsed_body["error"]).to eq("Missing token")
    end
  end
end
