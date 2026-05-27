require "rails_helper"

RSpec.describe Study::CreateCardProgressService do
  describe ".call" do
    let(:user)      { create(:user) }
    let(:deck)      { create(:deck, user: user) }
    let(:flashcard) { create(:flashcard, deck: deck) }

    it "returns Success with created progress" do
      result = described_class.call(
        user:      user,
        flashcard: flashcard,
        params:    { repetitions: 0, easiness_factor: 2.5, interval_days: 0 }
      )

      expect(result).to be_success
      expect(result.value!.user).to eq(user)
      expect(result.value!.flashcard).to eq(flashcard)
    end

    it "returns Failure for duplicate progress" do
      create(:card_progress, user: user, flashcard: flashcard)

      result = described_class.call(user: user, flashcard: flashcard, params: {})

      expect(result).to be_failure
    end
  end
end
