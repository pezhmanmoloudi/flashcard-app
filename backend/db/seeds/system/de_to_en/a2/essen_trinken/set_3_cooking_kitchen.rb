set = Deck.find_by!(name: "Essen & Trinken", is_system: true, language_pair: "de_to_en")
          .flashcard_sets
          .find_or_create_by!(name: "Set 3 – Cooking & Kitchen") { |s| s.position = 2 }

[
  { front: "kochen",          back: "to cook / to boil", sentence: "Ich koche heute Abend Pasta.",         translation: "I'm cooking pasta this evening.",     notes: "Regular verb. kochen = to cook/boil." },
  { front: "braten",          back: "to fry / to roast", sentence: "Ich brate das Fleisch in der Pfanne.", translation: "I'm frying the meat in the pan.",     notes: "Strong verb. brate / brätst / brät." },
  { front: "backen",          back: "to bake",           sentence: "Ich backe einen Kuchen.",               translation: "I'm baking a cake.",                  notes: "Strong verb. backe / bäckst / bäckt." },
  { front: "schneiden",       back: "to cut",            sentence: "Schneide bitte die Zwiebeln.",          translation: "Please cut the onions.",              notes: "Strong verb. schneide / schneidest / schneidet." },
  { front: "mischen",         back: "to mix",            sentence: "Misch die Zutaten gut.",                translation: "Mix the ingredients well.",            notes: "Regular verb. mische / mischst / mischt." },
  { front: "die Pfanne",      back: "frying pan",        sentence: "Die Pfanne ist heiß.",                  translation: "The frying pan is hot.",              notes: "Feminine noun. Pl: die Pfannen." },
  { front: "der Topf",        back: "pot / saucepan",    sentence: "Stell den Topf auf den Herd.",          translation: "Put the pot on the hob.",             notes: "Masculine noun. Pl: die Töpfe." },
  { front: "der Herd",        back: "cooker / hob",      sentence: "Der Herd ist sehr modern.",             translation: "The cooker is very modern.",          notes: "Masculine noun. Pl: die Herde." },
  { front: "der Backofen",    back: "oven",              sentence: "Den Backofen auf 180 Grad vorheizen.",  translation: "Preheat the oven to 180 degrees.",    notes: "Masculine noun. Pl: die Backöfen." },
  { front: "der Kühlschrank", back: "fridge / refrigerator", sentence: "Das Essen ist im Kühlschrank.",  translation: "The food is in the fridge.",           notes: "Masculine noun. Pl: die Kühlschränke." },
  { front: "das Messer",      back: "knife",             sentence: "Das Messer ist scharf.",                translation: "The knife is sharp.",                 notes: "Neuter noun. Pl: die Messer." },
  { front: "die Gabel",       back: "fork",              sentence: "Kannst du mir eine Gabel geben?",       translation: "Can you give me a fork?",             notes: "Feminine noun. Pl: die Gabeln." },
  { front: "der Löffel",      back: "spoon",             sentence: "Rühr die Suppe mit einem Löffel.",      translation: "Stir the soup with a spoon.",         notes: "Masculine noun. Pl: die Löffel." },
  { front: "das Rezept",      back: "recipe",            sentence: "Hast du ein gutes Rezept?",             translation: "Do you have a good recipe?",          notes: "Neuter noun. Pl: die Rezepte." },
  { front: "die Zutat",       back: "ingredient",        sentence: "Wir brauchen frische Zutaten.",         translation: "We need fresh ingredients.",          notes: "Feminine noun. Pl: die Zutaten." },
  { front: "das Öl",          back: "oil",               sentence: "Erhitze etwas Öl in der Pfanne.",       translation: "Heat some oil in the pan.",           notes: "Neuter noun. Pl: die Öle." },
  { front: "das Mehl",        back: "flour",             sentence: "Ich brauche 200 Gramm Mehl.",           translation: "I need 200 grams of flour.",          notes: "Neuter noun. No plural in common use." },
  { front: "würzen",          back: "to season",         sentence: "Würze das Gericht mit Salz und Pfeffer.", translation: "Season the dish with salt and pepper.", notes: "Regular verb. würze / würzt." },
  { front: "heiß",            back: "hot",               sentence: "Vorsicht, die Pfanne ist heiß!",        translation: "Careful, the pan is hot!",            notes: "Adjective. Opposite: kalt (cold). Also: hot weather." },
  { front: "fertig",          back: "ready / done",      sentence: "Das Essen ist fertig!",                  translation: "The food is ready!",                  notes: "Adjective. 'Fertig sein' = to be done/ready." },
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
