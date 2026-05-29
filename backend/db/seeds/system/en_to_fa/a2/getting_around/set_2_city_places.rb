set = Deck.find_by!(name: "Getting Around", is_system: true, language_pair: "en_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 2 – City & Places") { |s| s.position = 1 }

[
  { front: "city / town",      back: "شهر",               sentence: "I live in a big city.",                  translation: "توی یه شهر بزرگ زندگی می‌کنم.",         notes: "شهر = city/town. روستا = village." },
  { front: "city centre",      back: "مرکز شهر",          sentence: "The hotel is in the city centre.",       translation: "هتل توی مرکز شهره.",                    notes: "Also: وسط شهر (colloquial)." },
  { front: "park",             back: "پارک",              sentence: "We go to the park on Fridays.",          translation: "جمعه‌ها می‌ریم پارک.",                   notes: "Parks are popular gathering places in Iran." },
  { front: "museum",           back: "موزه",              sentence: "The museum is closed on Mondays.",       translation: "موزه دوشنبه‌ها بسته‌ست.",               notes: "Iran has many world-class museums." },
  { front: "mosque",           back: "مسجد",              sentence: "There is a beautiful mosque nearby.",    translation: "یه مسجد زیبا نزدیک اینجاست.",          notes: "Central to Iranian culture and daily life." },
  { front: "bazaar / market",  back: "بازار",             sentence: "Let's go to the bazaar.",                translation: "بیا بریم بازار.",                        notes: "Grand Bazaar: بازار بزرگ. Word is Persian in origin." },
  { front: "restaurant",       back: "رستوران",           sentence: "Which restaurant do you recommend?",     translation: "کدوم رستوران رو پیشنهاد می‌دی؟",        notes: "From French 'restaurant'." },
  { front: "café",             back: "کافه",              sentence: "Let's meet at the café.",                translation: "بیا توی کافه قرار بذاریم.",             notes: "Cafés are very popular in modern Iranian cities." },
  { front: "hospital",         back: "بیمارستان",         sentence: "Where is the nearest hospital?",         translation: "نزدیک‌ترین بیمارستان کجاست؟",          notes: "بیمار = sick person. ستان = place suffix." },
  { front: "pharmacy",         back: "داروخانه",          sentence: "Is there a pharmacy near here?",         translation: "اینجا نزدیک داروخانه هست؟",             notes: "دارو = medicine. خانه = house/place." },
  { front: "bank",             back: "بانک",              sentence: "I need to go to the bank.",              translation: "باید برم بانک.",                        notes: "صرافی = currency exchange office." },
  { front: "post office",      back: "اداره پست",         sentence: "I need to go to the post office.",       translation: "باید برم اداره پست.",                   notes: "پست = post/mail." },
  { front: "school",           back: "مدرسه",             sentence: "My children go to school here.",         translation: "بچه‌هام اینجا مدرسه می‌رن.",            notes: "دانشگاه = university." },
  { front: "hotel",            back: "هتل",               sentence: "I've booked a room at the hotel.",       translation: "اتاق هتل رزرو کردم.",                   notes: "مهمانپذیر = budget hotel/guesthouse." },
  { front: "supermarket",      back: "سوپرمارکت",         sentence: "I'm going to the supermarket.",          translation: "دارم می‌رم سوپرمارکت.",                 notes: "Also: فروشگاه (shop/store)." },
  { front: "cinema",           back: "سینما",             sentence: "The cinema is on this street.",          translation: "سینما توی همین خیابونه.",               notes: "تئاتر = theatre." },
  { front: "open",             back: "باز",               sentence: "Is the shop open?",                      translation: "مغازه بازه؟",                           notes: "Opposite: بسته (closed)." },
  { front: "closed",           back: "بسته",              sentence: "The museum is closed today.",            translation: "موزه امروز بسته‌ست.",                   notes: "Opposite: باز (open)." },
  { front: "opposite",         back: "روبه‌رو",           sentence: "The pharmacy is opposite the bank.",     translation: "داروخانه روبه‌روی بانکه.",              notes: "Also: مقابل. روبه‌رو = facing." },
  { front: "next to",          back: "کنار / بغل",        sentence: "The café is next to the hotel.",         translation: "کافه کنار هتله.",                       notes: "بغل = beside (colloquial). کنار = beside/next to." },
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
