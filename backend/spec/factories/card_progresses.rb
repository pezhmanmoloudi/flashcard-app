FactoryBot.define do
  factory :card_progress do
    association :user
    association :flashcard
    repetitions     { 0 }
    easiness_factor { 2.5 }
    interval_days   { 0 }
    next_review_at  { nil }
  end
end
