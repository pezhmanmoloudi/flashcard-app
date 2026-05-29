set = Deck.find_by!(name: "Unterwegs", is_system: true, language_pair: "de_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 1 – Transport & Directions") { |s| s.position = 0 }

[
  { front: "das Auto",        back: "ماشین",       sentence: "Das Auto ist kaputt.",              translation: "ماشین خراب است.",               notes: "Neuter noun. Pl: die Autos." },
  { front: "der Bus",         back: "اتوبوس",      sentence: "Der Bus kommt in fünf Minuten.",    translation: "اتوبوس پنج دقیقه دیگر می‌آید.",  notes: "Masculine noun. Pl: die Busse." },
  { front: "die U-Bahn",      back: "مترو",        sentence: "Ich nehme jeden Tag die U-Bahn.",   translation: "هر روز با مترو می‌روم.",         notes: "Feminine noun. Pl: die U-Bahnen. Short for Untergrundbahn." },
  { front: "der Zug",         back: "قطار",        sentence: "Der Zug hat Verspätung.",           translation: "قطار تأخیر دارد.",              notes: "Masculine noun. Pl: die Züge." },
  { front: "das Flugzeug",    back: "هواپیما",     sentence: "Das Flugzeug landet in einer Stunde.", translation: "هواپیما یک ساعت دیگر فرود می‌آید.", notes: "Neuter noun. Pl: die Flugzeuge." },
  { front: "das Fahrrad",     back: "دوچرخه",      sentence: "Ich fahre mit dem Fahrrad zur Arbeit.", translation: "با دوچرخه سر کار می‌روم.",    notes: "Neuter noun. Pl: die Fahrräder." },
  { front: "der Bahnhof",     back: "ایستگاه قطار", sentence: "Wo ist der nächste Bahnhof?",      translation: "نزدیک‌ترین ایستگاه قطار کجاست؟", notes: "Masculine noun. Pl: die Bahnhöfe." },
  { front: "der Flughafen",   back: "فرودگاه",     sentence: "Der Flughafen ist sehr weit.",      translation: "فرودگاه خیلی دور است.",          notes: "Masculine noun. Pl: die Flughäfen." },
  { front: "die Haltestelle", back: "ایستگاه",     sentence: "Die Haltestelle ist gleich um die Ecke.", translation: "ایستگاه درست سر کوچه است.", notes: "Feminine noun. Pl: die Haltestellen. For bus/tram stops." },
  { front: "links",           back: "چپ",          sentence: "Biegen Sie links ab.",              translation: "به چپ بپیچید.",                 notes: "Adverb/adjective. Direction. 'Nach links' = to the left." },
  { front: "rechts",          back: "راست",        sentence: "Das Hotel ist rechts.",             translation: "هتل سمت راست است.",             notes: "Adverb/adjective. Direction. 'Nach rechts' = to the right." },
  { front: "geradeaus",       back: "مستقیم",      sentence: "Gehen Sie immer geradeaus.",        translation: "همیشه مستقیم بروید.",            notes: "Adverb. Means straight ahead." },
  { front: "die Straße",      back: "خیابان",      sentence: "Ich wohne in der Hauptstraße.",     translation: "در خیابان اصلی زندگی می‌کنم.",   notes: "Feminine noun. Pl: die Straßen." },
  { front: "die Kreuzung",    back: "چهارراه",     sentence: "An der Kreuzung rechts abbiegen.",  translation: "در چهارراه به راست بپیچید.",     notes: "Feminine noun. Pl: die Kreuzungen." },
  { front: "nah",             back: "نزدیک",       sentence: "Der Supermarkt ist nicht weit, er ist nah.", translation: "سوپرمارکت دور نیست، نزدیک است.", notes: "Adjective. Opposite: weit/fern (far)." },
  { front: "weit",            back: "دور",         sentence: "Der Flughafen ist weit vom Zentrum.", translation: "فرودگاه از مرکز شهر دور است.", notes: "Adjective. Opposite: nah/nah dran (close)." },
  { front: "fahren",          back: "رفتن (با وسیله)", sentence: "Ich fahre mit dem Bus.",        translation: "با اتوبوس می‌روم.",             notes: "Strong verb. fahre / fährst / fährt. To drive/travel." },
  { front: "gehen",           back: "رفتن (پیاده)", sentence: "Ich gehe zu Fuß.",                 translation: "پیاده می‌روم.",                 notes: "Irregular verb. gehe / gehst / geht." },
  { front: "aussteigen",      back: "پیاده شدن",   sentence: "Wir steigen hier aus.",             translation: "اینجا پیاده می‌شویم.",          notes: "Separable verb. steige aus / steigst aus." },
  { front: "einsteigen",      back: "سوار شدن",    sentence: "Bitte schnell einsteigen!",         translation: "لطفاً سریع سوار شوید!",          notes: "Separable verb. steige ein / steigst ein." },
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
