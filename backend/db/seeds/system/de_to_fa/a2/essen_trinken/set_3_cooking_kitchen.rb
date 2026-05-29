set = Deck.find_by!(name: "Essen & Trinken", is_system: true)
          .flashcard_sets
          .find_or_create_by!(name: "Set 3 – Cooking & Kitchen") { |s| s.position = 2 }

[
  { front: "kochen",          back: "آشپزی کردن / پختن", sentence: "Ich koche heute Abend Pasta.", translation: "امشب ماکارانی می‌پزم.",         notes: "Regular verb. kochen = to cook/boil." },
  { front: "braten",          back: "سرخ کردن / بریان", sentence: "Ich brate das Fleisch in der Pfanne.", translation: "گوشت را در تابه سرخ می‌کنم.", notes: "Strong verb. brate / brätst / brät." },
  { front: "backen",          back: "پختن (در فر)",    sentence: "Ich backe einen Kuchen.",          translation: "یک کیک می‌پزم.",               notes: "Strong verb. backe / bäckst / bäckt." },
  { front: "schneiden",       back: "بریدن",       sentence: "Schneide bitte die Zwiebeln.",      translation: "لطفاً پیازها را برش بده.",      notes: "Strong verb. schneide / schneidest / schneidet." },
  { front: "mischen",         back: "مخلوط کردن",  sentence: "Misch die Zutaten gut.",            translation: "مواد را خوب مخلوط کن.",         notes: "Regular verb. mische / mischst / mischt." },
  { front: "die Pfanne",      back: "تابه",        sentence: "Die Pfanne ist heiß.",              translation: "تابه داغ است.",                 notes: "Feminine noun. Pl: die Pfannen. Frying pan." },
  { front: "der Topf",        back: "قابلمه",      sentence: "Stell den Topf auf den Herd.",      translation: "قابلمه را روی اجاق بگذار.",     notes: "Masculine noun. Pl: die Töpfe." },
  { front: "der Herd",        back: "اجاق",        sentence: "Der Herd ist sehr modern.",         translation: "اجاق خیلی مدرن است.",           notes: "Masculine noun. Pl: die Herde." },
  { front: "der Backofen",    back: "فر",          sentence: "Den Backofen auf 180 Grad vorheizen.", translation: "فر را تا ۱۸۰ درجه گرم کن.",  notes: "Masculine noun. Pl: die Backöfen." },
  { front: "der Kühlschrank", back: "یخچال",       sentence: "Das Essen ist im Kühlschrank.",     translation: "غذا در یخچال است.",             notes: "Masculine noun. Pl: die Kühlschränke." },
  { front: "das Messer",      back: "چاقو",        sentence: "Das Messer ist scharf.",            translation: "چاقو تیز است.",                 notes: "Neuter noun. Pl: die Messer." },
  { front: "die Gabel",       back: "چنگال",       sentence: "Kannst du mir eine Gabel geben?",   translation: "می‌توانی یک چنگال به من بدهی؟", notes: "Feminine noun. Pl: die Gabeln." },
  { front: "der Löffel",      back: "قاشق",        sentence: "Rühr die Suppe mit einem Löffel.",  translation: "سوپ را با قاشق هم بزن.",        notes: "Masculine noun. Pl: die Löffel." },
  { front: "das Rezept",      back: "دستور پخت",   sentence: "Hast du ein gutes Rezept?",         translation: "یک دستور پخت خوب داری؟",        notes: "Neuter noun. Pl: die Rezepte." },
  { front: "die Zutat",       back: "ماده اولیه",  sentence: "Wir brauchen frische Zutaten.",     translation: "به مواد اولیه تازه نیاز داریم.", notes: "Feminine noun. Pl: die Zutaten. Ingredient." },
  { front: "das Öl",          back: "روغن",        sentence: "Erhitze etwas Öl in der Pfanne.",   translation: "کمی روغن در تابه گرم کن.",      notes: "Neuter noun. Pl: die Öle." },
  { front: "das Mehl",        back: "آرد",         sentence: "Ich brauche 200 Gramm Mehl.",       translation: "دویست گرم آرد لازم دارم.",      notes: "Neuter noun. No plural in common use." },
  { front: "würzen",          back: "ادویه زدن",   sentence: "Würze das Gericht mit Salz und Pfeffer.", translation: "غذا را با نمک و فلفل ادویه بزن.", notes: "Regular verb. würze / würzt." },
  { front: "heiß",            back: "داغ",         sentence: "Vorsicht, die Pfanne ist heiß!",    translation: "مواظب باش، تابه داغه!",         notes: "Adjective. Opposite: kalt (cold). Also: hot weather." },
  { front: "fertig",          back: "آماده / تمام شده", sentence: "Das Essen ist fertig!",        translation: "غذا آماده است!",               notes: "Adjective. 'Fertig sein' = to be done/ready." },
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
