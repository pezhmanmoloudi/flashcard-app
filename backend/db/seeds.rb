puts "\nSeeding system content …"

require_relative "seeds/decks"

Dir.glob(File.join(__dir__, "seeds/system/**/*.rb")).sort.each { |f| load f }

total = Flashcard.joins(flashcard_set: :deck).where(decks: { is_system: true }).count
puts "  → #{total} system flashcards total"
puts "Done.\n\n"
