require "rails_helper"

RSpec.describe Study::ReviewCardService do
  let(:progress) { create(:card_progress, repetitions: 0, easiness_factor: 2.5, interval_days: 0) }

  describe ".call" do
    %w[again hard good easy].each do |rating|
      it "returns Success for rating '#{rating}'" do
        result = described_class.call(progress: progress, rating: rating)
        expect(result).to be_success
      end
    end

    it "returns Failure for unknown rating" do
      result = described_class.call(progress: progress, rating: "unknown")
      expect(result).to be_failure
      expect(result.failure).to include("Invalid rating: unknown")
    end

    context "with 'again' rating" do
      it "resets repetitions to 0 and interval to 1" do
        progress.update!(repetitions: 3, interval_days: 15)
        result = described_class.call(progress: progress, rating: "again")
        expect(result.value!.repetitions).to eq(0)
        expect(result.value!.interval_days).to eq(1)
      end
    end

    context "with 'easy' rating on first review" do
      it "advances repetitions and schedules 1-day interval" do
        result = described_class.call(progress: progress, rating: "easy")
        expect(result.value!.repetitions).to eq(1)
        expect(result.value!.interval_days).to eq(1)
        expect(result.value!.next_review_at).to be_present
      end
    end

    context "with 'good' rating on second review" do
      it "schedules 6-day interval" do
        progress.update!(repetitions: 1, interval_days: 1)
        result = described_class.call(progress: progress, rating: "good")
        expect(result.value!.interval_days).to eq(6)
      end
    end
  end
end
