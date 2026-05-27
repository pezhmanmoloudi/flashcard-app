require "rails_helper"

RSpec.describe DeckPolicy do
  let(:user)  { create(:user) }
  let(:other) { create(:user) }

  describe "#manage?" do
    it "returns true when the deck belongs to the user" do
      deck = create(:deck, user: user)
      expect(described_class.new(user: user, record: deck).manage?).to be(true)
    end

    it "returns false when the deck belongs to another user" do
      deck = create(:deck, user: other)
      expect(described_class.new(user: user, record: deck).manage?).to be(false)
    end
  end
end
