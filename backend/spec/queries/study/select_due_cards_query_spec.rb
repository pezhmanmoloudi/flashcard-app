require "rails_helper"

RSpec.describe Study::SelectDueCardsQuery do
  let(:user)  { create(:user) }
  let(:deck)  { create(:deck, user: user) }

  def call = described_class.call(user: user, deck: deck)

  describe ".call" do
    context "with no flashcards" do
      it "returns an empty collection" do
        expect(call).to be_empty
      end
    end

    context "with a card that has never been studied" do
      let!(:card) { create(:flashcard, deck: deck) }

      it "includes the card" do
        expect(call).to include(card)
      end
    end

    context "with a card whose progress is due" do
      let!(:card) { create(:flashcard, deck: deck) }

      before do
        create(:card_progress, user: user, flashcard: card,
               repetitions: 1, next_review_at: 1.day.ago)
      end

      it "includes the card" do
        expect(call).to include(card)
      end
    end

    context "with a card not yet due" do
      let!(:card) { create(:flashcard, deck: deck) }

      before do
        create(:card_progress, user: user, flashcard: card,
               repetitions: 1, next_review_at: 2.days.from_now)
      end

      it "excludes the card" do
        expect(call).not_to include(card)
      end
    end

    context "ordering" do
      let!(:new_card)      { create(:flashcard, deck: deck) }
      let!(:overdue_card)  { create(:flashcard, deck: deck) }

      before do
        create(:card_progress, user: user, flashcard: overdue_card,
               repetitions: 2, next_review_at: 3.days.ago)
      end

      it "returns overdue cards before new cards" do
        result = call.to_a
        expect(result.index(overdue_card)).to be < result.index(new_card)
      end
    end

    context "with multiple overdue cards" do
      let!(:older_due) { create(:flashcard, deck: deck) }
      let!(:newer_due) { create(:flashcard, deck: deck) }

      before do
        create(:card_progress, user: user, flashcard: older_due,
               repetitions: 1, next_review_at: 5.days.ago)
        create(:card_progress, user: user, flashcard: newer_due,
               repetitions: 1, next_review_at: 1.day.ago)
      end

      it "returns the most overdue card first" do
        result = call.to_a
        expect(result.index(older_due)).to be < result.index(newer_due)
      end
    end

    context "daily limit" do
      before do
        create_list(:flashcard, Study::SelectDueCardsQuery::DAILY_LIMIT + 5, deck: deck)
      end

      it "caps results at DAILY_LIMIT" do
        expect(call.size).to eq(Study::SelectDueCardsQuery::DAILY_LIMIT)
      end
    end

    context "with another user's progress on the same card" do
      let!(:card)       { create(:flashcard, deck: deck) }
      let(:other_user)  { create(:user) }

      before do
        # other_user studied the card but current user hasn't
        create(:card_progress, user: other_user, flashcard: card,
               repetitions: 3, next_review_at: 5.days.from_now)
      end

      it "treats the card as new for the current user" do
        expect(call).to include(card)
      end
    end

    context "isolation across decks" do
      let!(:card_in_deck)    { create(:flashcard, deck: deck) }
      let!(:card_other_deck) { create(:flashcard, deck: create(:deck, user: user)) }

      it "only returns cards from the given deck" do
        expect(call).to include(card_in_deck)
        expect(call).not_to include(card_other_deck)
      end
    end
  end
end
