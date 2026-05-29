FactoryBot.define do
  factory :flashcard do
    association :flashcard_set
    sequence(:front_text)  { |n| "Front #{n}" }
    sequence(:back_text)   { |n| "Back #{n}" }
    source_language { "german" }
    target_language { "english" }
    example_sentence { "Das ist ein Beispiel." }
  end
end
