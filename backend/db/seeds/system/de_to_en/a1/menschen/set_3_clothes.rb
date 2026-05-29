set = Deck.find_by!(name: "Menschen", is_system: true, language_pair: "de_to_en")
          .flashcard_sets
          .find_or_create_by!(name: "Set 3 – Clothes") { |s| s.position = 2 }

[
  { front: "das Hemd",       back: "shirt",              sentence: "Er trägt ein weißes Hemd.",          translation: "He is wearing a white shirt.",          notes: "Neuter noun. Pl: die Hemden." },
  { front: "die Bluse",      back: "blouse",             sentence: "Die Bluse ist aus Seide.",            translation: "The blouse is made of silk.",           notes: "Feminine noun. Pl: die Blusen." },
  { front: "die Hose",       back: "trousers / pants",   sentence: "Diese Hose ist zu eng.",              translation: "These trousers are too tight.",         notes: "Feminine noun. Pl: die Hosen. Always singular in German." },
  { front: "der Rock",       back: "skirt",              sentence: "Sie trägt einen roten Rock.",         translation: "She is wearing a red skirt.",           notes: "Masculine noun. Pl: die Röcke." },
  { front: "das Kleid",      back: "dress",              sentence: "Das Kleid steht dir sehr gut.",       translation: "The dress suits you very well.",         notes: "Neuter noun. Pl: die Kleider." },
  { front: "der Anzug",      back: "suit",               sentence: "Er trägt einen Anzug zur Arbeit.",    translation: "He wears a suit to work.",              notes: "Masculine noun. Pl: die Anzüge." },
  { front: "der Pullover",   back: "jumper / sweater",   sentence: "Es ist kalt – zieh einen Pullover an!", translation: "It's cold – put on a jumper!",        notes: "Masculine noun. Pl: die Pullover." },
  { front: "die Jacke",      back: "jacket",             sentence: "Vergiss deine Jacke nicht!",          translation: "Don't forget your jacket!",             notes: "Feminine noun. Pl: die Jacken." },
  { front: "der Mantel",     back: "coat",               sentence: "Es ist kalt. Nimm deinen Mantel.",    translation: "It's cold. Take your coat.",            notes: "Masculine noun. Pl: die Mäntel." },
  { front: "der Schuh",      back: "shoe",               sentence: "Meine Schuhe sind zu klein.",         translation: "My shoes are too small.",               notes: "Masculine noun. Pl: die Schuhe." },
  { front: "der Stiefel",    back: "boot",               sentence: "Sie trägt hohe Stiefel.",             translation: "She is wearing high boots.",            notes: "Masculine noun. Pl: die Stiefel." },
  { front: "die Socke",      back: "sock",               sentence: "Ich suche meine Socken.",             translation: "I'm looking for my socks.",             notes: "Feminine noun. Pl: die Socken." },
  { front: "die Mütze",      back: "woolly hat / beanie", sentence: "Im Winter trage ich eine Mütze.",   translation: "I wear a woolly hat in winter.",         notes: "Feminine noun. Pl: die Mützen. Knitted/winter hat." },
  { front: "der Schal",      back: "scarf",              sentence: "Der Schal hält den Hals warm.",       translation: "The scarf keeps the neck warm.",        notes: "Masculine noun. Pl: die Schals." },
  { front: "die Handschuhe", back: "gloves",             sentence: "Es ist kalt, zieh Handschuhe an.",    translation: "It's cold, put on gloves.",             notes: "Always plural. Singular: der Handschuh." },
  { front: "tragen",         back: "to wear / to carry", sentence: "Was trägst du heute?",                translation: "What are you wearing today?",           notes: "Strong verb. trage / trägst / trägt. Means to wear or to carry." },
  { front: "anziehen",       back: "to put on (clothes)", sentence: "Zieh dir schnell an!",              translation: "Get dressed quickly!",                  notes: "Separable verb. ziehe an / ziehst an. To put on clothes." },
  { front: "ausziehen",      back: "to take off (clothes)", sentence: "Zieh deine Schuhe aus!",           translation: "Take your shoes off!",                  notes: "Separable verb. ziehe aus / ziehst aus. To take off clothing." },
  { front: "eng",            back: "tight / narrow",     sentence: "Diese Hose ist mir zu eng.",          translation: "These trousers are too tight for me.",  notes: "Adjective. Opposite: weit (loose/wide)." },
  { front: "bequem",         back: "comfortable",        sentence: "Diese Schuhe sind sehr bequem.",      translation: "These shoes are very comfortable.",      notes: "Adjective. Opposite: unbequem." },
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
