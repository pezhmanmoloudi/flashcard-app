require "rails_helper"

RSpec.describe Flashcards::UpdateFlashcardService do
  describe ".call" do
    let(:flashcard) { create(:flashcard) }

    it "returns Success with the updated flashcard" do
      result = described_class.call(flashcard: flashcard, params: { front_text: "der Hund" })

      expect(result).to be_success
      expect(result.value!.front_text).to eq("der Hund")
    end

    it "returns Failure for invalid params" do
      result = described_class.call(flashcard: flashcard, params: { front_text: "" })

      expect(result).to be_failure
    end
  end
end
