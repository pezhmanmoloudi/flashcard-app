require "rails_helper"

RSpec.describe Study::CreateStudySessionService do
  describe ".call" do
    let(:user) { create(:user) }
    let(:deck) { create(:deck, user: user) }

    it "returns Success with a new study session" do
      result = described_class.call(user: user, deck: deck)

      expect(result).to be_success
      expect(result.value!.user).to eq(user)
      expect(result.value!.deck).to eq(deck)
      expect(result.value!.completed?).to be(false)
    end

    context "when an in-progress session already exists today" do
      let!(:existing) { create(:study_session, user: user, deck: deck, completed_at: nil) }

      it "returns the existing session without creating a new one" do
        expect { described_class.call(user: user, deck: deck) }
          .not_to change(StudySession, :count)

        result = described_class.call(user: user, deck: deck)
        expect(result.value!.id).to eq(existing.id)
      end
    end

    context "when an in-progress session exists from a previous day" do
      let!(:old_session) do
        create(:study_session, user: user, deck: deck,
               completed_at: nil, created_at: 2.days.ago)
      end

      it "creates a new session" do
        expect { described_class.call(user: user, deck: deck) }
          .to change(StudySession, :count).by(1)
      end
    end

    context "when today's session is already completed" do
      let!(:completed_session) do
        create(:study_session, user: user, deck: deck,
               completed_at: Time.current)
      end

      it "creates a fresh session" do
        expect { described_class.call(user: user, deck: deck) }
          .to change(StudySession, :count).by(1)
      end
    end
  end
end
