set = Deck.find_by!(name: "Leisure", is_system: true, language_pair: "en_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 3 – Travel & Holidays") { |s| s.position = 2 }

[
  { front: "trip / journey",   back: "سفر",               sentence: "I'm going on a trip next week.",         translation: "هفته آینده سفر می‌رم.",                 notes: "سفر کردن = to travel. مسافر = traveller." },
  { front: "holiday / vacation", back: "تعطیلات",         sentence: "We're going on holiday to the north.",   translation: "تعطیلات می‌ریم شمال.",                  notes: "تعطیل = closed/holiday. تعطیلات عید = Nowruz holidays." },
  { front: "airport",          back: "فرودگاه",           sentence: "We arrived at the airport.",             translation: "رسیدیم فرودگاه.",                       notes: "فرود = landing. گاه = place. فرودگاه = landing place." },
  { front: "aeroplane / plane", back: "هواپیما",          sentence: "The plane takes off in an hour.",        translation: "هواپیما یه ساعت دیگه پرواز می‌کنه.",   notes: "هوا = air/sky. پیما = measuring/traversing." },
  { front: "suitcase",         back: "چمدان",             sentence: "I've packed my suitcase.",               translation: "چمدونم رو بستم.",                       notes: "کیف = bag. چمدان = suitcase/luggage." },
  { front: "passport",         back: "پاسپورت / گذرنامه", sentence: "Don't forget your passport.",            translation: "پاسپورتت رو فراموش نکن.",               notes: "گذرنامه is the formal Persian word. پاسپورت is common." },
  { front: "visa",             back: "ویزا",              sentence: "I need a visa for that country.",        translation: "برای اون کشور ویزا لازم دارم.",          notes: "ویزا گرفتن = to get a visa." },
  { front: "to book",          back: "رزرو کردن",         sentence: "I need to book a hotel.",                translation: "باید هتل رزرو کنم.",                    notes: "رزرو = reservation. رزرو کردم = I booked." },
  { front: "accommodation",    back: "اقامتگاه / محل اقامت", sentence: "We found affordable accommodation.", translation: "اقامتگاه ارزانی پیدا کردیم.",           notes: "اقامت = stay/residence. اقامتگاه = accommodation." },
  { front: "beach",            back: "ساحل / دریا",       sentence: "I love spending time on the beach.",     translation: "عاشق وقت گذروندن کنار دریام.",         notes: "ساحل = shore/beach. دریا = sea. شمال = the Caspian coast in Iran." },
  { front: "sea / ocean",      back: "دریا",              sentence: "The sea is calm today.",                 translation: "امروز دریا آرومه.",                      notes: "اقیانوس = ocean. دریای خزر = Caspian Sea." },
  { front: "tourist attraction", back: "جاذبه توریستی",   sentence: "Tehran has many tourist attractions.",   translation: "تهران جاذبه‌های توریستی زیادی داره.",   notes: "جاذبه = attraction. توریستی = tourist." },
  { front: "camera",           back: "دوربین",            sentence: "I took many photos with my camera.",     translation: "با دوربینم خیلی عکس گرفتم.",            notes: "دوربین = camera. عکس گرفتن = to take a photo." },
  { front: "map",              back: "نقشه",              sentence: "I always use a map when I travel.",      translation: "وقتی سفر می‌کنم همیشه از نقشه استفاده می‌کنم.", notes: "نقشه راه = road map. نقشه شهر = city map." },
  { front: "currency",         back: "ارز / پول",         sentence: "I need to exchange currency.",           translation: "باید ارز تهیه کنم.",                    notes: "ارز = foreign currency. صرافی = currency exchange." },
  { front: "to depart",        back: "حرکت کردن",         sentence: "The train departs at noon.",             translation: "قطار ظهر حرکت می‌کنه.",                 notes: "رفتن = to go. پرواز کردن = to fly." },
  { front: "to arrive",        back: "رسیدن",             sentence: "We arrive in Isfahan tomorrow.",         translation: "فردا می‌رسیم اصفهان.",                   notes: "رسیدم = I arrived. می‌رسم = I arrive." },
  { front: "stay",             back: "اقامت",             sentence: "How long is your stay?",                 translation: "چقدر می‌مونی؟",                          notes: "ماندن = to stay. اقامت = stay/residence." },
  { front: "souvenir",         back: "سوغاتی",            sentence: "I bought souvenirs for my family.",      translation: "برای خانواده‌ام سوغاتی خریدم.",         notes: "Bringing سوغاتی from trips is an important Persian custom." },
  { front: "tour guide",       back: "راهنمای تور",       sentence: "Our tour guide was very knowledgeable.", translation: "راهنمای تورمون خیلی با دانش بود.",      notes: "راهنما = guide. تور = tour." },
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
