require "rails_helper"

RSpec.describe "CardProgresses", type: :request do
  let(:user)      { create(:user) }
  let(:deck)      { create(:deck, user: user) }
  let(:flashcard) { create(:flashcard, deck: deck) }
  let(:token)     { JsonWebToken.encode(user_id: user.id) }
  let(:headers)   { { "Authorization" => "Bearer #{token}" } }

  describe "POST /api/v1/flashcards/:flashcard_id/progress" do
    it "creates progress for a flashcard" do
      post "/api/v1/flashcards/#{flashcard.id}/progress",
           params: { card_progress: { repetitions: 0, easiness_factor: 2.5, interval_days: 0 } },
           headers: headers, as: :json

      expect(response).to have_http_status(:created)
      expect(response.parsed_body["data"]["flashcard_id"]).to eq(flashcard.id)
      expect(response.parsed_body["data"]["easiness_factor"]).to eq(2.5)
    end

    it "returns error for duplicate progress" do
      create(:card_progress, user: user, flashcard: flashcard)

      post "/api/v1/flashcards/#{flashcard.id}/progress",
           params: { card_progress: { repetitions: 0 } },
           headers: headers, as: :json

      expect(response).to have_http_status(:unprocessable_entity)
    end

    it "returns not found for another user's flashcard" do
      other_flashcard = create(:flashcard, deck: create(:deck, user: create(:user)))

      post "/api/v1/flashcards/#{other_flashcard.id}/progress",
           params: { card_progress: { repetitions: 0 } },
           headers: headers, as: :json

      expect(response).to have_http_status(:not_found)
    end
  end

  describe "GET /api/v1/flashcards/:flashcard_id/progress" do
    it "returns progress for a flashcard" do
      create(:card_progress, user: user, flashcard: flashcard, repetitions: 3)

      get "/api/v1/flashcards/#{flashcard.id}/progress", headers: headers

      expect(response).to have_http_status(:ok)
      expect(response.parsed_body["data"]["repetitions"]).to eq(3)
      expect(response.parsed_body["data"]).to include("due")
    end

    it "returns not found when no progress exists" do
      get "/api/v1/flashcards/#{flashcard.id}/progress", headers: headers

      expect(response).to have_http_status(:not_found)
    end
  end

  describe "PATCH /api/v1/flashcards/:flashcard_id/progress" do
    let!(:progress) { create(:card_progress, user: user, flashcard: flashcard) }

    it "updates the progress after a review" do
      future = 3.days.from_now.iso8601

      patch "/api/v1/flashcards/#{flashcard.id}/progress",
            params: { card_progress: { repetitions: 1, interval_days: 3, next_review_at: future } },
            headers: headers, as: :json

      expect(response).to have_http_status(:ok)
      expect(response.parsed_body["data"]["repetitions"]).to eq(1)
      expect(response.parsed_body["data"]["interval_days"]).to eq(3)
    end
  end
end
