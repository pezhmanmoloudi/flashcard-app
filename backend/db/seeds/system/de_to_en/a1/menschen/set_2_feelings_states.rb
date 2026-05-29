set = Deck.find_by!(name: "Menschen", is_system: true, language_pair: "de_to_en")
          .flashcard_sets
          .find_or_create_by!(name: "Set 2 – Feelings & States") { |s| s.position = 1 }

[
  { front: "glücklich",  back: "happy",            sentence: "Ich bin sehr glücklich heute.",        translation: "I am very happy today.",          notes: "Adjective. More formal than 'froh'." },
  { front: "traurig",    back: "sad",               sentence: "Warum bist du so traurig?",            translation: "Why are you so sad?",             notes: "Adjective. Opposite: glücklich/froh." },
  { front: "müde",       back: "tired",             sentence: "Ich bin so müde, ich schlafe gleich.", translation: "I'm so tired, I'll fall asleep soon.", notes: "Adjective. 'Todmüde' = dead tired." },
  { front: "aufgeregt",  back: "excited / nervous", sentence: "Die Kinder sind sehr aufgeregt.",      translation: "The children are very excited.",  notes: "Adjective. Can also mean nervous." },
  { front: "nervös",     back: "nervous",           sentence: "Ich bin nervös vor dem Examen.",       translation: "I am nervous before the exam.",   notes: "Adjective. Borrowed from French." },
  { front: "satt",       back: "full (after eating)", sentence: "Nein danke, ich bin satt.",         translation: "No thank you, I'm full.",         notes: "Adjective. Opposite of hungrig (hungry)." },
  { front: "durstig",    back: "thirsty",           sentence: "Es ist heiß, ich bin durstig.",        translation: "It's hot, I'm thirsty.",          notes: "Adjective. 'Durst haben' is also common." },
  { front: "froh",       back: "glad / pleased",    sentence: "Ich bin froh, dass du hier bist.",     translation: "I'm glad that you are here.",     notes: "Adjective. More casual than 'glücklich'." },
  { front: "böse",       back: "angry / cross",     sentence: "Bist du böse auf mich?",              translation: "Are you cross with me?",          notes: "Adjective. 'Böse auf jemanden sein' = to be angry at sb." },
  { front: "ängstlich",  back: "anxious / afraid",  sentence: "Das Kind ist ängstlich.",              translation: "The child is anxious.",           notes: "Adjective. From Angst (fear)." },
  { front: "ruhig",      back: "calm / quiet",      sentence: "Bleib ruhig!",                         translation: "Stay calm!",                      notes: "Adjective. Also means quiet. 'Ruhig bleiben' = to stay calm." },
  { front: "laut",       back: "loud / noisy",      sentence: "Die Musik ist zu laut.",               translation: "The music is too loud.",          notes: "Adjective. Opposite: leise (quiet)." },
  { front: "leise",      back: "quiet / softly",    sentence: "Sei bitte leise!",                     translation: "Please be quiet!",                notes: "Adjective. Opposite: laut. 'Leise reden' = to speak quietly." },
  { front: "fühlen",     back: "to feel",           sentence: "Wie fühlst du dich heute?",            translation: "How do you feel today?",          notes: "Regular verb. 'Sich fühlen' = to feel (reflexive)." },
  { front: "weinen",     back: "to cry",            sentence: "Das Baby weint.",                      translation: "The baby is crying.",             notes: "Regular verb. weine / weinst / weint." },
  { front: "lachen",     back: "to laugh",          sentence: "Er lacht gerne.",                      translation: "He likes to laugh.",              notes: "Regular verb. lache / lachst / lacht." },
  { front: "lieben",     back: "to love",           sentence: "Ich liebe meine Familie.",             translation: "I love my family.",               notes: "Regular verb. Stronger than 'mögen'." },
  { front: "mögen",      back: "to like",           sentence: "Ich mag Musik.",                       translation: "I like music.",                   notes: "Modal verb. mag / magst / mag. Softer than 'lieben'." },
  { front: "wollen",     back: "to want",           sentence: "Ich will Deutsch lernen.",             translation: "I want to learn German.",         notes: "Modal verb. will / willst / will." },
  { front: "können",     back: "to be able to / can", sentence: "Kannst du mir helfen?",             translation: "Can you help me?",                notes: "Modal verb. kann / kannst / kann." },
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
