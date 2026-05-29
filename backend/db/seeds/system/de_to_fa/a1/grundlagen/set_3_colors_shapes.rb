set = Deck.find_by!(name: "Grundlagen", is_system: true)
          .flashcard_sets
          .find_or_create_by!(name: "Set 3 – Colors & Shapes") { |s| s.position = 2 }

[
  { front: "rot",      back: "قرمز",         sentence: "Das Auto ist rot.",             translation: "ماشین قرمز است.",            notes: "Adjective. Inflects: roter/rote/rotes depending on case and gender." },
  { front: "blau",     back: "آبی",           sentence: "Der Himmel ist blau.",          translation: "آسمان آبی است.",             notes: "Adjective. 'Dunkelblau' = dark blue, 'hellblau' = light blue." },
  { front: "grün",     back: "سبز",           sentence: "Das Gras ist grün.",            translation: "چمن سبز است.",               notes: "Adjective. Used predicatively or attributively." },
  { front: "gelb",     back: "زرد",           sentence: "Die Banane ist gelb.",          translation: "موز زرد است.",               notes: "Adjective." },
  { front: "schwarz",  back: "مشکی / سیاه",  sentence: "Ich trage ein schwarzes Hemd.", translation: "من یک پیراهن مشکی می‌پوشم.", notes: "Adjective. 'Pechschwarz' = pitch black." },
  { front: "weiß",     back: "سفید",          sentence: "Der Schnee ist weiß.",          translation: "برف سفید است.",              notes: "Adjective. Note the ß (sharp s)." },
  { front: "grau",     back: "خاکستری",       sentence: "Das Wetter ist grau heute.",    translation: "امروز هوا خاکستری است.",     notes: "Adjective. Often used to describe overcast weather." },
  { front: "braun",    back: "قهوه‌ای",        sentence: "Meine Augen sind braun.",       translation: "چشمانم قهوه‌ای هستند.",      notes: "Adjective. Also used for hair color." },
  { front: "orange",   back: "نارنجی",        sentence: "Die Orange ist orange.",        translation: "پرتقال نارنجی است.",         notes: "Adjective. Borrowed from French. Does not inflect in standard use." },
  { front: "rosa",     back: "صورتی",         sentence: "Sie trägt ein rosafarbenes Kleid.", translation: "او یک لباس صورتی می‌پوشد.", notes: "Adjective. Indeclinable in modern German." },
  { front: "lila",     back: "بنفش",          sentence: "Die Blume ist lila.",           translation: "گل بنفش است.",               notes: "Adjective. Indeclinable. Also: violett." },
  { front: "groß",     back: "بزرگ",          sentence: "Das Haus ist sehr groß.",       translation: "خانه خیلی بزرگ است.",        notes: "Opposite: klein. Comparative: größer." },
  { front: "klein",    back: "کوچک",          sentence: "Das Kind ist noch klein.",      translation: "بچه هنوز کوچک است.",         notes: "Opposite: groß. Comparative: kleiner." },
  { front: "lang",     back: "بلند / دراز",   sentence: "Das Seil ist sehr lang.",       translation: "طناب خیلی بلند است.",        notes: "Refers to length. Comparative: länger." },
  { front: "kurz",     back: "کوتاه",         sentence: "Das Kleid ist zu kurz.",        translation: "لباس خیلی کوتاه است.",       notes: "Opposite of lang. Comparative: kürzer." },
  { front: "der Kreis",   back: "دایره",      sentence: "Zeichne einen Kreis!",          translation: "یک دایره بکش!",              notes: "Masculine noun. Pl: die Kreise." },
  { front: "das Quadrat", back: "مربع",       sentence: "Das Quadrat hat vier gleiche Seiten.", translation: "مربع چهار ضلع مساوی دارد.", notes: "Neuter noun. Pl: die Quadrate." },
  { front: "das Dreieck", back: "مثلث",       sentence: "Ein Dreieck hat drei Ecken.",   translation: "مثلث سه گوشه دارد.",         notes: "Neuter noun. Pl: die Dreiecke. Drei = three, Eck = corner." },
  { front: "rund",        back: "گرد / مدور", sentence: "Der Tisch ist rund.",           translation: "میز گرد است.",               notes: "Adjective. Describes circular/spherical shapes." },
  { front: "eckig",       back: "گوشه‌دار",   sentence: "Das Zimmer ist eckig.",         translation: "اتاق گوشه‌دار است.",         notes: "Adjective. From Ecke (corner). Opposite: rund." },
].each do |c|
  Flashcard.find_or_create_by!(flashcard_set: set, front_text: c[:front]) do |f|
    f.back_text           = c[:back]
    f.example_sentence    = c[:sentence]
    f.translated_sentence = c[:translation]
    f.grammar_notes       = c[:notes]
    f.source_language     = "german"
    f.target_language     = "persian"
  end
end
