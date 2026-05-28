require "rails_helper"

RSpec.describe "DueFlashcards", type: :request do
  let(:user)    { create(:user) }
  let(:deck)    { create(:deck, user: user) }
  let(:token)   { JsonWebToken.encode(user_id: user.id) }
  let(:headers) { { "Authorization" => "Bearer #{token}" } }

  describe "GET /api/v1/decks/:id/due_flashcards" do
    context "with no due cards" do
      it "returns an empty list" do
        get "/api/v1/decks/#{deck.id}/due_flashcards", headers: headers

        expect(response).to have_http_status(:ok)
        expect(response.parsed_body["data"]).to eq([])
      end
    end

    context "with new (unstudied) cards" do
      let!(:card) { create(:flashcard, deck: deck) }

      it "includes the card" do
        get "/api/v1/decks/#{deck.id}/due_flashcards", headers: headers

        expect(response).to have_http_status(:ok)
        ids = response.parsed_body["data"].map { |c| c["id"] }
        expect(ids).to include(card.id)
      end
    end

    context "with an overdue card and a new card" do
      let!(:overdue_card) { create(:flashcard, deck: deck) }
      let!(:new_card)     { create(:flashcard, deck: deck) }

      before do
        create(:card_progress, user: user, flashcard: overdue_card,
               repetitions: 1, next_review_at: 2.days.ago)
      end

      it "returns overdue card before new card" do
        get "/api/v1/decks/#{deck.id}/due_flashcards", headers: headers

        ids = response.parsed_body["data"].map { |c| c["id"] }
        expect(ids.index(overdue_card.id)).to be < ids.index(new_card.id)
      end
    end

    context "with a card not yet due" do
      let!(:card) { create(:flashcard, deck: deck) }

      before do
        create(:card_progress, user: user, flashcard: card,
               next_review_at: 3.days.from_now)
      end

      it "excludes the card" do
        get "/api/v1/decks/#{deck.id}/due_flashcards", headers: headers

        ids = response.parsed_body["data"].map { |c| c["id"] }
        expect(ids).not_to include(card.id)
      end
    end

    it "returns not found for another user's deck" do
      other_deck = create(:deck, user: create(:user))

      get "/api/v1/decks/#{other_deck.id}/due_flashcards", headers: headers

      expect(response).to have_http_status(:not_found)
    end

    it "returns unauthorized without a token" do
      get "/api/v1/decks/#{deck.id}/due_flashcards"

      expect(response).to have_http_status(:unauthorized)
    end
  end
end
