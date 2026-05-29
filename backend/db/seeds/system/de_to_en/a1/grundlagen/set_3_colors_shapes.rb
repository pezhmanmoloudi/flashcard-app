set = Deck.find_by!(name: "Grundlagen", is_system: true, language_pair: "de_to_en")
          .flashcard_sets
          .find_or_create_by!(name: "Set 3 – Colors & Shapes") { |s| s.position = 2 }

[
  { front: "rot",        back: "red",            sentence: "Das Auto ist rot.",              translation: "The car is red.",                notes: "Adjective. Inflects: roter/rote/rotes depending on case and gender." },
  { front: "blau",       back: "blue",           sentence: "Der Himmel ist blau.",           translation: "The sky is blue.",               notes: "Adjective. 'Dunkelblau' = dark blue, 'hellblau' = light blue." },
  { front: "grün",       back: "green",          sentence: "Das Gras ist grün.",             translation: "The grass is green.",            notes: "Adjective. Used predicatively or attributively." },
  { front: "gelb",       back: "yellow",         sentence: "Die Banane ist gelb.",           translation: "The banana is yellow.",          notes: "Adjective." },
  { front: "schwarz",    back: "black",          sentence: "Ich trage ein schwarzes Hemd.",  translation: "I am wearing a black shirt.",    notes: "Adjective. 'Pechschwarz' = pitch black." },
  { front: "weiß",       back: "white",          sentence: "Der Schnee ist weiß.",           translation: "The snow is white.",             notes: "Adjective. Note the ß (sharp s)." },
  { front: "grau",       back: "grey",           sentence: "Das Wetter ist grau heute.",     translation: "The weather is grey today.",     notes: "Adjective. Often used to describe overcast weather." },
  { front: "braun",      back: "brown",          sentence: "Meine Augen sind braun.",        translation: "My eyes are brown.",             notes: "Adjective. Also used for hair colour." },
  { front: "orange",     back: "orange",         sentence: "Die Orange ist orange.",         translation: "The orange is orange.",          notes: "Adjective. Borrowed from French. Does not inflect in standard use." },
  { front: "rosa",       back: "pink",           sentence: "Sie trägt ein rosafarbenes Kleid.", translation: "She is wearing a pink dress.", notes: "Adjective. Indeclinable in modern German." },
  { front: "lila",       back: "purple",         sentence: "Die Blume ist lila.",            translation: "The flower is purple.",          notes: "Adjective. Indeclinable. Also: violett." },
  { front: "groß",       back: "big / large",    sentence: "Das Haus ist sehr groß.",        translation: "The house is very big.",         notes: "Opposite: klein. Comparative: größer." },
  { front: "klein",      back: "small / little", sentence: "Das Kind ist noch klein.",       translation: "The child is still small.",      notes: "Opposite: groß. Comparative: kleiner." },
  { front: "lang",       back: "long",           sentence: "Das Seil ist sehr lang.",        translation: "The rope is very long.",         notes: "Refers to length. Comparative: länger." },
  { front: "kurz",       back: "short",          sentence: "Das Kleid ist zu kurz.",         translation: "The dress is too short.",        notes: "Opposite of lang. Comparative: kürzer." },
  { front: "der Kreis",    back: "circle",       sentence: "Zeichne einen Kreis!",           translation: "Draw a circle!",                 notes: "Masculine noun. Pl: die Kreise." },
  { front: "das Quadrat",  back: "square",       sentence: "Das Quadrat hat vier gleiche Seiten.", translation: "The square has four equal sides.", notes: "Neuter noun. Pl: die Quadrate." },
  { front: "das Dreieck",  back: "triangle",     sentence: "Ein Dreieck hat drei Ecken.",    translation: "A triangle has three corners.",  notes: "Neuter noun. Pl: die Dreiecke. Drei = three, Eck = corner." },
  { front: "rund",         back: "round",        sentence: "Der Tisch ist rund.",            translation: "The table is round.",            notes: "Adjective. Describes circular/spherical shapes." },
  { front: "eckig",        back: "angular / square-shaped", sentence: "Das Zimmer ist eckig.", translation: "The room is angular.",        notes: "Adjective. From Ecke (corner). Opposite: rund." },
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
