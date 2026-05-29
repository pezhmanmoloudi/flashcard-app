deck = Deck.find_by!(name: "Alltag", is_system: true)

flashcard_data = {
  "Set 1 – At Home" => [
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
  ],

  "Set 2 – Food Basics" => [
    { front: "das Brot",      back: "نان",         sentence: "Ich esse morgens Brot mit Butter.", translation: "صبح‌ها نان با کره می‌خورم.",    notes: "Neuter noun. Pl: die Brote. Central part of German breakfast." },
    { front: "die Butter",    back: "کره",         sentence: "Gib mir bitte die Butter.",        translation: "لطفاً کره را به من بده.",        notes: "Feminine noun. No plural in common use." },
    { front: "das Ei",        back: "تخم مرغ",     sentence: "Ich esse jeden Tag ein Ei.",       translation: "هر روز یک تخم مرغ می‌خورم.",    notes: "Neuter noun. Pl: die Eier." },
    { front: "die Milch",     back: "شیر",         sentence: "Die Milch ist kalt.",              translation: "شیر سرد است.",                  notes: "Feminine noun. No plural in common use." },
    { front: "der Käse",      back: "پنیر",        sentence: "Deutschland hat viele Käsesorten.",  translation: "آلمان انواع زیادی پنیر دارد.", notes: "Masculine noun. Pl: die Käsesorten (types of cheese)." },
    { front: "das Fleisch",   back: "گوشت",        sentence: "Ich esse kein Fleisch.",           translation: "من گوشت نمی‌خورم.",              notes: "Neuter noun. No plural. 'Kein Fleisch' = vegetarian." },
    { front: "der Fisch",     back: "ماهی",        sentence: "Der Fisch schmeckt gut.",          translation: "ماهی خوشمزه است.",              notes: "Masculine noun. Pl: die Fische." },
    { front: "das Gemüse",    back: "سبزیجات",     sentence: "Iss mehr Gemüse!",                 translation: "بیشتر سبزیجات بخور!",           notes: "Neuter noun. Usually singular (collective noun)." },
    { front: "das Obst",      back: "میوه",        sentence: "Obst ist gesund.",                 translation: "میوه سالم است.",                notes: "Neuter noun. Usually singular (collective noun)." },
    { front: "das Wasser",    back: "آب",          sentence: "Ich trinke viel Wasser.",          translation: "زیاد آب می‌نوشم.",              notes: "Neuter noun. 'Stilles Wasser' = still water." },
    { front: "der Kaffee",    back: "قهوه",        sentence: "Jeden Morgen trinke ich Kaffee.",  translation: "هر صبح قهوه می‌نوشم.",          notes: "Masculine noun. Pl: die Kaffees (cups of coffee)." },
    { front: "der Tee",       back: "چای",         sentence: "Magst du Tee mit Milch?",          translation: "چای با شیر دوست داری؟",         notes: "Masculine noun. Pl: die Tees." },
    { front: "der Saft",      back: "آبمیوه",      sentence: "Ich trinke gern Orangensaft.",     translation: "دوست دارم آب پرتقال بنوشم.",    notes: "Masculine noun. Pl: die Säfte." },
    { front: "der Zucker",    back: "شکر",         sentence: "Nimmst du Zucker in den Kaffee?",  translation: "توی قهوه‌ات شکر می‌ریزی؟",      notes: "Masculine noun. No plural in common use." },
    { front: "das Salz",      back: "نمک",         sentence: "Das Essen braucht etwas Salz.",    translation: "غذا کمی نمک لازم دارد.",        notes: "Neuter noun. 'Zu salzig' = too salty." },
    { front: "essen",         back: "خوردن",       sentence: "Was möchtest du essen?",           translation: "چی می‌خوای بخوری؟",             notes: "Irregular verb. esse / isst / isst. Strong verb." },
    { front: "trinken",       back: "نوشیدن",      sentence: "Er trinkt jeden Abend Tee.",       translation: "هر شب چای می‌نوشد.",            notes: "Irregular verb. trinke / trinkst / trinkt." },
    { front: "kochen",        back: "آشپزی کردن",  sentence: "Ich koche heute Abend.",           translation: "امشب آشپزی می‌کنم.",            notes: "Regular verb. koche / kochst / kocht." },
    { front: "lecker",        back: "خوشمزه",      sentence: "Das Essen ist sehr lecker.",       translation: "غذا خیلی خوشمزه است.",          notes: "Adjective. Informal but widely used. Formal: köstlich." },
    { front: "hungrig",       back: "گرسنه",       sentence: "Ich bin hungrig.",                 translation: "گرسنه‌ام.",                     notes: "Adjective. Opposite: satt (full). 'Hunger haben' is also common." },
  ],

  "Set 3 – Body & Health" => [
    { front: "der Kopf",      back: "سر",          sentence: "Mir tut der Kopf weh.",            translation: "سرم درد می‌کند.",               notes: "Masculine noun. Pl: die Köpfe." },
    { front: "das Gesicht",   back: "صورت",        sentence: "Sie hat ein freundliches Gesicht.", translation: "او یک صورت دوستانه دارد.",      notes: "Neuter noun. Pl: die Gesichter." },
    { front: "das Auge",      back: "چشم",         sentence: "Er hat blaue Augen.",              translation: "او چشم آبی دارد.",              notes: "Neuter noun. Pl: die Augen." },
    { front: "die Nase",      back: "بینی",        sentence: "Meine Nase läuft.",                translation: "بینیم آب می‌ریزد.",             notes: "Feminine noun. Pl: die Nasen." },
    { front: "der Mund",      back: "دهان",        sentence: "Mach bitte den Mund auf.",         translation: "لطفاً دهانت را باز کن.",        notes: "Masculine noun. Pl: die Münder." },
    { front: "das Ohr",       back: "گوش",         sentence: "Ich habe Schmerzen im Ohr.",       translation: "گوشم درد می‌کند.",              notes: "Neuter noun. Pl: die Ohren." },
    { front: "der Hals",      back: "گردن / گلو",  sentence: "Mir tut der Hals weh.",            translation: "گلویم درد می‌کند.",             notes: "Masculine noun. Pl: die Hälse." },
    { front: "die Hand",      back: "دست",         sentence: "Gib mir deine Hand.",              translation: "دستت را به من بده.",             notes: "Feminine noun. Pl: die Hände." },
    { front: "der Finger",    back: "انگشت",       sentence: "Ich habe mir den Finger verletzt.", translation: "انگشتم را زخمی کردم.",         notes: "Masculine noun. Pl: die Finger." },
    { front: "der Fuß",       back: "پا",          sentence: "Mein Fuß tut weh.",                translation: "پایم درد می‌کند.",              notes: "Masculine noun. Pl: die Füße." },
    { front: "der Bauch",     back: "شکم",         sentence: "Mir tut der Bauch weh.",           translation: "شکمم درد می‌کند.",              notes: "Masculine noun. Pl: die Bäuche." },
    { front: "der Rücken",    back: "کمر / پشت",   sentence: "Er hat starke Rückenschmerzen.",   translation: "او درد شدید کمر دارد.",         notes: "Masculine noun. Pl: die Rücken." },
    { front: "krank",         back: "مریض",        sentence: "Ich bin krank und bleibe zuhause.",  translation: "مریضم و خانه می‌مانم.",        notes: "Adjective. 'Krank sein' = to be ill." },
    { front: "gesund",        back: "سالم",        sentence: "Sport ist gut für die Gesundheit.", translation: "ورزش برای سلامتی خوب است.",    notes: "Adjective. 'Gesund bleiben' = to stay healthy." },
    { front: "der Schmerz",   back: "درد",         sentence: "Ich habe starke Schmerzen.",       translation: "درد شدیدی دارم.",               notes: "Masculine noun. Pl: die Schmerzen. Common: 'Mir tut … weh'." },
    { front: "das Fieber",    back: "تب",          sentence: "Das Kind hat hohes Fieber.",       translation: "بچه تب بالایی دارد.",           notes: "Neuter noun. No plural. 'Fieber haben' = to have a fever." },
    { front: "der Arzt",      back: "دکتر",        sentence: "Ich muss zum Arzt gehen.",         translation: "باید پیش دکتر بروم.",           notes: "Masculine noun. Pl: die Ärzte. Fem: die Ärztin." },
    { front: "das Krankenhaus", back: "بیمارستان", sentence: "Er liegt im Krankenhaus.",         translation: "او در بیمارستان بستری است.",    notes: "Neuter noun. Pl: die Krankenhäuser." },
    { front: "die Medizin",   back: "دارو / پزشکی", sentence: "Hast du deine Medizin genommen?", translation: "دارویت را خوردی؟",             notes: "Feminine noun. Means both medicine (subject) and medication." },
    { front: "schlafen",      back: "خوابیدن",     sentence: "Ich schlafe acht Stunden.",        translation: "هشت ساعت می‌خوابم.",            notes: "Strong verb. schlafe / schläfst / schläft." },
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

puts "  → Alltag flashcards seeded"
