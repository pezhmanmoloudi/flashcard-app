require "rails_helper"

RSpec.describe Decks::CreateDeckService do
  describe ".call" do
    let(:user) { create(:user) }

    context "with valid params" do
      it "returns Success with the created deck" do
        result = described_class.call(user: user, params: { name: "German Basics" })

        expect(result).to be_success
        expect(result.value!.name).to eq("German Basics")
        expect(result.value!.user).to eq(user)
      end
    end

    context "with missing name" do
      it "returns Failure with error messages" do
        result = described_class.call(user: user, params: { name: "" })

        expect(result).to be_failure
        expect(result.failure).to be_present
      end
    end
  end
end
