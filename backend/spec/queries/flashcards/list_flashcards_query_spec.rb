require "rails_helper"

RSpec.describe Flashcards::ListFlashcardsQuery do
  describe ".call" do
    let(:deck)       { create(:deck) }
    let(:other_deck) { create(:deck) }

    before do
      create_list(:flashcard, 3, deck: deck)
      create(:flashcard, deck: other_deck)
    end

    it "returns only flashcards belonging to the deck" do
      result = described_class.call(deck: deck)

      expect(result.count).to eq(3)
      expect(result.map(&:deck_id).uniq).to eq([deck.id])
    end
  end
end
