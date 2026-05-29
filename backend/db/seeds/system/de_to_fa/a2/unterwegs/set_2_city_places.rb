set = Deck.find_by!(name: "Unterwegs", is_system: true)
          .flashcard_sets
          .find_or_create_by!(name: "Set 2 – City & Places") { |s| s.position = 1 }

[
  { front: "die Stadt",       back: "شهر",         sentence: "Diese Stadt hat viele Museen.",     translation: "این شهر موزه‌های زیادی دارد.",   notes: "Feminine noun. Pl: die Städte." },
  { front: "das Zentrum",     back: "مرکز شهر",    sentence: "Das Hotel liegt im Zentrum.",       translation: "هتل در مرکز شهر است.",           notes: "Neuter noun. Pl: die Zentren." },
  { front: "der Park",        back: "پارک",        sentence: "Wir gehen in den Park.",            translation: "به پارک می‌رویم.",               notes: "Masculine noun. Pl: die Parks." },
  { front: "das Museum",      back: "موزه",        sentence: "Das Museum ist heute geschlossen.", translation: "موزه امروز بسته است.",            notes: "Neuter noun. Pl: die Museen." },
  { front: "die Kirche",      back: "کلیسا",       sentence: "Die Kirche ist sehr alt.",          translation: "کلیسا خیلی قدیمی است.",         notes: "Feminine noun. Pl: die Kirchen." },
  { front: "das Rathaus",     back: "شهرداری",     sentence: "Das Rathaus ist im Stadtzentrum.",  translation: "شهرداری در مرکز شهر است.",       notes: "Neuter noun. Pl: die Rathäuser." },
  { front: "das Hotel",       back: "هتل",         sentence: "Ich habe ein Zimmer im Hotel.",     translation: "در هتل یک اتاق دارم.",           notes: "Neuter noun. Pl: die Hotels." },
  { front: "das Restaurant",  back: "رستوران",     sentence: "Das Restaurant öffnet um 12 Uhr.",  translation: "رستوران ساعت ۱۲ باز می‌شود.",   notes: "Neuter noun. Pl: die Restaurants." },
  { front: "der Supermarkt",  back: "سوپرمارکت",  sentence: "Ich gehe in den Supermarkt.",       translation: "به سوپرمارکت می‌روم.",           notes: "Masculine noun. Pl: die Supermärkte." },
  { front: "die Apotheke",    back: "داروخانه",    sentence: "Die Apotheke ist bis 20 Uhr offen.", translation: "داروخانه تا ساعت ۸ شب بازه.",  notes: "Feminine noun. Pl: die Apotheken." },
  { front: "das Krankenhaus", back: "بیمارستان",   sentence: "Das Krankenhaus ist in der Nähe.",  translation: "بیمارستان نزدیک است.",           notes: "Neuter noun. Pl: die Krankenhäuser." },
  { front: "die Post",        back: "پست",         sentence: "Ich muss zur Post gehen.",          translation: "باید به اداره پست بروم.",        notes: "Feminine noun. Pl: die Posts. Also: die Poststelle." },
  { front: "die Bank",        back: "بانک",        sentence: "Die Bank öffnet um 9 Uhr.",         translation: "بانک ساعت ۹ باز می‌شود.",       notes: "Feminine noun. Pl: die Banken." },
  { front: "der Markt",       back: "بازار",       sentence: "Am Samstag gibt es einen Markt.",   translation: "روز شنبه بازار هست.",            notes: "Masculine noun. Pl: die Märkte." },
  { front: "die Schule",      back: "مدرسه",       sentence: "Die Schule beginnt um 8 Uhr.",      translation: "مدرسه ساعت ۸ شروع می‌شود.",     notes: "Feminine noun. Pl: die Schulen." },
  { front: "gegenüber",       back: "روبرو",       sentence: "Das Café ist gegenüber dem Bahnhof.", translation: "کافه روبروی ایستگاه قطار است.", notes: "Preposition/adverb. Takes dative case." },
  { front: "neben",           back: "کنار",        sentence: "Das Kino ist neben dem Hotel.",     translation: "سینما کنار هتل است.",            notes: "Preposition. Takes dative (location) or accusative (movement)." },
  { front: "zwischen",        back: "بین",         sentence: "Das Café ist zwischen Bank und Post.", translation: "کافه بین بانک و پست است.",    notes: "Preposition. Takes dative (location) or accusative (movement)." },
  { front: "offen",           back: "باز",         sentence: "Ist das Geschäft heute offen?",     translation: "آیا مغازه امروز باز است؟",       notes: "Adjective. Opposite: geschlossen (closed)." },
  { front: "geschlossen",     back: "بسته",        sentence: "Das Museum ist montags geschlossen.", translation: "موزه روزهای دوشنبه بسته است.", notes: "Adjective. From 'schließen' (to close)." },
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
