require "rails_helper"

RSpec.describe StudySessionPolicy do
  let(:user)  { create(:user) }
  let(:other) { create(:user) }

  describe "#manage?" do
    it "returns true when the session belongs to the user" do
      session = create(:study_session, user: user, deck: create(:deck, user: user))
      expect(described_class.new(user: user, record: session).manage?).to be(true)
    end

    it "returns false when the session belongs to another user" do
      session = create(:study_session, user: other, deck: create(:deck, user: other))
      expect(described_class.new(user: user, record: session).manage?).to be(false)
    end
  end
end
