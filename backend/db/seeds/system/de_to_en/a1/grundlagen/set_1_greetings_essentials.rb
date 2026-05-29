set = Deck.find_by!(name: "Grundlagen", is_system: true, language_pair: "de_to_en")
          .flashcard_sets
          .find_or_create_by!(name: "Set 1 – Greetings & Essentials") { |s| s.position = 0 }

[
  { front: "Hallo",              back: "Hello",                    sentence: "Hallo, wie geht es dir?",               translation: "Hello, how are you?",                  notes: "Informal greeting. Use with friends and people your age." },
  { front: "Guten Morgen",       back: "Good morning",             sentence: "Guten Morgen! Hast du gut geschlafen?",  translation: "Good morning! Did you sleep well?",    notes: "Used until about 10–11 am. Formal and informal." },
  { front: "Guten Tag",          back: "Good day / Hello",         sentence: "Guten Tag, ich bin Herr Müller.",        translation: "Good day, I am Mr Müller.",             notes: "Standard daytime greeting. Common in formal settings." },
  { front: "Guten Abend",        back: "Good evening",             sentence: "Guten Abend! Wie war Ihr Tag?",          translation: "Good evening! How was your day?",      notes: "Evening greeting, from around 6 pm. More formal." },
  { front: "Gute Nacht",         back: "Good night",               sentence: "Gute Nacht, schlaf gut!",               translation: "Good night, sleep well!",               notes: "Farewell at night/bedtime. Not used as a greeting." },
  { front: "Auf Wiedersehen",    back: "Goodbye (formal)",         sentence: "Auf Wiedersehen und vielen Dank!",       translation: "Goodbye and thank you very much!",     notes: "Formal farewell. Literally 'until we see each other again'." },
  { front: "Tschüss",            back: "Bye (informal)",           sentence: "Tschüss, bis morgen!",                  translation: "Bye, see you tomorrow!",               notes: "Informal/casual farewell. Very common in everyday speech." },
  { front: "Bitte",              back: "Please / You're welcome",  sentence: "Können Sie mir bitte helfen?",           translation: "Could you please help me?",            notes: "Means both 'please' and 'you're welcome'." },
  { front: "Danke",              back: "Thank you",                sentence: "Danke für deine Hilfe!",                translation: "Thank you for your help!",             notes: "Basic thanks. 'Danke schön' is more emphatic." },
  { front: "Danke schön",        back: "Thank you very much",      sentence: "Danke schön, das ist sehr nett.",        translation: "Thank you very much, that is very kind.", notes: "Stronger form of 'danke'. Polite and warm." },
  { front: "Ja",                 back: "Yes",                      sentence: "Ja, ich komme gerne mit.",              translation: "Yes, I'd love to come along.",         notes: "Standard 'yes'." },
  { front: "Nein",               back: "No",                       sentence: "Nein, das stimmt nicht.",               translation: "No, that is not correct.",             notes: "Standard 'no'. Firm but polite." },
  { front: "Entschuldigung",     back: "Excuse me / Sorry",        sentence: "Entschuldigung, wo ist der Bahnhof?",   translation: "Excuse me, where is the train station?", notes: "Used to get attention or apologise. Very versatile." },
  { front: "Es tut mir leid",    back: "I'm sorry",                sentence: "Es tut mir leid, ich habe das vergessen.", translation: "I'm sorry, I forgot that.",          notes: "Sincere apology. Stronger than 'Entschuldigung'." },
  { front: "Wie heißen Sie?",    back: "What is your name? (formal)", sentence: "Wie heißen Sie? Ich heiße Maria.", translation: "What is your name? My name is Maria.", notes: "Formal. Informal version: 'Wie heißt du?'" },
  { front: "Ich heiße …",        back: "My name is …",             sentence: "Ich heiße Thomas. Und du?",             translation: "My name is Thomas. And you?",          notes: "Standard self-introduction. 'Mein Name ist …' is more formal." },
  { front: "Woher kommen Sie?",  back: "Where are you from? (formal)", sentence: "Woher kommen Sie? Aus England?",  translation: "Where are you from? From England?",   notes: "Formal. Informal: 'Woher kommst du?'" },
  { front: "Ich komme aus …",    back: "I am from …",              sentence: "Ich komme aus Deutschland.",            translation: "I am from Germany.",                   notes: "Use with country names. 'Ich bin aus …' is also common." },
  { front: "Wie geht es Ihnen?", back: "How are you? (formal)",    sentence: "Wie geht es Ihnen? – Sehr gut, danke!", translation: "How are you? – Very well, thank you!", notes: "Formal. Informal: 'Wie geht's dir?'" },
  { front: "Gut, danke",         back: "Fine, thank you",          sentence: "Gut, danke. Und Ihnen?",                translation: "Fine, thank you. And you?",             notes: "Standard polite response to 'Wie geht es Ihnen?'" },
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
