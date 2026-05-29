SYSTEM_FLASHCARD_SETS = {
  # ── A1 ─────────────────────────────────────────────────────────────────────
  "Grundlagen" => [
    { name: "Set 1 – Greetings & Essentials", position: 0 },
    { name: "Set 2 – Numbers & Time",         position: 1 },
    { name: "Set 3 – Colors & Shapes",        position: 2 },
  ],
  "Alltag" => [
    { name: "Set 1 – At Home",       position: 0 },
    { name: "Set 2 – Food Basics",   position: 1 },
    { name: "Set 3 – Body & Health", position: 2 },
  ],
  "Menschen" => [
    { name: "Set 1 – Family",            position: 0 },
    { name: "Set 2 – Feelings & States", position: 1 },
    { name: "Set 3 – Clothes",           position: 2 },
  ],

  # ── A2 ─────────────────────────────────────────────────────────────────────
  "Unterwegs" => [
    { name: "Set 1 – Transport & Directions", position: 0 },
    { name: "Set 2 – City & Places",          position: 1 },
    { name: "Set 3 – Shopping",               position: 2 },
  ],
  "Essen & Trinken" => [
    { name: "Set 1 – Fruit & Vegetables",  position: 0 },
    { name: "Set 2 – In the Restaurant",   position: 1 },
    { name: "Set 3 – Cooking & Kitchen",   position: 2 },
  ],
  "Freizeit" => [
    { name: "Set 1 – Hobbies & Sports",   position: 0 },
    { name: "Set 2 – Weather & Seasons",  position: 1 },
    { name: "Set 3 – Travel & Holidays",  position: 2 },
  ],

  # ── B1 ─────────────────────────────────────────────────────────────────────
  "Beruf & Arbeit" => [
    { name: "Set 1 – Professions",  position: 0 },
    { name: "Set 2 – Workplace",    position: 1 },
    { name: "Set 3 – Technology",   position: 2 },
  ],
  "Gesellschaft" => [
    { name: "Set 1 – Education",    position: 0 },
    { name: "Set 2 – Environment",  position: 1 },
    { name: "Set 3 – Media & News", position: 2 },
  ],
  "Kommunikation" => [
    { name: "Set 1 – Opinions & Discussion", position: 0 },
    { name: "Set 2 – Formal Language",       position: 1 },
    { name: "Set 3 – Idioms & Expressions",  position: 2 },
  ],
}.freeze

total = 0

SYSTEM_FLASHCARD_SETS.each do |deck_name, sets|
  deck = Deck.find_by!(name: deck_name, is_system: true)
  sets.each do |attrs|
    FlashcardSet.find_or_create_by!(deck: deck, name: attrs[:name]) do |s|
      s.position = attrs[:position]
    end
    total += 1
  end
end

puts "  → #{total} flashcard sets seeded"
