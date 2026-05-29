require "rails_helper"

RSpec.describe StudySessions::RecordReviewService do
  let(:user)          { create(:user) }
  let(:deck)          { create(:deck, user: user) }
  let(:flashcard_set) { create(:flashcard_set, deck: deck) }
  let(:flashcard)     { create(:flashcard, flashcard_set: flashcard_set) }
  let(:session)       { create(:study_session, user: user, deck: deck) }

  def call(result:, flashcard_id: flashcard.id)
    described_class.call(study_session: session, flashcard_id: flashcard_id, result: result)
  end

  describe ".call" do
    context "with result 'known'" do
      it "returns Success with the updated CardProgress" do
        outcome = call(result: "known")
        expect(outcome).to be_success
        expect(outcome.value!).to be_a(CardProgress)
      end

      it "creates a CardProgress record for the user" do
        expect { call(result: "known") }.to change(CardProgress, :count).by(1)
      end

      it "increments cards_studied on the session" do
        expect { call(result: "known") }.to change { session.reload.cards_studied }.by(1)
      end

      it "advances repetitions (quality 4 = correct)" do
        outcome = call(result: "known")
        expect(outcome.value!.repetitions).to eq(1)
      end

      it "schedules next_review_at in the future" do
        outcome = call(result: "known")
        expect(outcome.value!.next_review_at).to be > Time.current
      end
    end

    context "with result 'again'" do
      it "returns Success" do
        expect(call(result: "again")).to be_success
      end

      it "resets repetitions to 0 (quality 1 = fail)" do
        create(:card_progress, user: user, flashcard: flashcard, repetitions: 3, interval_days: 10)
        outcome = call(result: "again")
        expect(outcome.value!.repetitions).to eq(0)
        expect(outcome.value!.interval_days).to eq(1)
      end
    end

    context "when CardProgress already exists" do
      let!(:existing_progress) do
        create(:card_progress, user: user, flashcard: flashcard, repetitions: 2, interval_days: 6)
      end

      it "updates the existing record rather than creating a new one" do
        expect { call(result: "known") }.not_to change(CardProgress, :count)
        expect(existing_progress.reload.repetitions).to eq(3)
      end
    end

    context "with an invalid result" do
      it "returns Failure" do
        outcome = call(result: "perfect")
        expect(outcome).to be_failure
        expect(outcome.failure.first).to include("Invalid result")
      end

      it "does not increment cards_studied" do
        expect { call(result: "perfect") }.not_to change { session.reload.cards_studied }
      end
    end

    context "when flashcard does not belong to the session's deck" do
      let(:other_deck)          { create(:deck, user: user) }
      let(:other_flashcard_set) { create(:flashcard_set, deck: other_deck) }
      let(:other_flashcard)     { create(:flashcard, flashcard_set: other_flashcard_set) }

      it "returns Failure" do
        outcome = call(result: "known", flashcard_id: other_flashcard.id)
        expect(outcome).to be_failure
        expect(outcome.failure.first).to include("not found")
      end
    end

    context "when flashcard_id does not exist" do
      it "returns Failure" do
        outcome = call(result: "known", flashcard_id: 0)
        expect(outcome).to be_failure
      end
    end
  end
end
