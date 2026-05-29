set = Deck.find_by!(name: "Leisure", is_system: true, language_pair: "en_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 2 – Weather & Seasons") { |s| s.position = 1 }

[
  { front: "weather",          back: "آب و هوا / هوا",    sentence: "What is the weather like today?",        translation: "امروز هوا چطوره؟",                      notes: "هوا = weather/air. آب و هوا = climate/weather." },
  { front: "season",           back: "فصل",               sentence: "What is your favourite season?",         translation: "فصل مورد علاقه‌ات کدومه؟",             notes: "Iran has four very distinct seasons." },
  { front: "spring",           back: "بهار",              sentence: "Spring is beautiful in Iran.",           translation: "بهار در ایران زیباست.",                 notes: "نوروز = Persian New Year, starts on first day of spring." },
  { front: "summer",           back: "تابستان",           sentence: "In summer it is very hot.",              translation: "تابستان خیلی گرمه.",                    notes: "تابستانی = summery. تابستان‌گاه = summer resort." },
  { front: "autumn",           back: "پاییز",             sentence: "The leaves fall in autumn.",             translation: "پاییز برگ‌ها می‌ریزن.",                 notes: "پاییزی = autumnal. Often considered the most poetic season." },
  { front: "winter",           back: "زمستان",            sentence: "In winter it snows in the mountains.",   translation: "زمستان توی کوه‌ها برف می‌باره.",         notes: "زمستانی = wintry. Yalda Night (شب یلدا) is in winter." },
  { front: "sun",              back: "آفتاب / خورشید",    sentence: "The sun is shining.",                    translation: "آفتاب می‌تابه.",                        notes: "آفتاب = sunshine. خورشید = the sun (the star)." },
  { front: "rain",             back: "باران",             sentence: "I love the sound of rain.",              translation: "صدای بارون رو دوست دارم.",              notes: "بارون is colloquial. باران is formal. باریدن = to rain." },
  { front: "snow",             back: "برف",               sentence: "Children love playing in the snow.",     translation: "بچه‌ها عاشق بازی توی برفن.",           notes: "برف باریدن = to snow. آدم برفی = snowman." },
  { front: "wind",             back: "باد",               sentence: "There is a strong wind today.",          translation: "امروز باد شدیدی میاد.",                 notes: "بادی = windy. وزیدن = to blow (wind)." },
  { front: "cloudy",           back: "ابری",              sentence: "It is cloudy and cold today.",           translation: "امروز ابری و سرده.",                    notes: "ابر = cloud. آسمان ابری = cloudy sky." },
  { front: "sunny",            back: "آفتابی",            sentence: "Tomorrow will be sunny.",                translation: "فردا آفتابی می‌شه.",                    notes: "From آفتاب (sun/sunshine)." },
  { front: "rainy",            back: "بارونی",            sentence: "The weather is very rainy.",             translation: "هوا خیلی بارونیه.",                     notes: "بارونی = rainy (colloquial). بارانی = rainy (formal) / raincoat." },
  { front: "warm",             back: "گرم",               sentence: "Spring is warm and pleasant.",           translation: "بهار گرم و دلپذیره.",                   notes: "گرمی = warmth. گرم کردن = to warm up." },
  { front: "cold",             back: "سرد",               sentence: "It is very cold in winter.",             translation: "زمستان خیلی سرده.",                     notes: "سرما = cold (noun). سرما خوردن = to catch a cold." },
  { front: "temperature",      back: "دما",               sentence: "The temperature is 35 degrees today.",   translation: "امروز دما ۳۵ درجه‌ست.",                 notes: "دما = temperature. درجه = degree." },
  { front: "thunderstorm",     back: "طوفان",             sentence: "There was a big thunderstorm last night.", translation: "دیشب طوفان بزرگی بود.",               notes: "رعد = thunder. برق = lightning. طوفان = storm." },
  { front: "fog / mist",       back: "مه",                sentence: "There is fog in the morning.",           translation: "صبح‌ها مه هست.",                        notes: "مه‌آلود = foggy." },
  { front: "cloud",            back: "ابر",               sentence: "Look at those dark clouds.",             translation: "به اون ابرهای تیره نگاه کن.",           notes: "ابر تیره = dark cloud. ابر سفید = white cloud." },
  { front: "degree",           back: "درجه",              sentence: "It's 40 degrees today!",                 translation: "امروز ۴۰ درجه‌ست!",                     notes: "درجه سانتیگراد = Celsius degree." },
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
