require "rails_helper"

RSpec.describe Decks::DestroyDeckService do
  describe ".call" do
    let!(:deck) { create(:deck) }

    it "destroys the deck and returns Success" do
      result = described_class.call(deck: deck)

      expect(result).to be_success
      expect(Deck.exists?(deck.id)).to be(false)
    end
  end
end
