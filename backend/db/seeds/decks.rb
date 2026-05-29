SYSTEM_DECKS = [
  # ── de_to_fa · A1 ────────────────────────────────────────────────────────────
  { name: "Grundlagen",    description: "Essential vocabulary for absolute beginners — greetings, numbers, and colors.",        level: "A1", language_pair: "de_to_fa", position: 0  },
  { name: "Alltag",        description: "Everyday words used at home, at the table, and about the body.",                      level: "A1", language_pair: "de_to_fa", position: 1  },
  { name: "Menschen",      description: "Family, feelings, and clothing — the vocabulary of people and relationships.",         level: "A1", language_pair: "de_to_fa", position: 2  },

  # ── de_to_fa · A2 ────────────────────────────────────────────────────────────
  { name: "Unterwegs",     description: "Getting around town — transport, directions, and shopping.",                           level: "A2", language_pair: "de_to_fa", position: 3  },
  { name: "Essen & Trinken", description: "Fruit, vegetables, the restaurant, and the kitchen.",                               level: "A2", language_pair: "de_to_fa", position: 4  },
  { name: "Freizeit",      description: "Hobbies, weather, seasons, and travel vocabulary.",                                   level: "A2", language_pair: "de_to_fa", position: 5  },

  # ── de_to_fa · B1 ────────────────────────────────────────────────────────────
  { name: "Arbeit & Wirtschaft", description: "Professions, the workplace, and core economic vocabulary.",                     level: "B1", language_pair: "de_to_fa", position: 6  },
  { name: "Welt & Gesellschaft", description: "Education, the environment, and media and news.",                               level: "B1", language_pair: "de_to_fa", position: 7  },
  { name: "Sprache & Stil",      description: "Expressing opinions, formal writing, and common idioms.",                       level: "B1", language_pair: "de_to_fa", position: 8  },

  # ── de_to_en · A1 ────────────────────────────────────────────────────────────
  { name: "Grundlagen",    description: "Essential vocabulary for absolute beginners — greetings, numbers, and colors.",        level: "A1", language_pair: "de_to_en", position: 9  },
  { name: "Alltag",        description: "Everyday words used at home, at the table, and about the body.",                      level: "A1", language_pair: "de_to_en", position: 10 },
  { name: "Menschen",      description: "Family, feelings, and clothing — the vocabulary of people and relationships.",         level: "A1", language_pair: "de_to_en", position: 11 },

  # ── de_to_en · A2 ────────────────────────────────────────────────────────────
  { name: "Unterwegs",     description: "Getting around town — transport, directions, and shopping.",                           level: "A2", language_pair: "de_to_en", position: 12 },
  { name: "Essen & Trinken", description: "Fruit, vegetables, the restaurant, and the kitchen.",                               level: "A2", language_pair: "de_to_en", position: 13 },
  { name: "Freizeit",      description: "Hobbies, weather, seasons, and travel vocabulary.",                                   level: "A2", language_pair: "de_to_en", position: 14 },

  # ── de_to_en · B1 ────────────────────────────────────────────────────────────
  { name: "Beruf & Arbeit",  description: "Professions, the workplace, and technology.",                                       level: "B1", language_pair: "de_to_en", position: 15 },
  { name: "Gesellschaft",    description: "Education, the environment, and media.",                                            level: "B1", language_pair: "de_to_en", position: 16 },
  { name: "Kommunikation",   description: "Expressing opinions, formal language, and common idioms.",                          level: "B1", language_pair: "de_to_en", position: 17 },

  # ── en_to_fa · A1 ────────────────────────────────────────────────────────────
  { name: "Basics",        description: "Essential English vocabulary for beginners — greetings, numbers, and colors.",         level: "A1", language_pair: "en_to_fa", position: 18 },
  { name: "Daily Life",    description: "Everyday words used at home, with food, and about the body.",                         level: "A1", language_pair: "en_to_fa", position: 19 },
  { name: "People",        description: "Family, feelings, and clothing — the vocabulary of people and relationships.",         level: "A1", language_pair: "en_to_fa", position: 20 },

  # ── en_to_fa · A2 ────────────────────────────────────────────────────────────
  { name: "Getting Around", description: "Transport, directions, city places, and shopping.",                                  level: "A2", language_pair: "en_to_fa", position: 21 },
  { name: "Food & Drink",   description: "Fruit, vegetables, the restaurant, and the kitchen.",                                level: "A2", language_pair: "en_to_fa", position: 22 },
  { name: "Leisure",        description: "Hobbies, sports, weather, seasons, and travel vocabulary.",                          level: "A2", language_pair: "en_to_fa", position: 23 },

  # ── en_to_fa · B1 ────────────────────────────────────────────────────────────
  { name: "Work & Society",    description: "Professions, the workplace, and economic vocabulary.",                            level: "B1", language_pair: "en_to_fa", position: 24 },
  { name: "World & Media",     description: "Education, the environment, and media and news.",                                 level: "B1", language_pair: "en_to_fa", position: 25 },
  { name: "Communication",     description: "Expressing opinions, formal writing, and common idioms.",                         level: "B1", language_pair: "en_to_fa", position: 26 },
].freeze

SYSTEM_DECKS.each do |attrs|
  Deck.find_or_create_by!(name: attrs[:name], is_system: true, level: attrs[:level], language_pair: attrs[:language_pair]) do |deck|
    deck.description   = attrs[:description]
    deck.language_pair = attrs[:language_pair]
    deck.position      = attrs[:position]
    deck.is_system     = true
  end
end

puts "  → #{SYSTEM_DECKS.size} system decks seeded"
