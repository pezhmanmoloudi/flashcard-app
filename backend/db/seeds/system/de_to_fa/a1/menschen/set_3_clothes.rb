set = Deck.find_by!(name: "Menschen", is_system: true, language_pair: "de_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 3 – Clothes") { |s| s.position = 2 }

[
  { front: "das Hemd",     back: "پیراهن (مردانه)", sentence: "Er trägt ein weißes Hemd.",     translation: "او یک پیراهن سفید می‌پوشد.",    notes: "Neuter noun. Pl: die Hemden." },
  { front: "die Bluse",    back: "بلوز",         sentence: "Die Bluse ist aus Seide.",          translation: "بلوز از ابریشم است.",           notes: "Feminine noun. Pl: die Blusen." },
  { front: "die Hose",     back: "شلوار",        sentence: "Diese Hose ist zu eng.",            translation: "این شلوار خیلی تنگ است.",       notes: "Feminine noun. Pl: die Hosen. Always singular in German." },
  { front: "der Rock",     back: "دامن",         sentence: "Sie trägt einen roten Rock.",       translation: "او یک دامن قرمز می‌پوشد.",      notes: "Masculine noun. Pl: die Röcke." },
  { front: "das Kleid",    back: "لباس (زنانه)", sentence: "Das Kleid steht dir sehr gut.",     translation: "این لباس خیلی بهت میاد.",       notes: "Neuter noun. Pl: die Kleider." },
  { front: "der Anzug",    back: "کت و شلوار",   sentence: "Er trägt einen Anzug zur Arbeit.",  translation: "سر کار کت و شلوار می‌پوشد.",   notes: "Masculine noun. Pl: die Anzüge." },
  { front: "der Pullover", back: "پلیور",        sentence: "Es ist kalt – zieh einen Pullover an!", translation: "هوا سرده – یه پلیور بپوش!", notes: "Masculine noun. Pl: die Pullover." },
  { front: "die Jacke",    back: "کت / ژاکت",   sentence: "Vergiss deine Jacke nicht!",        translation: "ژاکتت را فراموش نکن!",          notes: "Feminine noun. Pl: die Jacken." },
  { front: "der Mantel",   back: "پالتو / کت",   sentence: "Es ist kalt. Nimm deinen Mantel.",  translation: "هوا سرد است. پالتوت را ببر.",   notes: "Masculine noun. Pl: die Mäntel." },
  { front: "der Schuh",    back: "کفش",          sentence: "Meine Schuhe sind zu klein.",       translation: "کفش‌هایم خیلی کوچکند.",         notes: "Masculine noun. Pl: die Schuhe." },
  { front: "der Stiefel",  back: "بوت / چکمه",  sentence: "Sie trägt hohe Stiefel.",           translation: "او بوت‌های بلند می‌پوشد.",      notes: "Masculine noun. Pl: die Stiefel." },
  { front: "die Socke",    back: "جوراب",        sentence: "Ich suche meine Socken.",           translation: "دنبال جوراب‌هایم می‌گردم.",     notes: "Feminine noun. Pl: die Socken." },
  { front: "die Mütze",    back: "کلاه (بافتنی)", sentence: "Im Winter trage ich eine Mütze.", translation: "در زمستان کلاه می‌پوشم.",       notes: "Feminine noun. Pl: die Mützen. Knitted/winter hat." },
  { front: "der Schal",    back: "شال",          sentence: "Der Schal hält den Hals warm.",     translation: "شال گردن را گرم نگه می‌دارد.", notes: "Masculine noun. Pl: die Schals." },
  { front: "die Handschuhe", back: "دستکش",     sentence: "Es ist kalt, zieh Handschuhe an.",  translation: "هوا سرد است، دستکش بپوش.",      notes: "Always plural. Singular: der Handschuh." },
  { front: "tragen",       back: "پوشیدن / حمل کردن", sentence: "Was trägst du heute?",       translation: "امروز چی پوشیدی؟",              notes: "Strong verb. trage / trägst / trägt. Means to wear or to carry." },
  { front: "anziehen",     back: "پوشیدن (لباس)", sentence: "Zieh dir schnell an!",            translation: "سریع لباس بپوش!",               notes: "Separable verb. ziehe an / ziehst an. To put on clothes." },
  { front: "ausziehen",    back: "درآوردن (لباس)", sentence: "Zieh deine Schuhe aus!",          translation: "کفش‌هایت را دربیار!",           notes: "Separable verb. ziehe aus / ziehst aus. To take off clothing." },
  { front: "eng",          back: "تنگ",          sentence: "Diese Hose ist mir zu eng.",        translation: "این شلوار برام تنگه.",           notes: "Adjective. Opposite: weit (loose/wide)." },
  { front: "bequem",       back: "راحت",         sentence: "Diese Schuhe sind sehr bequem.",    translation: "این کفش‌ها خیلی راحتند.",       notes: "Adjective. Means comfortable. Opposite: unbequem." },
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
