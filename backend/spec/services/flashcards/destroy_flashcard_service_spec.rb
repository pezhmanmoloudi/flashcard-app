require "rails_helper"

RSpec.describe Flashcards::DestroyFlashcardService do
  describe ".call" do
    let!(:flashcard) { create(:flashcard) }

    it "destroys the flashcard and returns Success" do
      result = described_class.call(flashcard: flashcard)

      expect(result).to be_success
      expect(Flashcard.exists?(flashcard.id)).to be(false)
    end
  end
end
