deck = Deck.find_by!(name: "Unterwegs", is_system: true)

flashcard_data = {
  "Set 1 – Transport & Directions" => [
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
  ],

  "Set 2 – City & Places" => [
    { front: "die Stadt",       back: "شهر",         sentence: "Diese Stadt hat viele Museen.",     translation: "این شهر موزه‌های زیادی دارد.",   notes: "Feminine noun. Pl: die Städte." },
    { front: "das Zentrum",     back: "مرکز شهر",    sentence: "Das Hotel liegt im Zentrum.",       translation: "هتل در مرکز شهر است.",           notes: "Neuter noun. Pl: die Zentren." },
    { front: "der Park",        back: "پارک",        sentence: "Wir gehen in den Park.",            translation: "به پارک می‌رویم.",               notes: "Masculine noun. Pl: die Parks." },
    { front: "das Museum",      back: "موزه",        sentence: "Das Museum ist heute geschlossen.", translation: "موزه امروز بسته است.",            notes: "Neuter noun. Pl: die Museen." },
    { front: "die Kirche",      back: "کلیسا",       sentence: "Die Kirche ist sehr alt.",          translation: "کلیسا خیلی قدیمی است.",         notes: "Feminine noun. Pl: die Kirchen." },
    { front: "das Rathaus",     back: "شهرداری",     sentence: "Das Rathaus ist im Stadtzentrum.",  translation: "شهرداری در مرکز شهر است.",       notes: "Neuter noun. Pl: die Rathäuser." },
    { front: "das Hotel",       back: "هتل",         sentence: "Ich habe ein Zimmer im Hotel.",     translation: "در هتل یک اتاق دارم.",           notes: "Neuter noun. Pl: die Hotels." },
    { front: "das Restaurant",  back: "رستوران",     sentence: "Das Restaurant öffnet um 12 Uhr.",  translation: "رستوران ساعت ۱۲ باز می‌شود.",   notes: "Neuter noun. Pl: die Restaurants." },
    { front: "der Supermarkt",  back: "سوپرمارکت",  sentence: "Ich gehe in den Supermarkt.",       translation: "به سوپرمارکت می‌روم.",           notes: "Masculine noun. Pl: die Supermärkte." },
    { front: "die Apotheke",    back: "داروخانه",    sentence: "Die Apotheke ist bis 20 Uhr offen.", translation: "داروخانه تا ساعت ۸ شب بازه.",  notes: "Feminine noun. Pl: die Apotheken." },
    { front: "das Krankenhaus", back: "بیمارستان",   sentence: "Das Krankenhaus ist in der Nähe.",  translation: "بیمارستان نزدیک است.",           notes: "Neuter noun. Pl: die Krankenhäuser." },
    { front: "die Post",        back: "پست",         sentence: "Ich muss zur Post gehen.",          translation: "باید به اداره پست بروم.",        notes: "Feminine noun. Pl: die Posts. Also: die Poststelle." },
    { front: "die Bank",        back: "بانک",        sentence: "Die Bank öffnet um 9 Uhr.",         translation: "بانک ساعت ۹ باز می‌شود.",       notes: "Feminine noun. Pl: die Banken." },
    { front: "der Markt",       back: "بازار",       sentence: "Am Samstag gibt es einen Markt.",   translation: "روز شنبه بازار هست.",            notes: "Masculine noun. Pl: die Märkte." },
    { front: "die Schule",      back: "مدرسه",       sentence: "Die Schule beginnt um 8 Uhr.",      translation: "مدرسه ساعت ۸ شروع می‌شود.",     notes: "Feminine noun. Pl: die Schulen." },
    { front: "gegenüber",       back: "روبرو",       sentence: "Das Café ist gegenüber dem Bahnhof.", translation: "کافه روبروی ایستگاه قطار است.", notes: "Preposition/adverb. Takes dative case." },
    { front: "neben",           back: "کنار",        sentence: "Das Kino ist neben dem Hotel.",     translation: "سینما کنار هتل است.",            notes: "Preposition. Takes dative (location) or accusative (movement)." },
    { front: "zwischen",        back: "بین",         sentence: "Das Café ist zwischen Bank und Post.", translation: "کافه بین بانک و پست است.",    notes: "Preposition. Takes dative (location) or accusative (movement)." },
    { front: "offen",           back: "باز",         sentence: "Ist das Geschäft heute offen?",     translation: "آیا مغازه امروز باز است؟",       notes: "Adjective. Opposite: geschlossen (closed)." },
    { front: "geschlossen",     back: "بسته",        sentence: "Das Museum ist montags geschlossen.", translation: "موزه روزهای دوشنبه بسته است.", notes: "Adjective. From 'schließen' (to close)." },
  ],

  "Set 3 – Shopping" => [
    { front: "das Geschäft",    back: "مغازه",       sentence: "Das Geschäft hat heute Sonderangebote.", translation: "مغازه امروز تخفیف دارد.",    notes: "Neuter noun. Pl: die Geschäfte." },
    { front: "kaufen",          back: "خریدن",       sentence: "Ich möchte diese Schuhe kaufen.",   translation: "می‌خواهم این کفش‌ها را بخرم.",  notes: "Regular verb. kaufe / kaufst / kauft." },
    { front: "der Preis",       back: "قیمت",        sentence: "Was ist der Preis?",                translation: "قیمت چقدر است؟",               notes: "Masculine noun. Pl: die Preise." },
    { front: "teuer",           back: "گران",        sentence: "Das ist mir zu teuer.",             translation: "برای من خیلی گران است.",         notes: "Adjective. Opposite: billig/günstig (cheap)." },
    { front: "billig",          back: "ارزان",       sentence: "Diese Schuhe sind sehr billig.",    translation: "این کفش‌ها خیلی ارزانند.",       notes: "Adjective. 'Günstig' is more neutral/polite." },
    { front: "die Kasse",       back: "صندوق",       sentence: "Bitte zahlen Sie an der Kasse.",    translation: "لطفاً پیش صندوق بپردازید.",     notes: "Feminine noun. Pl: die Kassen. Checkout/cash register." },
    { front: "der Rabatt",      back: "تخفیف",       sentence: "Gibt es einen Rabatt?",             translation: "تخفیف دارید؟",                  notes: "Masculine noun. Pl: die Rabatte." },
    { front: "das Angebot",     back: "پیشنهاد / تخفیف", sentence: "Das ist ein gutes Angebot!",  translation: "این پیشنهاد خوبیه!",            notes: "Neuter noun. 'Sonderangebot' = special offer." },
    { front: "die Größe",       back: "سایز / اندازه", sentence: "Welche Größe haben Sie?",        translation: "چه سایزی دارید؟",               notes: "Feminine noun. Pl: die Größen. For clothing sizes." },
    { front: "die Kreditkarte", back: "کارت اعتباری", sentence: "Kann ich mit Kreditkarte zahlen?", translation: "می‌توانم با کارت اعتباری بپردازم؟", notes: "Feminine noun. Pl: die Kreditkarten." },
    { front: "das Bargeld",     back: "پول نقد",     sentence: "Zahlen Sie bar oder mit Karte?",   translation: "نقد می‌پردازید یا با کارت؟",     notes: "Neuter noun. No plural. 'Bar zahlen' = to pay cash." },
    { front: "die Tüte",        back: "کیسه",        sentence: "Brauchen Sie eine Tüte?",           translation: "کیسه می‌خواهید؟",               notes: "Feminine noun. Pl: die Tüten. Plastic/paper bag at checkout." },
    { front: "die Quittung",    back: "رسید",        sentence: "Kann ich die Quittung haben?",      translation: "می‌توانم رسید بگیرم؟",          notes: "Feminine noun. Pl: die Quittungen." },
    { front: "umtauschen",      back: "تعویض کردن",  sentence: "Kann ich das umtauschen?",          translation: "می‌توانم آن را تعویض کنم؟",     notes: "Separable verb. tausche um / tauschst um." },
    { front: "suchen",          back: "جستجو کردن",  sentence: "Ich suche ein Geschenk.",           translation: "دنبال یک هدیه می‌گردم.",        notes: "Regular verb. suche / suchst / sucht." },
    { front: "finden",          back: "پیدا کردن",   sentence: "Ich kann es nicht finden.",         translation: "نمی‌توانم آن را پیدا کنم.",     notes: "Strong verb. finde / findest / findet." },
    { front: "brauchen",        back: "نیاز داشتن",  sentence: "Was brauchen Sie?",                 translation: "به چه چیزی نیاز دارید؟",        notes: "Regular verb. brauche / brauchst / braucht." },
    { front: "der Euro",        back: "یورو",        sentence: "Das kostet zehn Euro.",             translation: "این ده یورو هزینه دارد.",        notes: "Masculine noun. Pl: die Euro (no change) or Euros." },
    { front: "Wie viel kostet…?", back: "… چقدر هزینه دارد؟", sentence: "Wie viel kostet das?",  translation: "این چقدر هزینه دارد؟",           notes: "Fixed phrase for asking the price." },
    { front: "das Sonderangebot", back: "حراج / تخفیف ویژه", sentence: "Heute gibt es Sonderangebote.", translation: "امروز حراج هست.",          notes: "Neuter noun. Pl: die Sonderangebote." },
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

puts "  → Unterwegs flashcards seeded"
