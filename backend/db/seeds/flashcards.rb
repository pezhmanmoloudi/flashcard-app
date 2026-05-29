require_relative "flashcards/a1_grundlagen"
require_relative "flashcards/a1_alltag"
require_relative "flashcards/a1_menschen"
require_relative "flashcards/a2_unterwegs"
require_relative "flashcards/a2_essen_trinken"
require_relative "flashcards/a2_freizeit"
require_relative "flashcards/b1_beruf_arbeit"
require_relative "flashcards/b1_gesellschaft"
require_relative "flashcards/b1_kommunikation"

total = Flashcard.joins(flashcard_set: :deck).where(decks: { is_system: true }).count
puts "  → #{total} system flashcards total"
