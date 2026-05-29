require "rails_helper"

RSpec.describe "StudySessionReviews", type: :request do
  let(:user)          { create(:user) }
  let(:deck)          { create(:deck, user: user) }
  let(:flashcard_set) { create(:flashcard_set, deck: deck) }
  let(:flashcard)     { create(:flashcard, flashcard_set: flashcard_set) }
  let(:session)       { create(:study_session, user: user, deck: deck) }
  let(:token)         { JsonWebToken.encode(user_id: user.id) }
  let(:headers)       { { "Authorization" => "Bearer #{token}" } }

  describe "POST /api/v1/study_sessions/:study_session_id/reviews" do
    context "with result 'known'" do
      it "returns 201 with CardProgress data" do
        post "/api/v1/study_sessions/#{session.id}/reviews",
             params: { flashcard_id: flashcard.id, result: "known" },
             headers: headers, as: :json

        expect(response).to have_http_status(:created)
        body = response.parsed_body["data"]
        expect(body["flashcard_id"]).to eq(flashcard.id)
        expect(body["repetitions"]).to eq(1)
        expect(body["next_review_at"]).to be_present
      end

      it "increments cards_studied on the session" do
        expect {
          post "/api/v1/study_sessions/#{session.id}/reviews",
               params: { flashcard_id: flashcard.id, result: "known" },
               headers: headers, as: :json
        }.to change { session.reload.cards_studied }.by(1)
      end
    end

    context "with result 'again'" do
      it "returns 201 and resets SM-2 repetitions" do
        create(:card_progress, user: user, flashcard: flashcard, repetitions: 5, interval_days: 30)

        post "/api/v1/study_sessions/#{session.id}/reviews",
             params: { flashcard_id: flashcard.id, result: "again" },
             headers: headers, as: :json

        expect(response).to have_http_status(:created)
        expect(response.parsed_body["data"]["repetitions"]).to eq(0)
      end
    end

    context "with an invalid result" do
      it "returns 422" do
        post "/api/v1/study_sessions/#{session.id}/reviews",
             params: { flashcard_id: flashcard.id, result: "unknown" },
             headers: headers, as: :json

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.parsed_body["error"]).to include("Invalid result")
      end
    end

    context "when the flashcard belongs to a different deck" do
      let(:other_deck)          { create(:deck, user: user) }
      let(:other_flashcard_set) { create(:flashcard_set, deck: other_deck) }
      let(:other_flashcard)     { create(:flashcard, flashcard_set: other_flashcard_set) }

      it "returns 422" do
        post "/api/v1/study_sessions/#{session.id}/reviews",
             params: { flashcard_id: other_flashcard.id, result: "known" },
             headers: headers, as: :json

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context "when the study session belongs to another user" do
      let(:other_user)    { create(:user) }
      let(:other_deck)    { create(:deck, user: other_user) }
      let(:other_session) { create(:study_session, user: other_user, deck: other_deck) }

      it "returns 404" do
        post "/api/v1/study_sessions/#{other_session.id}/reviews",
             params: { flashcard_id: flashcard.id, result: "known" },
             headers: headers, as: :json

        expect(response).to have_http_status(:not_found)
      end
    end

    it "returns 401 without a token" do
      post "/api/v1/study_sessions/#{session.id}/reviews",
           params: { flashcard_id: flashcard.id, result: "known" }, as: :json

      expect(response).to have_http_status(:unauthorized)
    end
  end
end
