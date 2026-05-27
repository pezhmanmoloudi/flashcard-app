require "rails_helper"

RSpec.describe Study::CreateStudySessionService do
  describe ".call" do
    let(:user) { create(:user) }
    let(:deck) { create(:deck, user: user) }

    it "returns Success with a new study session" do
      result = described_class.call(user: user, deck: deck)

      expect(result).to be_success
      expect(result.value!.user).to eq(user)
      expect(result.value!.deck).to eq(deck)
      expect(result.value!.completed?).to be(false)
    end
  end
end
