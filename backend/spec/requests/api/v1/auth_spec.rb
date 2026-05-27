require "rails_helper"

RSpec.describe "Auth", type: :request do
  describe "POST /api/v1/auth/signup" do
    let(:valid_params) do
      { user: { email: "new@example.com", password: "password123", password_confirmation: "password123" } }
    end

    context "with valid params" do
      it "creates a user and returns a token" do
        post "/api/v1/auth/signup", params: valid_params, as: :json

        expect(response).to have_http_status(:created)
        expect(response.parsed_body).to include("token", "user")
        expect(response.parsed_body["user"]["email"]).to eq("new@example.com")
      end
    end

    context "with duplicate email" do
      before { create(:user, email: "new@example.com") }

      it "returns unprocessable entity" do
        post "/api/v1/auth/signup", params: valid_params, as: :json

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.parsed_body).to include("error")
      end
    end

    context "with missing password" do
      it "returns unprocessable entity" do
        post "/api/v1/auth/signup",
             params: { user: { email: "new@example.com", password: "" } },
             as: :json

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.parsed_body).to include("error")
      end
    end
  end

  describe "POST /api/v1/auth/login" do
    let!(:user) { create(:user, email: "test@example.com", password: "password123") }

    context "with valid credentials" do
      it "returns a token and user" do
        post "/api/v1/auth/login",
             params: { user: { email: "test@example.com", password: "password123" } },
             as: :json

        expect(response).to have_http_status(:ok)
        expect(response.parsed_body).to include("token", "user")
        expect(response.parsed_body["user"]["email"]).to eq("test@example.com")
      end
    end

    context "with wrong password" do
      it "returns unauthorized" do
        post "/api/v1/auth/login",
             params: { user: { email: "test@example.com", password: "wrongpass" } },
             as: :json

        expect(response).to have_http_status(:unauthorized)
        expect(response.parsed_body).to include("error")
      end
    end

    context "with non-existent email" do
      it "returns unauthorized" do
        post "/api/v1/auth/login",
             params: { user: { email: "ghost@example.com", password: "password123" } },
             as: :json

        expect(response).to have_http_status(:unauthorized)
        expect(response.parsed_body).to include("error")
      end
    end
  end
end
