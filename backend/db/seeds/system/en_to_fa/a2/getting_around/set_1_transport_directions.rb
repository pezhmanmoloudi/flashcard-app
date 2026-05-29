set = Deck.find_by!(name: "Getting Around", is_system: true, language_pair: "en_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 1 – Transport & Directions") { |s| s.position = 0 }

[
  { front: "bus",              back: "اتوبوس",            sentence: "I take the bus to work.",                translation: "با اتوبوس سر کار می‌رم.",                notes: "Common public transport. اتوبوسرانی = bus service." },
  { front: "metro / subway",   back: "مترو",              sentence: "The metro is faster than the bus.",      translation: "مترو از اتوبوس سریع‌تره.",              notes: "Tehran has an extensive metro system." },
  { front: "taxi",             back: "تاکسی",             sentence: "Can you call a taxi for me?",            translation: "می‌تونی برام تاکسی بگیری؟",             notes: "Shared taxis (تاکسی اشتراکی) are common in Iran." },
  { front: "train",            back: "قطار",              sentence: "I'm taking the train to Isfahan.",        translation: "با قطار به اصفهان می‌رم.",               notes: "ایستگاه قطار = train station." },
  { front: "car",              back: "ماشین",             sentence: "Can I borrow your car?",                 translation: "می‌تونم ماشینت رو قرض بگیرم؟",          notes: "اتومبیل is formal. ماشین is everyday word." },
  { front: "ticket",           back: "بلیت",              sentence: "I need to buy a ticket.",                translation: "باید بلیت بخرم.",                       notes: "بلیت برگشت = return ticket." },
  { front: "station",          back: "ایستگاه",           sentence: "Where is the nearest station?",          translation: "نزدیک‌ترین ایستگاه کجاست؟",            notes: "ایستگاه مترو = metro station. ایستگاه اتوبوس = bus stop." },
  { front: "left",             back: "چپ",                sentence: "Turn left at the traffic lights.",       translation: "سر چراغ بپیچ چپ.",                      notes: "راست = right. مستقیم = straight on." },
  { front: "right",            back: "راست",              sentence: "The bank is on the right.",              translation: "بانک سمت راسته.",                       notes: "چپ = left. Compound: سمت راست = on the right." },
  { front: "straight on",      back: "مستقیم",            sentence: "Go straight on for two minutes.",        translation: "دو دقیقه مستقیم برو.",                  notes: "Adjective/adverb. مستقیم = direct/straight." },
  { front: "near / close",     back: "نزدیک",             sentence: "The shop is near the station.",          translation: "مغازه نزدیک ایستگاهه.",                 notes: "Opposite: دور (far). نزدیک بودن = to be near." },
  { front: "far",              back: "دور",               sentence: "Is it far from here?",                   translation: "از اینجا دوره؟",                        notes: "Opposite: نزدیک (near/close)." },
  { front: "map",              back: "نقشه",              sentence: "Do you have a map of the city?",         translation: "نقشه شهر داری؟",                        notes: "نقشه راه = road map. گوگل مپ = Google Maps." },
  { front: "street / road",    back: "خیابان",            sentence: "What street is this?",                   translation: "این چه خیابانیه؟",                      notes: "کوچه = alley/small street. جاده = highway/road." },
  { front: "corner",           back: "سر کوچه / پیچ",     sentence: "The café is on the corner.",             translation: "کافه سر کوچه‌ست.",                      notes: "سر = top/head. Used for 'at the corner of the street'." },
  { front: "traffic light",    back: "چراغ راهنمایی",     sentence: "Stop at the red traffic light.",         translation: "پشت چراغ قرمز وایسا.",                  notes: "چراغ = light. راهنمایی = guidance." },
  { front: "bridge",           back: "پل",                sentence: "Cross the bridge and then turn right.",  translation: "از پل رد شو بعد بپیچ راست.",            notes: "Pl: پل‌ها." },
  { front: "to walk",          back: "پیاده رفتن",        sentence: "Let's walk to the park.",                translation: "بیا پیاده بریم پارک.",                  notes: "پیاده = on foot. پیاده‌رو = pavement/sidewalk." },
  { front: "to arrive",        back: "رسیدن",             sentence: "What time do we arrive?",                translation: "چه ساعتی می‌رسیم؟",                    notes: "می‌رسم = I arrive. رسیدم = I arrived." },
  { front: "to get lost",      back: "گم شدن",            sentence: "I got lost in the city centre.",         translation: "توی مرکز شهر گم شدم.",                  notes: "گم = lost. راه رو گم کردم = I lost my way." },
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
