require "rails_helper"

RSpec.describe Study::UpdateStudySessionService do
  describe ".call" do
    let(:study_session) { create(:study_session) }

    it "returns Success with the updated session" do
      result = described_class.call(
        study_session: study_session,
        params: { cards_studied: 5, completed_at: Time.current }
      )

      expect(result).to be_success
      expect(result.value!.cards_studied).to eq(5)
      expect(result.value!.completed?).to be(true)
    end

    it "returns Failure for invalid params" do
      result = described_class.call(
        study_session: study_session,
        params: { cards_studied: -1 }
      )

      expect(result).to be_failure
    end
  end
end
