require "rails_helper"

RSpec.describe "StudySessions", type: :request do
  let(:user)    { create(:user) }
  let(:deck)    { create(:deck, user: user) }
  let(:token)   { JsonWebToken.encode(user_id: user.id) }
  let(:headers) { { "Authorization" => "Bearer #{token}" } }

  describe "POST /api/v1/decks/:deck_id/study_sessions" do
    it "starts a new study session" do
      post "/api/v1/decks/#{deck.id}/study_sessions", headers: headers

      expect(response).to have_http_status(:created)
      expect(response.parsed_body["data"]["deck_id"]).to eq(deck.id)
      expect(response.parsed_body["data"]["completed"]).to be(false)
      expect(response.parsed_body["data"]["cards_studied"]).to eq(0)
    end

    it "returns not found for another user's deck" do
      other_deck = create(:deck, user: create(:user))

      post "/api/v1/decks/#{other_deck.id}/study_sessions", headers: headers

      expect(response).to have_http_status(:not_found)
    end

    it "returns unauthorized without a token" do
      post "/api/v1/decks/#{deck.id}/study_sessions"

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe "GET /api/v1/study_sessions" do
    before { create_list(:study_session, 3, user: user, deck: deck) }

    it "returns all study sessions for the current user" do
      get "/api/v1/study_sessions", headers: headers

      expect(response).to have_http_status(:ok)
      expect(response.parsed_body["data"].length).to eq(3)
    end

    it "includes pagination meta" do
      get "/api/v1/study_sessions", headers: headers

      meta = response.parsed_body["meta"]
      expect(meta["current_page"]).to eq(1)
      expect(meta["total_count"]).to eq(3)
    end

    it "does not return other users' sessions" do
      create(:study_session, user: create(:user), deck: create(:deck, user: create(:user)))

      get "/api/v1/study_sessions", headers: headers

      expect(response.parsed_body["data"].length).to eq(3)
    end
  end

  describe "PATCH /api/v1/study_sessions/:id" do
    let(:study_session) { create(:study_session, user: user, deck: deck) }

    it "updates cards_studied" do
      patch "/api/v1/study_sessions/#{study_session.id}",
            params: { study_session: { cards_studied: 10 } },
            headers: headers, as: :json

      expect(response).to have_http_status(:ok)
      expect(response.parsed_body["data"]["cards_studied"]).to eq(10)
    end

    it "ignores completed_at in update (must use /complete instead)" do
      patch "/api/v1/study_sessions/#{study_session.id}",
            params: { study_session: { cards_studied: 5, completed_at: Time.current.iso8601 } },
            headers: headers, as: :json

      expect(response).to have_http_status(:ok)
      expect(response.parsed_body["data"]["completed"]).to be(false)
    end

    it "returns not found for another user's session" do
      other_session = create(:study_session, user: create(:user), deck: create(:deck, user: create(:user)))

      patch "/api/v1/study_sessions/#{other_session.id}",
            params: { study_session: { cards_studied: 5 } },
            headers: headers, as: :json

      expect(response).to have_http_status(:not_found)
    end
  end

  describe "POST /api/v1/study_sessions/:id/complete" do
    let(:study_session) { create(:study_session, user: user, deck: deck) }

    it "marks the session as completed" do
      post "/api/v1/study_sessions/#{study_session.id}/complete", headers: headers

      expect(response).to have_http_status(:ok)
      expect(response.parsed_body["data"]["completed"]).to be(true)
      expect(response.parsed_body["data"]["completed_at"]).to be_present
    end

    it "is idempotent — completing twice returns ok" do
      study_session.update!(completed_at: Time.current)

      post "/api/v1/study_sessions/#{study_session.id}/complete", headers: headers

      expect(response).to have_http_status(:ok)
      expect(response.parsed_body["data"]["completed"]).to be(true)
    end

    it "returns not found for another user's session" do
      other_session = create(:study_session, user: create(:user), deck: create(:deck, user: create(:user)))

      post "/api/v1/study_sessions/#{other_session.id}/complete", headers: headers

      expect(response).to have_http_status(:not_found)
    end
  end
end
