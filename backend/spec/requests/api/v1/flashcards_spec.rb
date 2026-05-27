require "rails_helper"

RSpec.describe "Flashcards", type: :request do
  let(:user)    { create(:user) }
  let(:other)   { create(:user) }
  let(:deck)    { create(:deck, user: user) }
  let(:token)   { JsonWebToken.encode(user_id: user.id) }
  let(:headers) { { "Authorization" => "Bearer #{token}" } }

  let(:valid_params) do
    {
      flashcard: {
        front_text:       "das Haus",
        back_text:        "the house",
        source_language:  "german",
        target_language:  "english",
        example_sentence: "Das Haus ist groß."
      }
    }
  end

  describe "GET /api/v1/decks/:deck_id/flashcards" do
    before { create_list(:flashcard, 3, deck: deck) }

    it "returns all flashcards for the deck" do
      get "/api/v1/decks/#{deck.id}/flashcards", headers: headers

      expect(response).to have_http_status(:ok)
      expect(response.parsed_body["data"].length).to eq(3)
    end

    it "includes pagination meta" do
      get "/api/v1/decks/#{deck.id}/flashcards", headers: headers

      meta = response.parsed_body["meta"]
      expect(meta["current_page"]).to eq(1)
      expect(meta["total_count"]).to eq(3)
    end

    it "returns not found for another user's deck" do
      other_deck = create(:deck, user: other)

      get "/api/v1/decks/#{other_deck.id}/flashcards", headers: headers

      expect(response).to have_http_status(:not_found)
    end

    it "returns unauthorized without a token" do
      get "/api/v1/decks/#{deck.id}/flashcards"

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe "GET /api/v1/flashcards/:id" do
    let(:flashcard) { create(:flashcard, deck: deck) }

    it "returns the flashcard" do
      get "/api/v1/flashcards/#{flashcard.id}", headers: headers

      expect(response).to have_http_status(:ok)
      expect(response.parsed_body["data"]["front_text"]).to eq(flashcard.front_text)
    end

    it "returns not found for another user's flashcard" do
      other_flashcard = create(:flashcard, deck: create(:deck, user: other))

      get "/api/v1/flashcards/#{other_flashcard.id}", headers: headers

      expect(response).to have_http_status(:not_found)
    end
  end

  describe "POST /api/v1/decks/:deck_id/flashcards" do
    context "with valid params" do
      it "creates a flashcard" do
        post "/api/v1/decks/#{deck.id}/flashcards",
             params: valid_params, headers: headers, as: :json

        expect(response).to have_http_status(:created)
        expect(response.parsed_body["data"]["front_text"]).to eq("das Haus")
        expect(response.parsed_body["data"]["source_language"]).to eq("german")
      end
    end

    context "with missing front_text" do
      it "returns unprocessable entity" do
        post "/api/v1/decks/#{deck.id}/flashcards",
             params: { flashcard: valid_params[:flashcard].merge(front_text: "") },
             headers: headers, as: :json

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.parsed_body).to include("error")
      end
    end

    context "with same source and target language" do
      it "returns unprocessable entity" do
        post "/api/v1/decks/#{deck.id}/flashcards",
             params: { flashcard: valid_params[:flashcard].merge(target_language: "german") },
             headers: headers, as: :json

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.parsed_body).to include("error")
      end
    end

    context "with unsupported language" do
      it "returns unprocessable entity" do
        post "/api/v1/decks/#{deck.id}/flashcards",
             params: { flashcard: valid_params[:flashcard].merge(source_language: "french") },
             headers: headers, as: :json

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /api/v1/flashcards/:id" do
    let(:flashcard) { create(:flashcard, deck: deck) }

    it "updates the flashcard" do
      patch "/api/v1/flashcards/#{flashcard.id}",
            params: { flashcard: { front_text: "der Hund" } },
            headers: headers, as: :json

      expect(response).to have_http_status(:ok)
      expect(response.parsed_body["data"]["front_text"]).to eq("der Hund")
    end

    it "returns not found for another user's flashcard" do
      other_flashcard = create(:flashcard, deck: create(:deck, user: other))

      patch "/api/v1/flashcards/#{other_flashcard.id}",
            params: { flashcard: { front_text: "hacked" } },
            headers: headers, as: :json

      expect(response).to have_http_status(:not_found)
    end
  end

  describe "DELETE /api/v1/flashcards/:id" do
    let(:flashcard) { create(:flashcard, deck: deck) }

    it "destroys the flashcard" do
      delete "/api/v1/flashcards/#{flashcard.id}", headers: headers

      expect(response).to have_http_status(:no_content)
      expect(Flashcard.exists?(flashcard.id)).to be(false)
    end

    it "returns not found for another user's flashcard" do
      other_flashcard = create(:flashcard, deck: create(:deck, user: other))

      delete "/api/v1/flashcards/#{other_flashcard.id}", headers: headers

      expect(response).to have_http_status(:not_found)
    end
  end
end
