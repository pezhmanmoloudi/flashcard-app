deck = Deck.find_by!(name: "Essen & Trinken", is_system: true)

flashcard_data = {
  "Set 1 – Fruit & Vegetables" => [
    { front: "der Apfel",      back: "سیب",         sentence: "Ein Apfel am Tag hält den Arzt fern.", translation: "روزی یک سیب پزشک را دور می‌کند.", notes: "Masculine noun. Pl: die Äpfel." },
    { front: "die Banane",     back: "موز",          sentence: "Die Banane ist überreif.",          translation: "موز خیلی رسیده است.",            notes: "Feminine noun. Pl: die Bananen." },
    { front: "die Orange",     back: "پرتقال",       sentence: "Ich mag frisch gepresste Orangensaft.", translation: "دوست دارم آب پرتقال تازه.", notes: "Feminine noun. Pl: die Orangen." },
    { front: "die Erdbeere",   back: "توت فرنگی",   sentence: "Im Sommer esse ich gerne Erdbeeren.", translation: "در تابستان دوست دارم توت فرنگی بخورم.", notes: "Feminine noun. Pl: die Erdbeeren." },
    { front: "die Traube",     back: "انگور",        sentence: "Diese Trauben sind süß.",           translation: "این انگورها شیرینند.",            notes: "Feminine noun. Pl: die Trauben." },
    { front: "die Tomate",     back: "گوجه",         sentence: "Tomaten sind eigentlich ein Obst.",  translation: "گوجه‌ها در واقع یک میوه هستند.", notes: "Feminine noun. Pl: die Tomaten." },
    { front: "die Kartoffel",  back: "سیب زمینی",   sentence: "Deutschland liebt Kartoffeln.",      translation: "آلمان سیب‌زمینی را دوست دارد.",  notes: "Feminine noun. Pl: die Kartoffeln." },
    { front: "die Karotte",    back: "هویج",         sentence: "Karotten sind gut für die Augen.",  translation: "هویج برای چشم‌ها خوب است.",      notes: "Feminine noun. Pl: die Karotten. Also: die Möhre." },
    { front: "die Zwiebel",    back: "پیاز",         sentence: "Die Zwiebel bringt mich zum Weinen.", translation: "پیاز باعث گریه‌ام می‌شود.",     notes: "Feminine noun. Pl: die Zwiebeln." },
    { front: "der Knoblauch",  back: "سیر",          sentence: "Knoblauch gibt dem Essen viel Geschmack.", translation: "سیر به غذا خیلی طعم می‌دهد.", notes: "Masculine noun. No plural in common use." },
    { front: "der Salat",      back: "سالاد / کاهو", sentence: "Ich esse jeden Tag Salat.",         translation: "هر روز سالاد می‌خورم.",          notes: "Masculine noun. Pl: die Salate. Can mean salad or lettuce." },
    { front: "die Gurke",      back: "خیار",         sentence: "Eine Gurke ist kühlend im Sommer.",  translation: "خیار در تابستان خنک‌کننده است.", notes: "Feminine noun. Pl: die Gurken." },
    { front: "der Paprika",    back: "فلفل دلمه‌ای", sentence: "Roter Paprika ist süßer als grüner.", translation: "فلفل قرمز از سبز شیرین‌تر است.", notes: "Masculine noun. Pl: die Paprika. Can be any color." },
    { front: "der Brokkoli",   back: "کلم بروکلی",  sentence: "Brokkoli ist sehr gesund.",         translation: "کلم بروکلی خیلی سالم است.",      notes: "Masculine noun. No plural in common use." },
    { front: "der Spinat",     back: "اسفناج",       sentence: "Popeye isst viel Spinat.",          translation: "پوپای خیلی اسفناج می‌خورد.",     notes: "Masculine noun. No plural in common use." },
    { front: "die Zitrone",    back: "لیمو (ترش)",   sentence: "Ich mag Tee mit Zitrone.",          translation: "چای با لیمو دوست دارم.",         notes: "Feminine noun. Pl: die Zitronen." },
    { front: "die Birne",      back: "گلابی",        sentence: "Die Birne ist reif.",               translation: "گلابی رسیده است.",               notes: "Feminine noun. Pl: die Birnen." },
    { front: "der Pfirsich",   back: "هلو",          sentence: "Im Sommer esse ich gerne Pfirsiche.", translation: "در تابستان دوست دارم هلو بخورم.", notes: "Masculine noun. Pl: die Pfirsiche." },
    { front: "frisch",         back: "تازه",         sentence: "Das Gemüse ist frisch vom Markt.",  translation: "سبزیجات تازه از بازار است.",     notes: "Adjective. Opposite: alt/abgestanden (stale)." },
    { front: "reif",           back: "رسیده",        sentence: "Ist die Banane schon reif?",        translation: "موز دیگه رسیده؟",               notes: "Adjective. Opposite: unreif (unripe)." },
  ],

  "Set 2 – In the Restaurant" => [
    { front: "die Speisekarte", back: "منو",         sentence: "Kann ich bitte die Speisekarte haben?", translation: "می‌توانم منو بگیرم؟",         notes: "Feminine noun. Pl: die Speisekarten. Also: die Karte." },
    { front: "bestellen",       back: "سفارش دادن",  sentence: "Ich möchte bestellen.",             translation: "می‌خواهم سفارش بدهم.",          notes: "Regular verb. bestelle / bestellst / bestellt." },
    { front: "die Vorspeise",   back: "پیش‌غذا",     sentence: "Als Vorspeise nehme ich die Suppe.", translation: "برای پیش‌غذا سوپ می‌گیرم.",    notes: "Feminine noun. Pl: die Vorspeisen." },
    { front: "das Hauptgericht", back: "غذای اصلی",  sentence: "Was ist das Hauptgericht heute?",   translation: "امروز غذای اصلی چیست؟",         notes: "Neuter noun. Pl: die Hauptgerichte." },
    { front: "die Nachspeise",  back: "دسر",         sentence: "Als Nachspeise möchte ich Eis.",    translation: "برای دسر بستنی می‌خواهم.",      notes: "Feminine noun. Pl: die Nachspeisen. Also: das Dessert." },
    { front: "der Kellner",     back: "گارسون",      sentence: "Der Kellner kommt gleich.",         translation: "گارسون الان می‌آید.",            notes: "Masculine noun. Pl: die Kellner. Fem: die Kellnerin." },
    { front: "die Rechnung",    back: "صورتحساب",    sentence: "Zahlen bitte! / Die Rechnung, bitte!", translation: "حساب کنید، لطفاً!",          notes: "Feminine noun. Pl: die Rechnungen." },
    { front: "die Portion",     back: "پرس",         sentence: "Die Portion ist sehr groß.",        translation: "پرس خیلی بزرگ است.",            notes: "Feminine noun. Pl: die Portionen." },
    { front: "das Trinkgeld",   back: "انعام",       sentence: "Das Trinkgeld ist in Deutschland üblich.", translation: "انعام در آلمان رسم است.", notes: "Neuter noun. No plural. Literally 'drinking money'." },
    { front: "empfehlen",       back: "پیشنهاد دادن", sentence: "Was können Sie empfehlen?",        translation: "چه چیزی پیشنهاد می‌دهید؟",     notes: "Strong verb. empfehle / empfiehlst / empfiehlt." },
    { front: "die Suppe",       back: "سوپ",         sentence: "Heute gibt es Tomatensuppe.",       translation: "امروز سوپ گوجه داریم.",         notes: "Feminine noun. Pl: die Suppen." },
    { front: "das Schnitzel",   back: "اشنیتسل",     sentence: "Ein Wiener Schnitzel, bitte.",      translation: "یک اشنیتسل وینی، لطفاً.",       notes: "Neuter noun. Pl: die Schnitzel. Classic German/Austrian dish." },
    { front: "der Braten",      back: "برشته / کباب", sentence: "Der Braten ist heute besonders gut.", translation: "برشته امروز خیلی خوبه.",      notes: "Masculine noun. Pl: die Braten. Roasted meat dish." },
    { front: "vegetarisch",     back: "گیاهی",       sentence: "Haben Sie etwas Vegetarisches?",    translation: "آیا چیز گیاهی دارید؟",          notes: "Adjective. 'Vegan' = without any animal products." },
    { front: "die Allergie",    back: "آلرژی",       sentence: "Ich habe eine Nussallergie.",       translation: "به آجیل آلرژی دارم.",           notes: "Feminine noun. Pl: die Allergien." },
    { front: "schmecken",       back: "مزه دادن",    sentence: "Schmeckt das Essen?",               translation: "غذا خوشمزه‌ست؟",               notes: "Regular verb. schmecke / schmeckst / schmeckt." },
    { front: "salzig",          back: "شور",         sentence: "Das Essen ist zu salzig.",          translation: "غذا خیلی شوره.",               notes: "Adjective. Opposite: süß (sweet)." },
    { front: "süß",             back: "شیرین",       sentence: "Der Kuchen ist sehr süß.",          translation: "کیک خیلی شیرین است.",           notes: "Adjective. Also means 'cute' in informal use." },
    { front: "scharf",          back: "تند",         sentence: "Das Curry ist sehr scharf.",        translation: "کاری خیلی تند است.",            notes: "Adjective. Means spicy/hot. Also: sharp (knife)." },
    { front: "sauer",           back: "ترش",         sentence: "Die Zitrone ist sauer.",            translation: "لیمو ترش است.",                 notes: "Adjective. Also means 'annoyed' in informal speech." },
  ],

  "Set 3 – Cooking & Kitchen" => [
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

puts "  → Essen & Trinken flashcards seeded"
