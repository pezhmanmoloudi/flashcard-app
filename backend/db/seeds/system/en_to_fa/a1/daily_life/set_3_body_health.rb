set = Deck.find_by!(name: "Daily Life", is_system: true, language_pair: "en_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 3 – Body & Health") { |s| s.position = 2 }

[
  { front: "head",             back: "سر",                sentence: "My head hurts.",                         translation: "سرم درد می‌کنه.",                       notes: "سر = head. مو = hair." },
  { front: "eye",              back: "چشم",               sentence: "She has beautiful eyes.",                translation: "چشمای قشنگی داره.",                     notes: "Pl: چشم‌ها. چشمام = my eyes." },
  { front: "ear",              back: "گوش",               sentence: "My ear hurts.",                          translation: "گوشم درد می‌کنه.",                      notes: "گوش دادن = to listen." },
  { front: "nose",             back: "بینی",              sentence: "He has a big nose.",                     translation: "بینی بزرگی داره.",                       notes: "Simple body part noun." },
  { front: "mouth",            back: "دهان / دهن",        sentence: "Open your mouth.",                       translation: "دهنت رو باز کن.",                        notes: "دهن is informal; دهان is formal." },
  { front: "hand",             back: "دست",               sentence: "Wash your hands before eating.",         translation: "قبل از غذا دستاتو بشور.",               notes: "دست also means arm in casual speech." },
  { front: "foot / leg",       back: "پا",                sentence: "My leg is tired.",                       translation: "پام خسته‌ست.",                          notes: "پا covers both foot and leg." },
  { front: "heart",            back: "قلب",               sentence: "A healthy heart is important.",          translation: "قلب سالم مهمه.",                        notes: "دل = heart in emotional/figurative sense." },
  { front: "stomach",          back: "شکم / معده",        sentence: "My stomach is full.",                    translation: "شکمم پره.",                             notes: "شکم = belly (informal). معده = stomach (formal/medical)." },
  { front: "back",             back: "کمر / پشت",         sentence: "My back hurts from sitting.",            translation: "از نشستن کمرم درد می‌کنه.",             notes: "کمر = lower back/waist. پشت = back (upper)." },
  { front: "sick / ill",       back: "مریض",              sentence: "I'm sick today.",                        translation: "امروز مریضم.",                           notes: "بیمار is more formal. ناخوش is also used." },
  { front: "healthy",          back: "سالم",              sentence: "I want to be healthy.",                  translation: "می‌خوام سالم باشم.",                     notes: "سلامتی = health. سلامت = health/well-being (also: cheers!)." },
  { front: "pain / ache",      back: "درد",               sentence: "I have a headache.",                     translation: "سردرد دارم.",                           notes: "درد = pain. سردرد = headache. دندون‌درد = toothache." },
  { front: "doctor",           back: "دکتر",              sentence: "I need to see a doctor.",                translation: "باید پیش دکتر برم.",                     notes: "پزشک is formal. دکتر is colloquial." },
  { front: "hospital",         back: "بیمارستان",         sentence: "Take me to the hospital.",               translation: "منو ببر بیمارستان.",                     notes: "From بیمار (sick person) + ستان (place)." },
  { front: "medicine",         back: "دارو",              sentence: "Take this medicine twice a day.",        translation: "این دارو رو روزی دو بار بخور.",           notes: "داروخانه = pharmacy." },
  { front: "tired",            back: "خسته",              sentence: "I'm very tired today.",                  translation: "امروز خیلی خسته‌ام.",                    notes: "خستگی = tiredness. خستگی در رفتن = to recover." },
  { front: "to sleep",         back: "خوابیدن",           sentence: "I need to sleep.",                       translation: "باید بخوابم.",                           notes: "خواب = sleep (noun). خوابیدم = I slept." },
  { front: "to exercise",      back: "ورزش کردن",         sentence: "I exercise every day.",                  translation: "هر روز ورزش می‌کنم.",                   notes: "ورزش = exercise/sport." },
  { front: "to feel",          back: "احساس کردن",        sentence: "How do you feel?",                       translation: "چه احساسی داری؟",                       notes: "حس کردن is more colloquial. احساس = feeling/emotion." },
].each do |c|
  Flashcard.find_or_create_by!(flashcard_set: set, front_text: c[:front]) do |f|
    f.back_text           = c[:back]
    f.example_sentence    = c[:sentence]
    f.translated_sentence = c[:translation]
    f.grammar_notes       = c[:notes]
    f.source_language     = "english"
    f.target_language     = "persian"
  end
end
