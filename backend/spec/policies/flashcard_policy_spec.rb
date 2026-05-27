require "rails_helper"

RSpec.describe FlashcardPolicy do
  let(:user)  { create(:user) }
  let(:other) { create(:user) }

  describe "#manage?" do
    it "returns true when the flashcard's deck belongs to the user" do
      flashcard = create(:flashcard, deck: create(:deck, user: user))
      expect(described_class.new(user: user, record: flashcard).manage?).to be(true)
    end

    it "returns false when the flashcard's deck belongs to another user" do
      flashcard = create(:flashcard, deck: create(:deck, user: other))
      expect(described_class.new(user: user, record: flashcard).manage?).to be(false)
    end
  end
end
