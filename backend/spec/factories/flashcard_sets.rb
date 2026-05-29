FactoryBot.define do
  factory :flashcard_set do
    association :deck
    sequence(:name) { |n| "Set #{n}" }
    description { nil }
    position    { 0 }
  end
end
