set = Deck.find_by!(name: "Essen & Trinken", is_system: true, language_pair: "de_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 1 – Fruit & Vegetables") { |s| s.position = 0 }

[
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
