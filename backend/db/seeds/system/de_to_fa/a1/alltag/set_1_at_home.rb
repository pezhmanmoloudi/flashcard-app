set = Deck.find_by!(name: "Alltag", is_system: true)
          .flashcard_sets
          .find_or_create_by!(name: "Set 1 – At Home") { |s| s.position = 0 }

[
  { front: "das Haus",      back: "خانه",        sentence: "Wir haben ein großes Haus.",       translation: "ما یک خانه بزرگ داریم.",       notes: "Neuter noun. Pl: die Häuser." },
  { front: "die Wohnung",   back: "آپارتمان",    sentence: "Meine Wohnung ist klein aber gemütlich.", translation: "آپارتمانم کوچک اما دنج است.",  notes: "Feminine noun. Pl: die Wohnungen." },
  { front: "das Zimmer",    back: "اتاق",        sentence: "Das Zimmer hat ein großes Fenster.", translation: "اتاق یک پنجره بزرگ دارد.",     notes: "Neuter noun. Pl: die Zimmer." },
  { front: "die Küche",     back: "آشپزخانه",    sentence: "Ich koche gerne in der Küche.",    translation: "دوست دارم در آشپزخانه آشپزی کنم.", notes: "Feminine noun. Pl: die Küchen." },
  { front: "das Badezimmer", back: "حمام",       sentence: "Das Badezimmer ist im ersten Stock.", translation: "حمام در طبقه اول است.",         notes: "Neuter noun. Pl: die Badezimmer. Also: das Bad." },
  { front: "das Schlafzimmer", back: "اتاق خواب", sentence: "Mein Schlafzimmer ist ruhig.",    translation: "اتاق خوابم ساکت است.",          notes: "Neuter noun. Pl: die Schlafzimmer." },
  { front: "das Wohnzimmer", back: "اتاق نشیمن", sentence: "Wir sitzen im Wohnzimmer.",        translation: "ما در اتاق نشیمن می‌نشینیم.",   notes: "Neuter noun. Pl: die Wohnzimmer." },
  { front: "die Tür",       back: "در",          sentence: "Bitte mach die Tür zu.",           translation: "لطفاً در را ببند.",              notes: "Feminine noun. Pl: die Türen." },
  { front: "das Fenster",   back: "پنجره",       sentence: "Das Fenster ist offen.",           translation: "پنجره باز است.",                notes: "Neuter noun. Pl: die Fenster." },
  { front: "die Treppe",    back: "پله",         sentence: "Die Treppe ist steil.",            translation: "پله تند است.",                  notes: "Feminine noun. Pl: die Treppen." },
  { front: "der Tisch",     back: "میز",         sentence: "Das Buch liegt auf dem Tisch.",    translation: "کتاب روی میز است.",              notes: "Masculine noun. Pl: die Tische." },
  { front: "der Stuhl",     back: "صندلی",       sentence: "Setz dich auf den Stuhl!",         translation: "روی صندلی بنشین!",              notes: "Masculine noun. Pl: die Stühle." },
  { front: "das Bett",      back: "تخت",         sentence: "Ich gehe ins Bett.",               translation: "می‌روم بخوابم.",                notes: "Neuter noun. Pl: die Betten. 'Ins Bett gehen' = to go to bed." },
  { front: "der Schrank",   back: "کمد",         sentence: "Meine Kleider sind im Schrank.",   translation: "لباس‌هایم در کمد هستند.",       notes: "Masculine noun. Pl: die Schränke." },
  { front: "das Licht",     back: "چراغ / نور",  sentence: "Mach bitte das Licht an!",         translation: "لطفاً چراغ را روشن کن!",        notes: "Neuter noun. Pl: die Lichter." },
  { front: "der Schlüssel", back: "کلید",        sentence: "Ich habe meinen Schlüssel vergessen.", translation: "کلیدم را فراموش کردم.",       notes: "Masculine noun. Pl: die Schlüssel." },
  { front: "sauber",        back: "تمیز",        sentence: "Das Haus ist sehr sauber.",        translation: "خانه خیلی تمیز است.",           notes: "Adjective. Opposite: schmutzig (dirty)." },
  { front: "schmutzig",     back: "کثیف",        sentence: "Die Küche ist schmutzig.",         translation: "آشپزخانه کثیف است.",            notes: "Adjective. Opposite: sauber (clean)." },
  { front: "wohnen",        back: "زندگی کردن / ساکن بودن", sentence: "Ich wohne in Berlin.", translation: "من در برلین زندگی می‌کنم.",     notes: "Regular verb. wohne / wohnst / wohnt." },
  { front: "putzen",        back: "تمیز کردن",   sentence: "Ich putze jeden Samstag die Wohnung.", translation: "هر شنبه آپارتمان را تمیز می‌کنم.", notes: "Regular verb. putze / putzt." },
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
