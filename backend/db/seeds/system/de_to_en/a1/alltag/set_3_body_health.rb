set = Deck.find_by!(name: "Alltag", is_system: true, language_pair: "de_to_en")
          .flashcard_sets
          .find_or_create_by!(name: "Set 3 – Body & Health") { |s| s.position = 2 }

[
  { front: "der Kopf",       back: "head",              sentence: "Mir tut der Kopf weh.",              translation: "I have a headache.",              notes: "Masculine noun. Pl: die Köpfe." },
  { front: "das Gesicht",    back: "face",              sentence: "Sie hat ein freundliches Gesicht.",  translation: "She has a friendly face.",        notes: "Neuter noun. Pl: die Gesichter." },
  { front: "das Auge",       back: "eye",               sentence: "Er hat blaue Augen.",                translation: "He has blue eyes.",               notes: "Neuter noun. Pl: die Augen." },
  { front: "die Nase",       back: "nose",              sentence: "Meine Nase läuft.",                  translation: "My nose is running.",             notes: "Feminine noun. Pl: die Nasen." },
  { front: "der Mund",       back: "mouth",             sentence: "Mach bitte den Mund auf.",           translation: "Please open your mouth.",         notes: "Masculine noun. Pl: die Münder." },
  { front: "das Ohr",        back: "ear",               sentence: "Ich habe Schmerzen im Ohr.",         translation: "I have pain in my ear.",          notes: "Neuter noun. Pl: die Ohren." },
  { front: "der Hals",       back: "neck / throat",     sentence: "Mir tut der Hals weh.",              translation: "My throat hurts.",                notes: "Masculine noun. Pl: die Hälse." },
  { front: "die Hand",       back: "hand",              sentence: "Gib mir deine Hand.",                translation: "Give me your hand.",              notes: "Feminine noun. Pl: die Hände." },
  { front: "der Finger",     back: "finger",            sentence: "Ich habe mir den Finger verletzt.",  translation: "I hurt my finger.",               notes: "Masculine noun. Pl: die Finger." },
  { front: "der Fuß",        back: "foot",              sentence: "Mein Fuß tut weh.",                  translation: "My foot hurts.",                  notes: "Masculine noun. Pl: die Füße." },
  { front: "der Bauch",      back: "stomach / belly",   sentence: "Mir tut der Bauch weh.",             translation: "I have a stomach ache.",          notes: "Masculine noun. Pl: die Bäuche." },
  { front: "der Rücken",     back: "back",              sentence: "Er hat starke Rückenschmerzen.",     translation: "He has severe back pain.",        notes: "Masculine noun. Pl: die Rücken." },
  { front: "krank",          back: "ill / sick",        sentence: "Ich bin krank und bleibe zuhause.",  translation: "I am ill and staying at home.",   notes: "Adjective. 'Krank sein' = to be ill." },
  { front: "gesund",         back: "healthy",           sentence: "Sport ist gut für die Gesundheit.",  translation: "Sport is good for health.",       notes: "Adjective. 'Gesund bleiben' = to stay healthy." },
  { front: "der Schmerz",    back: "pain",              sentence: "Ich habe starke Schmerzen.",         translation: "I have severe pain.",             notes: "Masculine noun. Pl: die Schmerzen. Common: 'Mir tut … weh'." },
  { front: "das Fieber",     back: "fever / temperature", sentence: "Das Kind hat hohes Fieber.",      translation: "The child has a high temperature.", notes: "Neuter noun. No plural. 'Fieber haben' = to have a fever." },
  { front: "der Arzt",       back: "doctor",            sentence: "Ich muss zum Arzt gehen.",           translation: "I need to go to the doctor.",     notes: "Masculine noun. Pl: die Ärzte. Fem: die Ärztin." },
  { front: "das Krankenhaus", back: "hospital",         sentence: "Er liegt im Krankenhaus.",           translation: "He is in hospital.",              notes: "Neuter noun. Pl: die Krankenhäuser." },
  { front: "die Medizin",    back: "medicine / medication", sentence: "Hast du deine Medizin genommen?", translation: "Have you taken your medication?", notes: "Feminine noun. Means both the subject medicine and medication." },
  { front: "schlafen",       back: "to sleep",          sentence: "Ich schlafe acht Stunden.",          translation: "I sleep eight hours.",            notes: "Strong verb. schlafe / schläfst / schläft." },
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
