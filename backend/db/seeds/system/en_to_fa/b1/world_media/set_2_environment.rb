set = Deck.find_by!(name: "World & Media", is_system: true, language_pair: "en_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 2 – Environment") { |s| s.position = 1 }

[
  { front: "environment",      back: "محیط زیست",         sentence: "We must protect the environment.",       translation: "باید از محیط زیست محافظت کنیم.",        notes: "محیط = surroundings. زیست = life/living." },
  { front: "climate change",   back: "تغییرات آب و هوایی", sentence: "Climate change is a global crisis.",   translation: "تغییرات آب و هوایی یه بحران جهانیه.",   notes: "آب و هوا = climate. تغییر = change." },
  { front: "global warming",   back: "گرمایش جهانی",       sentence: "Global warming is melting the ice.",    translation: "گرمایش جهانی یخ‌ها رو آب می‌کنه.",     notes: "گرمایش = warming. جهانی = global." },
  { front: "pollution",        back: "آلودگی",             sentence: "Air pollution is serious in Tehran.",   translation: "آلودگی هوا در تهران جدیه.",             notes: "آلوده = polluted. آلودگی هوا = air pollution." },
  { front: "recycling",        back: "بازیافت",            sentence: "Recycling helps reduce waste.",          translation: "بازیافت به کاهش زباله کمک می‌کنه.",    notes: "بازیافت کردن = to recycle. زباله = waste/rubbish." },
  { front: "renewable energy", back: "انرژی تجدیدپذیر",   sentence: "Renewable energy is the future.",        translation: "انرژی تجدیدپذیر آینده‌ست.",            notes: "تجدیدپذیر = renewable. خورشیدی = solar." },
  { front: "solar energy",     back: "انرژی خورشیدی",      sentence: "Iran has great solar energy potential.", translation: "ایران پتانسیل انرژی خورشیدی زیادی داره.", notes: "خورشید = sun. پنل خورشیدی = solar panel." },
  { front: "deforestation",    back: "جنگل‌زدایی",         sentence: "Deforestation destroys ecosystems.",    translation: "جنگل‌زدایی اکوسیستم‌ها رو نابود می‌کنه.", notes: "جنگل = forest. زدایی = removal/clearing." },
  { front: "biodiversity",     back: "تنوع زیستی",         sentence: "Biodiversity is essential to life.",    translation: "تنوع زیستی برای زندگی ضروریه.",         notes: "تنوع = diversity. زیستی = biological." },
  { front: "drought",          back: "خشکسالی",            sentence: "Iran suffers from serious droughts.",   translation: "ایران از خشکسالی جدی رنج می‌بره.",     notes: "خشک = dry. سال = year. خشکسالی = dry year." },
  { front: "flood",            back: "سیل",                sentence: "Floods are becoming more frequent.",    translation: "سیل‌ها بیشتر می‌شن.",                  notes: "سیل = flood. سیلاب = floodwater." },
  { front: "earthquake",       back: "زلزله",              sentence: "Iran is in an earthquake zone.",        translation: "ایران در منطقه زلزله‌خیزه.",            notes: "Iran experiences many earthquakes. زلزله‌خیز = earthquake-prone." },
  { front: "carbon footprint", back: "ردپای کربن",         sentence: "Reduce your carbon footprint.",         translation: "ردپای کربنت رو کاهش بده.",              notes: "کربن = carbon. ردپا = footprint." },
  { front: "sustainability",   back: "پایداری / توسعه پایدار", sentence: "Sustainability must be our goal.", translation: "پایداری باید هدفمون باشه.",              notes: "پایدار = sustainable/stable. توسعه = development." },
  { front: "waste",            back: "زباله / ضایعات",     sentence: "We produce too much waste.",             translation: "خیلی زباله تولید می‌کنیم.",             notes: "زباله = rubbish. ضایعات = industrial waste." },
  { front: "nature",           back: "طبیعت",              sentence: "I love spending time in nature.",        translation: "عاشق وقت گذروندن توی طبیعتم.",         notes: "طبیعی = natural. طبیعت‌گردی = eco-tourism." },
  { front: "ocean",            back: "اقیانوس",            sentence: "The oceans absorb CO2.",                 translation: "اقیانوس‌ها دی‌اکسیدکربن جذب می‌کنن.",  notes: "دریا = sea. اقیانوس = ocean." },
  { front: "species",          back: "گونه",               sentence: "Many species are endangered.",          translation: "خیلی از گونه‌ها در خطر انقراض هستن.",  notes: "انقراض = extinction. در خطر = endangered." },
  { front: "to protect",       back: "محافظت کردن",        sentence: "We must protect our forests.",           translation: "باید از جنگل‌هامون محافظت کنیم.",       notes: "محافظت = protection. حفاظت = conservation." },
  { front: "awareness",        back: "آگاهی",              sentence: "Raise awareness about climate change.",  translation: "آگاهی درباره تغییرات آب و هوایی رو افزایش بده.", notes: "آگاه = aware. آگاهی = awareness/consciousness." },
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
