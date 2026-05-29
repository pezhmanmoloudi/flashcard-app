set = Deck.find_by!(name: "Gesellschaft", is_system: true)
          .flashcard_sets
          .find_or_create_by!(name: "Set 2 – Environment") { |s| s.position = 1 }

[
  { front: "die Umwelt",          back: "the environment",       sentence: "Wir müssen die Umwelt schützen.",      translation: "We must protect the environment.",     notes: "Feminine noun. Singular only in this sense." },
  { front: "der Klimawandel",     back: "climate change",        sentence: "Der Klimawandel ist eine globale Herausforderung.", translation: "Climate change is a global challenge.", notes: "Masculine noun. Singular only." },
  { front: "die Nachhaltigkeit",  back: "sustainability",        sentence: "Nachhaltigkeit ist ein wichtiges Thema.", translation: "Sustainability is an important topic.", notes: "Feminine noun. Key concept in modern German politics." },
  { front: "erneuerbare Energien", back: "renewable energies",   sentence: "Deutschland investiert in erneuerbare Energien.", translation: "Germany invests in renewable energies.", notes: "Always plural. 'Erneuerbar' = renewable." },
  { front: "die Solarenergie",    back: "solar energy",          sentence: "Solarenergie wird immer günstiger.",    translation: "Solar energy is becoming cheaper.",    notes: "Feminine noun. Solar panels: die Solarpanele." },
  { front: "die Windenergie",     back: "wind energy",           sentence: "Windenergie ist in Norddeutschland weit verbreitet.", translation: "Wind energy is widespread in northern Germany.", notes: "Feminine noun." },
  { front: "recyceln",            back: "to recycle",            sentence: "In Deutschland recycelt man sehr viel.", translation: "In Germany, people recycle a lot.",    notes: "Regular verb. Germany has a highly developed recycling system." },
  { front: "der Müll",            back: "waste / garbage",       sentence: "Bitte wirf den Müll in den richtigen Behälter!", translation: "Please put the rubbish in the right bin!", notes: "Masculine noun. Germany has strict waste separation rules." },
  { front: "die Emissionen",      back: "emissions",             sentence: "Wir müssen die CO₂-Emissionen reduzieren.", translation: "We need to reduce CO₂ emissions.",   notes: "Plural. Singular: die Emission." },
  { front: "der Treibhauseffekt", back: "the greenhouse effect", sentence: "Der Treibhauseffekt erwärmt die Erde.",  translation: "The greenhouse effect warms the Earth.", notes: "Masculine noun. 'Treibhausgas' = greenhouse gas." },
  { front: "die Abholzung",       back: "deforestation",         sentence: "Die Abholzung des Regenwaldes ist ein Problem.", translation: "The deforestation of the rainforest is a problem.", notes: "Feminine noun. From 'abholzen' (to clear-cut)." },
  { front: "der Artenschutz",     back: "species protection",    sentence: "Der Artenschutz ist wichtig.",          translation: "Species protection is important.",     notes: "Masculine noun. 'Artenschutz' = protection of species." },
  { front: "die Dürre",           back: "drought",               sentence: "Dürren werden häufiger durch den Klimawandel.", translation: "Droughts are becoming more frequent due to climate change.", notes: "Feminine noun. Pl: die Dürren." },
  { front: "die Überschwemmung",  back: "flood",                 sentence: "Die Überschwemmung hat viele Häuser beschädigt.", translation: "The flood damaged many houses.",  notes: "Feminine noun. Pl: die Überschwemmungen." },
  { front: "das Elektroauto",     back: "electric car",          sentence: "Immer mehr Leute fahren Elektroauto.",  translation: "More and more people drive electric cars.", notes: "Neuter noun. Pl: die Elektroautos." },
  { front: "umweltfreundlich",    back: "environmentally friendly", sentence: "Fahrradfahren ist umweltfreundlich.", translation: "Cycling is environmentally friendly.", notes: "Adjective. Compound: Umwelt + freundlich." },
  { front: "schützen",            back: "to protect",            sentence: "Wir müssen die Natur schützen.",        translation: "We must protect nature.",              notes: "Regular verb. schütze / schützt." },
  { front: "verbrauchen",         back: "to consume / use up",   sentence: "Wir verbrauchen zu viel Energie.",      translation: "We consume too much energy.",          notes: "Regular verb. 'Der Verbrauch' = consumption." },
  { front: "das Bewusstsein",     back: "awareness / consciousness", sentence: "Das Umweltbewusstsein wächst.",     translation: "Environmental awareness is growing.",  notes: "Neuter noun. 'Umweltbewusstsein' = environmental awareness." },
  { front: "der Fußabdruck",      back: "footprint",             sentence: "Wie groß ist dein CO₂-Fußabdruck?",    translation: "How big is your carbon footprint?",    notes: "Masculine noun. 'Der ökologische Fußabdruck' = ecological footprint." },
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
