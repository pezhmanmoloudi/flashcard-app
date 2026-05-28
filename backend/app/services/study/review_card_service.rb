module Study
  class ReviewCardService < ApplicationService
    QUALITY_MAP = { 'again' => 1, 'hard' => 3, 'good' => 4, 'easy' => 5 }.freeze

    def initialize(progress:, rating:)
      @progress = progress
      @rating   = rating
    end

    def call
      quality = QUALITY_MAP[@rating.to_s]
      return Failure(["Invalid rating: #{@rating}"]) unless quality

      result = SpacedRepetition::Sm2Algorithm.call(
        quality:         quality,
        repetitions:     @progress.repetitions,
        easiness_factor: @progress.easiness_factor,
        interval_days:   @progress.interval_days
      )

      attrs = {
        repetitions:     result.repetitions,
        easiness_factor: result.easiness_factor,
        interval_days:   result.interval_days,
        next_review_at:  result.next_review_at
      }

      return Failure(@progress.errors.full_messages) unless @progress.update(attrs)

      Success(@progress)
    end
  end
end
