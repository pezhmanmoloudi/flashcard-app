require "rails_helper"

RSpec.describe "Decks", type: :request do
  let(:user)    { create(:user) }
  let(:other)   { create(:user) }
  let(:token)   { JsonWebToken.encode(user_id: user.id) }
  let(:headers) { { "Authorization" => "Bearer #{token}" } }

  describe "GET /api/v1/decks" do
    before { create_list(:deck, 3, user: user) }

    it "returns the current user's decks" do
      get "/api/v1/decks", headers: headers

      expect(response).to have_http_status(:ok)
      expect(response.parsed_body["data"].length).to eq(3)
    end

    it "includes pagination meta" do
      get "/api/v1/decks", headers: headers

      meta = response.parsed_body["meta"]
      expect(meta["current_page"]).to eq(1)
      expect(meta["total_count"]).to eq(3)
      expect(meta["per_page"]).to eq(25)
    end

    it "returns unauthorized without a token" do
      get "/api/v1/decks"

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe "GET /api/v1/decks/:id" do
    let(:deck) { create(:deck, user: user) }

    it "returns the deck" do
      get "/api/v1/decks/#{deck.id}", headers: headers

      expect(response).to have_http_status(:ok)
      expect(response.parsed_body["data"]["name"]).to eq(deck.name)
    end

    it "returns not found for another user's deck" do
      other_deck = create(:deck, user: other)

      get "/api/v1/decks/#{other_deck.id}", headers: headers

      expect(response).to have_http_status(:not_found)
    end
  end

  describe "POST /api/v1/decks" do
    context "with valid params" do
      it "creates a deck" do
        post "/api/v1/decks",
             params: { deck: { name: "German Basics", description: "Starter deck" } },
             headers: headers, as: :json

        expect(response).to have_http_status(:created)
        expect(response.parsed_body["data"]["name"]).to eq("German Basics")
      end
    end

    context "with missing name" do
      it "returns unprocessable entity" do
        post "/api/v1/decks",
             params: { deck: { name: "" } },
             headers: headers, as: :json

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.parsed_body).to include("error")
      end
    end
  end

  describe "PATCH /api/v1/decks/:id" do
    let(:deck) { create(:deck, user: user) }

    it "updates the deck" do
      patch "/api/v1/decks/#{deck.id}",
            params: { deck: { name: "Updated Name" } },
            headers: headers, as: :json

      expect(response).to have_http_status(:ok)
      expect(response.parsed_body["data"]["name"]).to eq("Updated Name")
    end

    it "returns not found for another user's deck" do
      other_deck = create(:deck, user: other)

      patch "/api/v1/decks/#{other_deck.id}",
            params: { deck: { name: "Hacked" } },
            headers: headers, as: :json

      expect(response).to have_http_status(:not_found)
    end
  end

  describe "DELETE /api/v1/decks/:id" do
    let(:deck) { create(:deck, user: user) }

    it "destroys the deck" do
      delete "/api/v1/decks/#{deck.id}", headers: headers

      expect(response).to have_http_status(:no_content)
      expect(Deck.exists?(deck.id)).to be(false)
    end

    it "returns not found for another user's deck" do
      other_deck = create(:deck, user: other)

      delete "/api/v1/decks/#{other_deck.id}", headers: headers

      expect(response).to have_http_status(:not_found)
    end
  end
end
