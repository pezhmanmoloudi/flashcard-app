require "rails_helper"

RSpec.describe Study::ListStudySessionsQuery do
  describe ".call" do
    let(:user)  { create(:user) }
    let(:other) { create(:user) }

    before do
      create_list(:study_session, 2, user: user, deck: create(:deck, user: user))
      create(:study_session, user: other, deck: create(:deck, user: other))
    end

    it "returns only the user's study sessions" do
      result = described_class.call(user: user)

      expect(result.count).to eq(2)
      expect(result.map(&:user_id).uniq).to eq([user.id])
    end
  end
end
