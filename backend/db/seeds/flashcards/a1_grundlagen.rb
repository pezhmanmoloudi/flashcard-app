deck = Deck.find_by!(name: "Grundlagen", is_system: true)

flashcard_data = {
  "Set 1 – Greetings & Essentials" => [
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
  ],

  "Set 2 – Numbers & Time" => [
    { front: "eins",               back: "یک",       sentence: "Ich habe eins gefunden.",          translation: "یکی پیدا کردم.",                 notes: "Cardinal number 1. 'Ein/eine' used before nouns." },
    { front: "zwei",               back: "دو",        sentence: "Ich habe zwei Kinder.",            translation: "من دو بچه دارم.",                notes: "Cardinal 2. 'Beide' = 'both two'." },
    { front: "drei",               back: "سه",        sentence: "Das kostet drei Euro.",            translation: "این سه یورو هزینه دارد.",         notes: "Cardinal 3." },
    { front: "vier",               back: "چهار",      sentence: "Der Zug fährt um vier Uhr ab.",    translation: "قطار ساعت چهار حرکت می‌کند.",    notes: "Cardinal 4." },
    { front: "fünf",               back: "پنج",       sentence: "Wir treffen uns um fünf.",         translation: "ساعت پنج قرار می‌گذاریم.",       notes: "Cardinal 5." },
    { front: "zehn",               back: "ده",        sentence: "Sie ist zehn Jahre alt.",          translation: "او ده سال دارد.",                notes: "Cardinal 10." },
    { front: "zwanzig",            back: "بیست",      sentence: "Es sind noch zwanzig Minuten.",    translation: "هنوز بیست دقیقه مانده.",         notes: "Cardinal 20." },
    { front: "hundert",            back: "صد",        sentence: "Das kostet hundert Euro.",         translation: "این صد یورو هزینه دارد.",         notes: "Cardinal 100. 'Ein hundert' is also used." },
    { front: "heute",              back: "امروز",     sentence: "Heute ist Montag.",                translation: "امروز دوشنبه است.",              notes: "Adverb of time. Refers to the current day." },
    { front: "morgen",             back: "فردا",      sentence: "Morgen gehe ich zum Arzt.",        translation: "فردا پیش دکتر می‌روم.",          notes: "Also means 'morning' (der Morgen)." },
    { front: "gestern",            back: "دیروز",     sentence: "Gestern war ich sehr müde.",       translation: "دیروز خیلی خسته بودم.",          notes: "Adverb of time. Always refers to the previous day." },
    { front: "jetzt",              back: "الان / حالا", sentence: "Ich bin jetzt bereit.",           translation: "الان آماده‌ام.",                 notes: "Immediate present time." },
    { front: "die Stunde",         back: "ساعت (واحد زمان)", sentence: "Die Fahrt dauert eine Stunde.", translation: "سفر یک ساعت طول می‌کشد.",     notes: "Feminine noun. Pl: die Stunden." },
    { front: "die Minute",         back: "دقیقه",     sentence: "Warte bitte fünf Minuten.",        translation: "لطفاً پنج دقیقه صبر کن.",       notes: "Feminine noun. Pl: die Minuten." },
    { front: "die Uhr",            back: "ساعت (وسیله)", sentence: "Meine Uhr ist kaputt.",           translation: "ساعتم خراب است.",               notes: "Feminine noun. Also means 'o'clock'." },
    { front: "Wie spät ist es?",   back: "ساعت چند است؟", sentence: "Entschuldigung, wie spät ist es?", translation: "ببخشید، ساعت چند است؟",       notes: "Common way to ask the time." },
    { front: "Es ist drei Uhr",    back: "ساعت سه است",  sentence: "Es ist genau drei Uhr.",          translation: "دقیقاً ساعت سه است.",            notes: "Stating the time. Add 'Uhr' after the number." },
    { front: "der Montag",         back: "دوشنبه",    sentence: "Am Montag habe ich Kurs.",         translation: "روز دوشنبه کلاس دارم.",          notes: "All days are masculine (der). Pl: die Montage." },
    { front: "der Samstag",        back: "شنبه",      sentence: "Am Samstag schlafe ich aus.",      translation: "روز شنبه تا دیر وقت می‌خوابم.", notes: "'Sonnabend' is an alternative in northern Germany." },
    { front: "das Wochenende",     back: "آخر هفته",  sentence: "Was machst du am Wochenende?",    translation: "آخر هفته چیکار می‌کنی؟",        notes: "Neuter noun. Pl: die Wochenenden." },
  ],

  "Set 3 – Colors & Shapes" => [
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
  ],
}.freeze

deck.flashcard_sets.each do |set|
  cards = DATA[set.name]
  next unless cards

  cards.each do |c|
    Flashcard.find_or_create_by!(flashcard_set: set, front_text: c[:front]) do |f|
      f.back_text           = c[:back]
      f.example_sentence    = c[:sentence]
      f.translated_sentence = c[:translation]
      f.grammar_notes       = c[:notes]
      f.source_language     = "german"
      f.target_language     = "persian"
    end
  end
end

puts "  → Grundlagen flashcards seeded"
