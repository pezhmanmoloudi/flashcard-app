require "rails_helper"

RSpec.describe SpacedRepetition::Sm2Algorithm do
  def call(quality:, repetitions: 0, easiness_factor: 2.5, interval_days: 0)
    described_class.call(
      quality:         quality,
      repetitions:     repetitions,
      easiness_factor: easiness_factor,
      interval_days:   interval_days
    )
  end

  describe "first review — repetitions 0" do
    it "schedules 1-day interval on pass" do
      result = call(quality: 4)
      expect(result.interval_days).to eq(1)
      expect(result.repetitions).to eq(1)
    end

    it "schedules 1-day interval on fail" do
      result = call(quality: 1)
      expect(result.interval_days).to eq(1)
      expect(result.repetitions).to eq(0)
    end
  end

  describe "second review — repetitions 1" do
    it "schedules 6-day interval on pass" do
      result = call(quality: 4, repetitions: 1, interval_days: 1)
      expect(result.interval_days).to eq(6)
      expect(result.repetitions).to eq(2)
    end
  end

  describe "third+ review — repetitions 2+" do
    it "multiplies interval by easiness_factor" do
      result = call(quality: 4, repetitions: 2, easiness_factor: 2.5, interval_days: 6)
      expect(result.interval_days).to eq((6 * 2.5).round)
      expect(result.repetitions).to eq(3)
    end
  end

  describe "failed review (quality < 3)" do
    it "resets repetitions to 0 and interval to 1" do
      result = call(quality: 2, repetitions: 5, easiness_factor: 2.5, interval_days: 30)
      expect(result.repetitions).to eq(0)
      expect(result.interval_days).to eq(1)
    end

    it "still updates easiness_factor" do
      result = call(quality: 1, easiness_factor: 2.5)
      expect(result.easiness_factor).to be < 2.5
    end
  end

  describe "easiness_factor update" do
    it "increases for quality 5" do
      result = call(quality: 5, easiness_factor: 2.5)
      expect(result.easiness_factor).to be > 2.5
    end

    it "decreases for quality 3" do
      result = call(quality: 3, easiness_factor: 2.5)
      expect(result.easiness_factor).to be < 2.5
    end

    it "never drops below 1.3" do
      result = call(quality: 0, easiness_factor: 1.3)
      expect(result.easiness_factor).to eq(1.3)
    end
  end

  describe "next_review_at" do
    it "is interval_days from now" do
      result = call(quality: 4)
      expect(result.next_review_at).to be_within(5.seconds).of(1.day.from_now)
    end
  end
end
