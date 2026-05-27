require "rails_helper"

RSpec.describe Decks::ListDecksQuery do
  describe ".call" do
    let(:user)  { create(:user) }
    let(:other) { create(:user) }

    before do
      create_list(:deck, 3, user: user)
      create(:deck, user: other)
    end

    it "returns only the user's decks" do
      result = described_class.call(user: user)

      expect(result.count).to eq(3)
      expect(result.map(&:user_id).uniq).to eq([user.id])
    end

    it "returns decks ordered by created_at desc" do
      result = described_class.call(user: user)

      expect(result).to eq(result.sort_by(&:created_at).reverse)
    end
  end
end
