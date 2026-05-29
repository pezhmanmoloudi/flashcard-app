SYSTEM_DECKS = [
  # ── A1 ─────────────────────────────────────────────────────────────────────
  {
    name:          "Grundlagen",
    description:   "Essential vocabulary for absolute beginners — greetings, numbers, and colors.",
    level:         "A1",
    language_pair: "de_to_fa",
    position:      0,
  },
  {
    name:          "Alltag",
    description:   "Everyday words used at home, at the table, and about the body.",
    level:         "A1",
    language_pair: "de_to_fa",
    position:      1,
  },
  {
    name:          "Menschen",
    description:   "Family, feelings, and clothing — the vocabulary of people and relationships.",
    level:         "A1",
    language_pair: "de_to_fa",
    position:      2,
  },

  # ── A2 ─────────────────────────────────────────────────────────────────────
  {
    name:          "Unterwegs",
    description:   "Getting around town — transport, directions, and shopping.",
    level:         "A2",
    language_pair: "de_to_fa",
    position:      3,
  },
  {
    name:          "Essen & Trinken",
    description:   "Fruit, vegetables, the restaurant, and the kitchen.",
    level:         "A2",
    language_pair: "de_to_fa",
    position:      4,
  },
  {
    name:          "Freizeit",
    description:   "Hobbies, weather, seasons, and travel vocabulary.",
    level:         "A2",
    language_pair: "de_to_fa",
    position:      5,
  },

  # ── B1 ─────────────────────────────────────────────────────────────────────
  {
    name:          "Beruf & Arbeit",
    description:   "Professions, the workplace, and technology.",
    level:         "B1",
    language_pair: "de_to_en",
    position:      6,
  },
  {
    name:          "Gesellschaft",
    description:   "Education, the environment, and media.",
    level:         "B1",
    language_pair: "de_to_en",
    position:      7,
  },
  {
    name:          "Kommunikation",
    description:   "Expressing opinions, formal language, and common idioms.",
    level:         "B1",
    language_pair: "de_to_en",
    position:      8,
  },
].freeze

SYSTEM_DECKS.each do |attrs|
  Deck.find_or_create_by!(name: attrs[:name], is_system: true, level: attrs[:level]) do |deck|
    deck.description   = attrs[:description]
    deck.language_pair = attrs[:language_pair]
    deck.position      = attrs[:position]
    deck.is_system     = true
  end
end

puts "  → #{SYSTEM_DECKS.size} system decks seeded"
