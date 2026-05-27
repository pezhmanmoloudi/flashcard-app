require "rails_helper"

RSpec.describe Flashcards::CreateFlashcardService do
  describe ".call" do
    let(:deck) { create(:deck) }
    let(:valid_params) do
      { front_text: "das Haus", back_text: "the house", source_language: "german", target_language: "english" }
    end

    it "returns Success with the created flashcard" do
      result = described_class.call(deck: deck, params: valid_params)

      expect(result).to be_success
      expect(result.value!.front_text).to eq("das Haus")
    end

    it "returns Failure for invalid params" do
      result = described_class.call(deck: deck, params: valid_params.merge(front_text: ""))

      expect(result).to be_failure
    end

    it "returns Failure when source and target language are the same" do
      result = described_class.call(deck: deck, params: valid_params.merge(target_language: "german"))

      expect(result).to be_failure
    end
  end
end
