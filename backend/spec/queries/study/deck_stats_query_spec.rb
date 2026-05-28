require "rails_helper"

RSpec.describe Study::DeckStatsQuery do
  let(:user)  { create(:user) }
  let(:deck)  { create(:deck, user: user) }

  def call = described_class.call(user: user, deck: deck)

  context "with no flashcards" do
    it "returns all zeros" do
      stats = call
      expect(stats.total_cards).to eq(0)
      expect(stats.due_count).to eq(0)
      expect(stats.new_count).to eq(0)
      expect(stats.mastered_count).to eq(0)
      expect(stats.learning_count).to eq(0)
    end
  end

  context "with a new (unstudied) card" do
    before { create(:flashcard, deck: deck) }

    it "counts it as new and due" do
      stats = call
      expect(stats.total_cards).to eq(1)
      expect(stats.new_count).to eq(1)
      expect(stats.due_count).to eq(1)
      expect(stats.mastered_count).to eq(0)
      expect(stats.learning_count).to eq(0)
    end
  end

  context "with an overdue card" do
    let!(:card) { create(:flashcard, deck: deck) }

    before do
      create(:card_progress, user: user, flashcard: card,
             repetitions: 1, next_review_at: 1.day.ago)
    end

    it "counts it as due but not new" do
      stats = call
      expect(stats.due_count).to eq(1)
      expect(stats.new_count).to eq(0)
    end
  end

  context "with a card not yet due" do
    let!(:card) { create(:flashcard, deck: deck) }

    before do
      create(:card_progress, user: user, flashcard: card,
             repetitions: 1, next_review_at: 3.days.from_now)
    end

    it "counts it as learning, not due" do
      stats = call
      expect(stats.due_count).to eq(0)
      expect(stats.learning_count).to eq(1)
      expect(stats.new_count).to eq(0)
    end
  end

  context "with a mastered card" do
    let!(:card) { create(:flashcard, deck: deck) }

    before do
      create(:card_progress, user: user, flashcard: card,
             repetitions: Study::DeckStatsQuery::MASTERY_THRESHOLD,
             next_review_at: 10.days.from_now)
    end

    it "counts it as mastered and not due" do
      stats = call
      expect(stats.mastered_count).to eq(1)
      expect(stats.due_count).to eq(0)
      expect(stats.learning_count).to eq(0)
    end
  end

  context "with a mix of cards" do
    before do
      new_card  = create(:flashcard, deck: deck)
      due_card  = create(:flashcard, deck: deck)
      learn_card = create(:flashcard, deck: deck)
      master_card = create(:flashcard, deck: deck)

      create(:card_progress, user: user, flashcard: due_card,
             repetitions: 1, next_review_at: 2.days.ago)
      create(:card_progress, user: user, flashcard: learn_card,
             repetitions: 2, next_review_at: 4.days.from_now)
      create(:card_progress, user: user, flashcard: master_card,
             repetitions: 5, next_review_at: 20.days.from_now)
    end

    it "counts each category correctly" do
      stats = call
      expect(stats.total_cards).to eq(4)
      expect(stats.new_count).to eq(1)
      expect(stats.due_count).to eq(2)   # overdue + new
      expect(stats.learning_count).to eq(1)
      expect(stats.mastered_count).to eq(1)
    end
  end

  context "isolation: another user's progress on the same deck's cards" do
    let!(:card)       { create(:flashcard, deck: deck) }
    let(:other_user)  { create(:user) }

    before do
      create(:card_progress, user: other_user, flashcard: card,
             repetitions: 5, next_review_at: 30.days.from_now)
    end

    it "treats the card as new for the current user" do
      stats = call
      expect(stats.new_count).to eq(1)
      expect(stats.mastered_count).to eq(0)
    end
  end
end
