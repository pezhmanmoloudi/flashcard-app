require "rails_helper"

RSpec.describe Decks::UpdateDeckService do
  describe ".call" do
    let(:deck) { create(:deck) }

    it "returns Success with updated deck" do
      result = described_class.call(deck: deck, params: { name: "Updated Name" })

      expect(result).to be_success
      expect(result.value!.name).to eq("Updated Name")
    end

    it "returns Failure for invalid params" do
      result = described_class.call(deck: deck, params: { name: "" })

      expect(result).to be_failure
    end
  end
end
