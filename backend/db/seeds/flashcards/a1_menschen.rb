deck = Deck.find_by!(name: "Menschen", is_system: true)

flashcard_data = {
  "Set 1 – Family" => [
    { front: "die Familie",   back: "خانواده",     sentence: "Meine Familie ist sehr groß.",      translation: "خانواده‌ام خیلی بزرگ است.",      notes: "Feminine noun. Pl: die Familien." },
    { front: "die Mutter",    back: "مادر",        sentence: "Meine Mutter kocht sehr gut.",      translation: "مادرم خیلی خوب آشپزی می‌کند.",  notes: "Feminine noun. Pl: die Mütter. Informal: die Mama." },
    { front: "der Vater",     back: "پدر",         sentence: "Mein Vater arbeitet in einer Bank.", translation: "پدرم در یک بانک کار می‌کند.",   notes: "Masculine noun. Pl: die Väter. Informal: der Papa." },
    { front: "die Eltern",    back: "والدین",      sentence: "Meine Eltern wohnen in München.",   translation: "والدینم در مونیخ زندگی می‌کنند.", notes: "Always plural. Singular form is not used." },
    { front: "das Kind",      back: "بچه / فرزند", sentence: "Das Kind spielt im Garten.",        translation: "بچه در باغ بازی می‌کند.",        notes: "Neuter noun. Pl: die Kinder." },
    { front: "der Bruder",    back: "برادر",       sentence: "Ich habe einen älteren Bruder.",    translation: "یک برادر بزرگتر دارم.",         notes: "Masculine noun. Pl: die Brüder." },
    { front: "die Schwester", back: "خواهر",       sentence: "Meine Schwester studiert Medizin.", translation: "خواهرم پزشکی می‌خواند.",        notes: "Feminine noun. Pl: die Schwestern." },
    { front: "der Großvater", back: "پدربزرگ",     sentence: "Mein Großvater ist 80 Jahre alt.",  translation: "پدربزرگم ۸۰ سال دارد.",         notes: "Masculine noun. Pl: die Großväter. Informal: Opa." },
    { front: "die Großmutter", back: "مادربزرگ",   sentence: "Die Großmutter backt Kuchen.",      translation: "مادربزرگ کیک می‌پزد.",          notes: "Feminine noun. Pl: die Großmütter. Informal: Oma." },
    { front: "der Mann",      back: "مرد / شوهر",  sentence: "Das ist mein Mann.",                translation: "این شوهرم است.",                notes: "Masculine noun. Pl: die Männer. Context-dependent: man/husband." },
    { front: "die Frau",      back: "زن / همسر",   sentence: "Das ist meine Frau.",               translation: "این همسرم است.",                notes: "Feminine noun. Pl: die Frauen. Context: woman/wife." },
    { front: "der Sohn",      back: "پسر",         sentence: "Mein Sohn ist fünf Jahre alt.",     translation: "پسرم پنج سال دارد.",            notes: "Masculine noun. Pl: die Söhne." },
    { front: "die Tochter",   back: "دختر",        sentence: "Meine Tochter lernt gerade Gitarre.", translation: "دخترم الان گیتار یاد می‌گیرد.", notes: "Feminine noun. Pl: die Töchter." },
    { front: "der Onkel",     back: "عمو / دایی",  sentence: "Mein Onkel besucht uns am Sonntag.", translation: "عمویم یکشنبه به ما سر می‌زند.", notes: "Masculine noun. Pl: die Onkel." },
    { front: "die Tante",     back: "عمه / خاله",  sentence: "Meine Tante wohnt in Hamburg.",     translation: "خاله‌ام در هامبورگ زندگی می‌کند.", notes: "Feminine noun. Pl: die Tanten." },
    { front: "der Freund",    back: "دوست (پسر)",  sentence: "Mein Freund heißt Lukas.",          translation: "دوستم اسمش لوکاس است.",         notes: "Masculine noun. Pl: die Freunde. Can mean friend or boyfriend." },
    { front: "die Freundin",  back: "دوست (دختر)", sentence: "Das ist meine beste Freundin.",     translation: "این بهترین دوستم است.",          notes: "Feminine noun. Pl: die Freundinnen. Friend or girlfriend." },
    { front: "alt",           back: "پیر / قدیمی", sentence: "Wie alt bist du?",                  translation: "چند سالته؟",                    notes: "Adjective. 'Wie alt bist du?' = how old are you?" },
    { front: "jung",          back: "جوان",        sentence: "Sie ist noch sehr jung.",           translation: "او هنوز خیلی جوان است.",         notes: "Adjective. Comparative: jünger. Superlative: jüngste." },
    { front: "verheiratet",   back: "متأهل",       sentence: "Sind Sie verheiratet?",             translation: "متأهل هستید؟",                  notes: "Adjective. 'Ledig' = single. 'Geschieden' = divorced." },
  ],

  "Set 2 – Feelings & States" => [
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
  ],

  "Set 3 – Clothes" => [
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

puts "  → Menschen flashcards seeded"
