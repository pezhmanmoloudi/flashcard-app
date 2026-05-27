FactoryBot.define do
  factory :study_session do
    association :user
    association :deck
    cards_studied { 0 }
    completed_at  { nil }
  end
end
