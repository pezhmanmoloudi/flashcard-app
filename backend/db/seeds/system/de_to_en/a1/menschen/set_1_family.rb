set = Deck.find_by!(name: "Menschen", is_system: true, language_pair: "de_to_en")
          .flashcard_sets
          .find_or_create_by!(name: "Set 1 – Family") { |s| s.position = 0 }

[
  { front: "die Familie",    back: "family",          sentence: "Meine Familie ist sehr groß.",        translation: "My family is very large.",          notes: "Feminine noun. Pl: die Familien." },
  { front: "die Mutter",     back: "mother",          sentence: "Meine Mutter kocht sehr gut.",        translation: "My mother cooks very well.",         notes: "Feminine noun. Pl: die Mütter. Informal: die Mama." },
  { front: "der Vater",      back: "father",          sentence: "Mein Vater arbeitet in einer Bank.",  translation: "My father works in a bank.",         notes: "Masculine noun. Pl: die Väter. Informal: der Papa." },
  { front: "die Eltern",     back: "parents",         sentence: "Meine Eltern wohnen in München.",     translation: "My parents live in Munich.",         notes: "Always plural. Singular form is not used." },
  { front: "das Kind",       back: "child",           sentence: "Das Kind spielt im Garten.",          translation: "The child is playing in the garden.", notes: "Neuter noun. Pl: die Kinder." },
  { front: "der Bruder",     back: "brother",         sentence: "Ich habe einen älteren Bruder.",      translation: "I have an older brother.",           notes: "Masculine noun. Pl: die Brüder." },
  { front: "die Schwester",  back: "sister",          sentence: "Meine Schwester studiert Medizin.",   translation: "My sister is studying medicine.",    notes: "Feminine noun. Pl: die Schwestern." },
  { front: "der Großvater",  back: "grandfather",     sentence: "Mein Großvater ist 80 Jahre alt.",    translation: "My grandfather is 80 years old.",   notes: "Masculine noun. Pl: die Großväter. Informal: Opa." },
  { front: "die Großmutter", back: "grandmother",     sentence: "Die Großmutter backt Kuchen.",        translation: "The grandmother bakes cake.",        notes: "Feminine noun. Pl: die Großmütter. Informal: Oma." },
  { front: "der Mann",       back: "man / husband",   sentence: "Das ist mein Mann.",                  translation: "This is my husband.",               notes: "Masculine noun. Pl: die Männer. Context-dependent: man/husband." },
  { front: "die Frau",       back: "woman / wife",    sentence: "Das ist meine Frau.",                 translation: "This is my wife.",                  notes: "Feminine noun. Pl: die Frauen. Context: woman/wife." },
  { front: "der Sohn",       back: "son",             sentence: "Mein Sohn ist fünf Jahre alt.",       translation: "My son is five years old.",          notes: "Masculine noun. Pl: die Söhne." },
  { front: "die Tochter",    back: "daughter",        sentence: "Meine Tochter lernt gerade Gitarre.", translation: "My daughter is currently learning guitar.", notes: "Feminine noun. Pl: die Töchter." },
  { front: "der Onkel",      back: "uncle",           sentence: "Mein Onkel besucht uns am Sonntag.",  translation: "My uncle is visiting us on Sunday.", notes: "Masculine noun. Pl: die Onkel." },
  { front: "die Tante",      back: "aunt",            sentence: "Meine Tante wohnt in Hamburg.",       translation: "My aunt lives in Hamburg.",          notes: "Feminine noun. Pl: die Tanten." },
  { front: "der Freund",     back: "friend / boyfriend", sentence: "Mein Freund heißt Lukas.",        translation: "My friend's name is Lukas.",         notes: "Masculine noun. Pl: die Freunde. Can mean friend or boyfriend." },
  { front: "die Freundin",   back: "friend / girlfriend", sentence: "Das ist meine beste Freundin.",  translation: "This is my best friend.",            notes: "Feminine noun. Pl: die Freundinnen. Friend or girlfriend." },
  { front: "alt",            back: "old",             sentence: "Wie alt bist du?",                    translation: "How old are you?",                   notes: "Adjective. 'Wie alt bist du?' = how old are you?" },
  { front: "jung",           back: "young",           sentence: "Sie ist noch sehr jung.",             translation: "She is still very young.",           notes: "Adjective. Comparative: jünger. Superlative: jüngste." },
  { front: "verheiratet",    back: "married",         sentence: "Sind Sie verheiratet?",               translation: "Are you married?",                   notes: "Adjective. 'Ledig' = single. 'Geschieden' = divorced." },
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
