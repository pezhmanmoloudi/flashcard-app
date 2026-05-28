require "rails_helper"

RSpec.describe Study::UserStatsQuery do
  let(:user) { create(:user) }
  let(:deck) { create(:deck, user: user) }

  def call = described_class.call(user: user)

  context "with no activity" do
    it "returns zeros" do
      stats = call
      expect(stats.total_cards_studied).to eq(0)
      expect(stats.total_sessions).to eq(0)
      expect(stats.study_streak).to eq(0)
      expect(stats.cards_mastered).to eq(0)
    end
  end

  describe "total_cards_studied" do
    it "sums cards_studied across all completed sessions" do
      create(:study_session, user: user, deck: deck, cards_studied: 5,  completed_at: Time.current)
      create(:study_session, user: user, deck: deck, cards_studied: 10, completed_at: Time.current)
      create(:study_session, user: user, deck: deck, cards_studied: 3,  completed_at: nil)

      expect(call.total_cards_studied).to eq(15)
    end
  end

  describe "total_sessions" do
    it "counts only completed sessions" do
      create_list(:study_session, 3, user: user, deck: deck, completed_at: Time.current)
      create(:study_session, user: user, deck: deck, completed_at: nil)

      expect(call.total_sessions).to eq(3)
    end
  end

  describe "study_streak" do
    it "returns 1 when user studied today" do
      create(:study_session, user: user, deck: deck,
             cards_studied: 5, completed_at: Time.current)

      expect(call.study_streak).to eq(1)
    end

    it "returns 2 for today and yesterday" do
      create(:study_session, user: user, deck: deck,
             cards_studied: 5, completed_at: Time.current)
      create(:study_session, user: user, deck: deck,
             cards_studied: 5, completed_at: 1.day.ago)

      expect(call.study_streak).to eq(2)
    end

    it "returns 1 when streak was broken 2 days ago" do
      create(:study_session, user: user, deck: deck,
             cards_studied: 5, completed_at: Time.current)
      create(:study_session, user: user, deck: deck,
             cards_studied: 5, completed_at: 3.days.ago)

      expect(call.study_streak).to eq(1)
    end

    it "returns 0 when last study was 2+ days ago" do
      create(:study_session, user: user, deck: deck,
             cards_studied: 5, completed_at: 2.days.ago)

      expect(call.study_streak).to eq(0)
    end

    it "does not double-count multiple sessions on the same day" do
      create_list(:study_session, 3, user: user, deck: deck,
                  cards_studied: 5, completed_at: Time.current)

      expect(call.study_streak).to eq(1)
    end
  end

  describe "cards_mastered" do
    let!(:flashcard) { create(:flashcard, deck: deck) }

    it "counts card_progresses at or above mastery threshold" do
      threshold = Study::UserStatsQuery::MASTERY_THRESHOLD
      create(:card_progress, user: user, flashcard: flashcard, repetitions: threshold)

      expect(call.cards_mastered).to eq(1)
    end

    it "excludes card_progresses below mastery threshold" do
      create(:card_progress, user: user, flashcard: flashcard, repetitions: 1)

      expect(call.cards_mastered).to eq(0)
    end
  end
end
