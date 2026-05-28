module SpacedRepetition
  # SuperMemo-2 algorithm: computes next review interval and ease factor.
  #
  # quality scale: 0=blackout, 1=fail, 2=fail-but-close,
  #                3=hard pass, 4=hesitation pass, 5=perfect
  class Sm2Algorithm
    MIN_EASINESS_FACTOR = 1.3

    Result = Struct.new(:repetitions, :easiness_factor, :interval_days, :next_review_at, keyword_init: true)

    def self.call(...)
      new(...).call
    end

    def initialize(quality:, repetitions:, easiness_factor:, interval_days:)
      @quality         = quality
      @repetitions     = repetitions
      @easiness_factor = easiness_factor.to_f
      @interval_days   = interval_days.to_i
    end

    def call
      new_ef = updated_easiness_factor

      if @quality >= 3
        new_interval = case @repetitions
                       when 0 then 1
                       when 1 then 6
                       else (@interval_days * new_ef).round
                       end
        new_reps = @repetitions + 1
      else
        new_interval = 1
        new_reps     = 0
      end

      Result.new(
        repetitions:     new_reps,
        easiness_factor: new_ef,
        interval_days:   new_interval,
        next_review_at:  new_interval.days.from_now
      )
    end

    private

    def updated_easiness_factor
      delta = 0.1 - (5 - @quality) * (0.08 + (5 - @quality) * 0.02)
      [@easiness_factor + delta, MIN_EASINESS_FACTOR].max.round(2)
    end
  end
end
