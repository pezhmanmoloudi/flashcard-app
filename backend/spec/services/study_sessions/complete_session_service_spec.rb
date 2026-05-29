require "rails_helper"

RSpec.describe StudySessions::CompleteSessionService do
  let(:user)    { create(:user) }
  let(:deck)    { create(:deck, user: user) }
  let(:session) { create(:study_session, user: user, deck: deck) }

  describe ".call" do
    it "sets completed_at and returns Success" do
      result = described_class.call(study_session: session)
      expect(result).to be_success
      expect(result.value!.completed_at).to be_present
      expect(result.value!).to be_completed
    end

    it "is idempotent — calling again returns Success without changing completed_at" do
      already_at = 1.hour.ago
      session.update!(completed_at: already_at)

      result = described_class.call(study_session: session)
      expect(result).to be_success
      expect(result.value!.completed_at).to be_within(1.second).of(already_at)
    end
  end
end
