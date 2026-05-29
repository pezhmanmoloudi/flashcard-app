set = Deck.find_by!(name: "Beruf & Arbeit", is_system: true, language_pair: "de_to_en")
          .flashcard_sets
          .find_or_create_by!(name: "Set 2 – Workplace") { |s| s.position = 1 }

[
  { front: "die Stelle",           back: "job / position",       sentence: "Ich habe mich auf eine Stelle beworben.", translation: "I applied for a position.",           notes: "Feminine noun. Pl: die Stellen. More formal than 'Job'." },
  { front: "das Vorstellungsgespräch", back: "job interview",    sentence: "Morgen habe ich ein Vorstellungsgespräch.", translation: "Tomorrow I have a job interview.",  notes: "Neuter noun. Pl: die Vorstellungsgespräche." },
  { front: "der Lebenslauf",        back: "CV / résumé",          sentence: "Bitte schicken Sie Ihren Lebenslauf.",   translation: "Please send your CV.",               notes: "Masculine noun. Pl: die Lebensläufe." },
  { front: "das Gehalt",            back: "salary",               sentence: "Über das Gehalt wird verhandelt.",       translation: "The salary will be negotiated.",     notes: "Neuter noun. Pl: die Gehälter. Monthly salary." },
  { front: "die Überstunden",       back: "overtime",             sentence: "Er macht oft Überstunden.",              translation: "He often works overtime.",           notes: "Always plural. 'Überstunden machen' = to work overtime." },
  { front: "der Urlaub",            back: "holiday / vacation",   sentence: "Ich habe drei Wochen Urlaub.",           translation: "I have three weeks of holiday.",     notes: "Masculine noun. Also annual leave at work." },
  { front: "kündigen",              back: "to quit / resign",     sentence: "Er hat seine Stelle gekündigt.",         translation: "He quit his job.",                   notes: "Regular verb. Also: to fire someone = 'jemanden kündigen'." },
  { front: "einstellen",            back: "to hire",              sentence: "Wir stellen neue Mitarbeiter ein.",      translation: "We are hiring new employees.",       notes: "Separable verb. stelle ein / stellst ein." },
  { front: "der Kollege",           back: "colleague",            sentence: "Meine Kollegen sind sehr nett.",         translation: "My colleagues are very nice.",       notes: "Masculine noun. Pl: die Kollegen. Fem: die Kollegin." },
  { front: "die Besprechung",       back: "meeting",              sentence: "Wir haben heute eine wichtige Besprechung.", translation: "We have an important meeting today.", notes: "Feminine noun. Pl: die Besprechungen. Also: das Meeting." },
  { front: "die Abteilung",         back: "department",           sentence: "Er leitet die Marketing-Abteilung.",     translation: "He heads the marketing department.",  notes: "Feminine noun. Pl: die Abteilungen." },
  { front: "der Chef",              back: "boss / manager",       sentence: "Der Chef ist heute nicht im Büro.",      translation: "The boss is not in the office today.", notes: "Masculine noun. Pl: die Chefs. Fem: die Chefin." },
  { front: "das Büro",              back: "office",               sentence: "Ich arbeite im Büro.",                   translation: "I work in the office.",              notes: "Neuter noun. Pl: die Büros." },
  { front: "das Homeoffice",        back: "working from home",    sentence: "Heute arbeite ich im Homeoffice.",       translation: "Today I'm working from home.",       notes: "Neuter noun. Widely used since 2020." },
  { front: "die Karriere",          back: "career",               sentence: "Sie macht eine tolle Karriere.",         translation: "She is having a great career.",      notes: "Feminine noun. Pl: die Karrieren." },
  { front: "die Ausbildung",        back: "vocational training / apprenticeship", sentence: "Er macht eine Ausbildung zum Koch.", translation: "He is doing an apprenticeship as a chef.", notes: "Feminine noun. A key feature of the German education/work system." },
  { front: "bewerben",              back: "to apply for a job",   sentence: "Ich bewerbe mich um die Stelle.",        translation: "I am applying for the position.",    notes: "Reflexive verb. bewerbe mich / bewirbst dich." },
  { front: "präsentieren",          back: "to present",           sentence: "Sie präsentiert ihre Ergebnisse.",       translation: "She is presenting her results.",     notes: "Regular verb. Common in business settings." },
  { front: "verantwortlich",        back: "responsible",          sentence: "Er ist für das Projekt verantwortlich.", translation: "He is responsible for the project.",  notes: "Adjective. 'Verantwortung übernehmen' = to take responsibility." },
  { front: "effizient",             back: "efficient",            sentence: "Wir müssen effizienter arbeiten.",        translation: "We need to work more efficiently.",  notes: "Adjective. From English/French. Comparative: effizienter." },
].each do |c|
  Flashcard.find_or_create_by!(flashcard_set: set, front_text: c[:front]) do |f|
    f.back_text           = c[:back]
    f.example_sentence    = c[:sentence]
    f.translated_sentence = c[:translation]
    f.grammar_notes       = c[:notes]
    f.source_language     = "german"
    f.target_language     = "english"
  end
end
