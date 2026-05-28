require "rails_helper"

RSpec.describe "Stats", type: :request do
  let(:user)    { create(:user) }
  let(:deck)    { create(:deck, user: user) }
  let(:token)   { JsonWebToken.encode(user_id: user.id) }
  let(:headers) { { "Authorization" => "Bearer #{token}" } }

  describe "GET /api/v1/stats" do
    context "with no activity" do
      it "returns zero stats" do
        get "/api/v1/stats", headers: headers

        expect(response).to have_http_status(:ok)
        data = response.parsed_body["data"]
        expect(data["total_cards_studied"]).to eq(0)
        expect(data["total_sessions"]).to eq(0)
        expect(data["study_streak"]).to eq(0)
        expect(data["cards_mastered"]).to eq(0)
      end
    end

    context "with completed sessions and mastered cards" do
      let!(:flashcard) { create(:flashcard, deck: deck) }

      before do
        create(:study_session, user: user, deck: deck,
               cards_studied: 8, completed_at: Time.current)
        create(:card_progress, user: user, flashcard: flashcard,
               repetitions: Study::UserStatsQuery::MASTERY_THRESHOLD)
      end

      it "returns aggregated stats" do
        get "/api/v1/stats", headers: headers

        data = response.parsed_body["data"]
        expect(data["total_cards_studied"]).to eq(8)
        expect(data["total_sessions"]).to eq(1)
        expect(data["study_streak"]).to eq(1)
        expect(data["cards_mastered"]).to eq(1)
      end
    end

    it "returns unauthorized without a token" do
      get "/api/v1/stats"
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe "GET /api/v1/decks/:id/stats" do
    context "with no flashcards" do
      it "returns zero stats" do
        get "/api/v1/decks/#{deck.id}/stats", headers: headers

        expect(response).to have_http_status(:ok)
        data = response.parsed_body["data"]
        expect(data["total_cards"]).to eq(0)
        expect(data["due_count"]).to eq(0)
        expect(data["new_count"]).to eq(0)
        expect(data["mastered_count"]).to eq(0)
        expect(data["learning_count"]).to eq(0)
      end
    end

    context "with a mix of cards" do
      let!(:new_card)     { create(:flashcard, deck: deck) }
      let!(:due_card)     { create(:flashcard, deck: deck) }
      let!(:master_card)  { create(:flashcard, deck: deck) }

      before do
        create(:card_progress, user: user, flashcard: due_card,
               repetitions: 1, next_review_at: 1.day.ago)
        create(:card_progress, user: user, flashcard: master_card,
               repetitions: Study::DeckStatsQuery::MASTERY_THRESHOLD,
               next_review_at: 15.days.from_now)
      end

      it "returns correct counts" do
        get "/api/v1/decks/#{deck.id}/stats", headers: headers

        data = response.parsed_body["data"]
        expect(data["total_cards"]).to eq(3)
        expect(data["new_count"]).to eq(1)
        expect(data["due_count"]).to eq(2)
        expect(data["mastered_count"]).to eq(1)
      end
    end

    it "returns not found for another user's deck" do
      other_deck = create(:deck, user: create(:user))

      get "/api/v1/decks/#{other_deck.id}/stats", headers: headers

      expect(response).to have_http_status(:not_found)
    end

    it "returns unauthorized without a token" do
      get "/api/v1/decks/#{deck.id}/stats"
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
