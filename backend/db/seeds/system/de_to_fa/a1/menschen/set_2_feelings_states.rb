set = Deck.find_by!(name: "Menschen", is_system: true)
          .flashcard_sets
          .find_or_create_by!(name: "Set 2 – Feelings & States") { |s| s.position = 1 }

[
  { front: "glücklich",    back: "خوشحال",       sentence: "Ich bin sehr glücklich heute.",     translation: "امروز خیلی خوشحالم.",           notes: "Adjective. More formal than 'froh'." },
  { front: "traurig",      back: "غمگین",        sentence: "Warum bist du so traurig?",         translation: "چرا انقدر غمگینی؟",             notes: "Adjective. Opposite: glücklich/froh." },
  { front: "müde",         back: "خسته",         sentence: "Ich bin so müde, ich schlafe gleich.", translation: "انقدر خسته‌ام، الان می‌خوابم.", notes: "Adjective. 'Todmüde' = dead tired." },
  { front: "aufgeregt",    back: "هیجان‌زده",    sentence: "Die Kinder sind sehr aufgeregt.",   translation: "بچه‌ها خیلی هیجان‌زده هستند.",  notes: "Adjective. Can also mean nervous/excited." },
  { front: "nervös",       back: "عصبی / نگران", sentence: "Ich bin nervös vor dem Examen.",    translation: "قبل از امتحان عصبی هستم.",       notes: "Adjective. Borrowed from French." },
  { front: "satt",         back: "سیر",          sentence: "Nein danke, ich bin satt.",         translation: "نه ممنون، سیر شدم.",            notes: "Adjective. Opposite of hungrig (hungry)." },
  { front: "durstig",      back: "تشنه",         sentence: "Es ist heiß, ich bin durstig.",     translation: "گرم است، تشنه‌ام.",             notes: "Adjective. 'Durst haben' is also common." },
  { front: "froh",         back: "شاد",          sentence: "Ich bin froh, dass du hier bist.",  translation: "خوشحالم که اینجایی.",           notes: "Adjective. More casual than 'glücklich'." },
  { front: "böse",         back: "عصبانی / بد",  sentence: "Bist du böse auf mich?",           translation: "از دستم عصبانی هستی؟",           notes: "Adjective. 'Böse auf jemanden sein' = to be angry at sb." },
  { front: "ängstlich",    back: "ترسیده",       sentence: "Das Kind ist ängstlich.",           translation: "بچه ترسیده است.",               notes: "Adjective. From Angst (fear)." },
  { front: "ruhig",        back: "آرام",         sentence: "Bleib ruhig!",                      translation: "آرام باش!",                     notes: "Adjective. Also means quiet. 'Ruhig bleiben' = to stay calm." },
  { front: "laut",         back: "بلند / پر سر و صدا", sentence: "Die Musik ist zu laut.",    translation: "موسیقی خیلی بلند است.",         notes: "Adjective. Opposite: leise (quiet). Also: loud." },
  { front: "leise",        back: "آهسته / ساکت",sentence: "Sei bitte leise!",                  translation: "لطفاً ساکت باش!",               notes: "Adjective. Opposite: laut. 'Leise reden' = to speak quietly." },
  { front: "fühlen",       back: "احساس کردن",   sentence: "Wie fühlst du dich heute?",         translation: "امروز چطور احساس می‌کنی؟",      notes: "Regular verb. 'Sich fühlen' = to feel (reflexive)." },
  { front: "weinen",       back: "گریه کردن",    sentence: "Das Baby weint.",                   translation: "نوزاد گریه می‌کند.",            notes: "Regular verb. weine / weinst / weint." },
  { front: "lachen",       back: "خندیدن",       sentence: "Er lacht gerne.",                   translation: "دوست دارد بخندد.",              notes: "Regular verb. lache / lachst / lacht." },
  { front: "lieben",       back: "دوست داشتن / عاشق بودن", sentence: "Ich liebe meine Familie.", translation: "خانواده‌ام را دوست دارم.",    notes: "Regular verb. Stronger than 'mögen'." },
  { front: "mögen",        back: "دوست داشتن",   sentence: "Ich mag Musik.",                    translation: "من موسیقی دوست دارم.",          notes: "Modal verb. mag / magst / mag. Softer than 'lieben'." },
  { front: "wollen",       back: "خواستن",       sentence: "Ich will Deutsch lernen.",          translation: "می‌خواهم آلمانی یاد بگیرم.",   notes: "Modal verb. will / willst / will." },
  { front: "können",       back: "توانستن",      sentence: "Kannst du mir helfen?",             translation: "می‌توانی به من کمک کنی؟",      notes: "Modal verb. kann / kannst / kann." },
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
