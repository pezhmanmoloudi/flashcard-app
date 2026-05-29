set = Deck.find_by!(name: "Grundlagen", is_system: true, language_pair: "de_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 1 – Greetings & Essentials") { |s| s.position = 0 }

[
  { front: "Hallo",              back: "سلام",               sentence: "Hallo, wie geht es dir?",          translation: "سلام، حالت چطوره؟",            notes: "Informal greeting. Use with friends and people your age." },
  { front: "Guten Morgen",       back: "صبح بخیر",            sentence: "Guten Morgen! Hast du gut geschlafen?", translation: "صبح بخیر! خوب خوابیدی؟",     notes: "Used until about 10–11 am. Formal and informal." },
  { front: "Guten Tag",          back: "روز بخیر",            sentence: "Guten Tag, ich bin Herr Müller.",  translation: "روز بخیر، من آقای مولر هستم.",   notes: "Standard daytime greeting. Common in formal settings." },
  { front: "Guten Abend",        back: "شب بخیر (سلام شبانه)", sentence: "Guten Abend! Wie war Ihr Tag?",    translation: "شب بخیر! روزتان چطور بود؟",     notes: "Evening greeting, from around 6 pm. More formal." },
  { front: "Gute Nacht",         back: "شب بخیر (خداحافظی)",  sentence: "Gute Nacht, schlaf gut!",          translation: "شب بخیر، خوب بخواب!",           notes: "Farewell at night/bedtime. Not a greeting." },
  { front: "Auf Wiedersehen",    back: "خداحافظ (رسمی)",      sentence: "Auf Wiedersehen und vielen Dank!", translation: "خداحافظ و خیلی ممنون!",          notes: "Formal farewell. Literally 'until we see each other again'." },
  { front: "Tschüss",            back: "خداحافظ (دوستانه)",   sentence: "Tschüss, bis morgen!",            translation: "خداحافظ، تا فردا!",              notes: "Informal/casual farewell. Very common in everyday speech." },
  { front: "Bitte",              back: "لطفاً / خواهش می‌کنم", sentence: "Können Sie mir bitte helfen?",     translation: "می‌توانید لطفاً کمکم کنید؟",    notes: "Means both 'please' and 'you're welcome'." },
  { front: "Danke",              back: "ممنون",               sentence: "Danke für deine Hilfe!",          translation: "ممنون از کمکت!",                notes: "Basic thanks. 'Danke schön' is more emphatic." },
  { front: "Danke schön",        back: "خیلی ممنون",          sentence: "Danke schön, das ist sehr nett.",  translation: "خیلی ممنون، خیلی لطف داری.",     notes: "Stronger form of 'danke'. Polite and warm." },
  { front: "Ja",                 back: "بله / آره",            sentence: "Ja, ich komme gerne mit.",        translation: "بله، خوشحال می‌شم بیام.",        notes: "Standard 'yes'. 'Jа' in informal speech can also be an intensifier." },
  { front: "Nein",               back: "نه / خیر",             sentence: "Nein, das stimmt nicht.",         translation: "نه، این درست نیست.",             notes: "Standard 'no'. Firm but polite." },
  { front: "Entschuldigung",     back: "ببخشید / عذرخواهی",   sentence: "Entschuldigung, wo ist der Bahnhof?", translation: "ببخشید، ایستگاه قطار کجاست؟",  notes: "Used to get attention or apologize. Very versatile." },
  { front: "Es tut mir leid",    back: "متأسفم",              sentence: "Es tut mir leid, ich habe das vergessen.", translation: "متأسفم، فراموش کردم.",   notes: "Sincere apology. Stronger than 'Entschuldigung'." },
  { front: "Wie heißen Sie?",    back: "اسم شما چیست؟",       sentence: "Wie heißen Sie? Ich heiße Maria.", translation: "اسم شما چیست؟ اسم من ماریاست.", notes: "Formal. Informal version: 'Wie heißt du?'" },
  { front: "Ich heiße …",        back: "اسم من … است",        sentence: "Ich heiße Thomas. Und du?",       translation: "اسم من توماس است. و تو؟",        notes: "Standard self-introduction. 'Mein Name ist …' is more formal." },
  { front: "Woher kommen Sie?",  back: "اهل کجا هستید؟",      sentence: "Woher kommen Sie? Aus Iran?",     translation: "اهل کجا هستید؟ از ایران؟",      notes: "Formal. Informal: 'Woher kommst du?'" },
  { front: "Ich komme aus …",    back: "من اهل … هستم",       sentence: "Ich komme aus Deutschland.",      translation: "من اهل آلمان هستم.",             notes: "Use with country names. 'Ich bin aus …' is also common." },
  { front: "Wie geht es Ihnen?", back: "حالتان چطور است؟",    sentence: "Wie geht es Ihnen? – Sehr gut, danke!", translation: "حالتان چطور است؟ – خیلی خوب، ممنون!", notes: "Formal. Informal: 'Wie geht's dir?'" },
  { front: "Gut, danke",         back: "خوب، ممنون",          sentence: "Gut, danke. Und Ihnen?",          translation: "خوب، ممنون. و شما؟",             notes: "Standard polite response to 'Wie geht es Ihnen?'" },
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
