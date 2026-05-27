require "rails_helper"

RSpec.describe Study::UpdateCardProgressService do
  describe ".call" do
    let(:progress) { create(:card_progress) }

    it "returns Success with updated progress" do
      result = described_class.call(
        progress: progress,
        params:   { repetitions: 2, interval_days: 6 }
      )

      expect(result).to be_success
      expect(result.value!.repetitions).to eq(2)
      expect(result.value!.interval_days).to eq(6)
    end

    it "returns Failure for invalid easiness_factor" do
      result = described_class.call(
        progress: progress,
        params:   { easiness_factor: 0.5 }
      )

      expect(result).to be_failure
    end
  end
end
