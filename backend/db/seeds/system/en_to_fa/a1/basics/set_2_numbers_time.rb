set = Deck.find_by!(name: "Basics", is_system: true, language_pair: "en_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 2 – Numbers & Time") { |s| s.position = 1 }

[
  { front: "one",              back: "یک",                sentence: "I have one brother.",                    translation: "یک برادر دارم.",                        notes: "Cardinal number. Also: یه (informal)." },
  { front: "two",              back: "دو",                sentence: "I have two sisters.",                    translation: "دو خواهر دارم.",                        notes: "Cardinal number." },
  { front: "three",            back: "سه",                sentence: "There are three chairs.",                translation: "سه صندلی وجود داره.",                   notes: "Cardinal number." },
  { front: "ten",              back: "ده",                sentence: "I'm ten years old.",                     translation: "ده سالمه.",                             notes: "Key number for counting system." },
  { front: "one hundred",      back: "صد",                sentence: "One hundred people live here.",          translation: "صد نفر اینجا زندگی می‌کنن.",            notes: "100. Note: هزار = 1000." },
  { front: "What time is it?", back: "ساعت چنده؟",        sentence: "Excuse me, what time is it?",            translation: "ببخشید، ساعت چنده؟",                    notes: "Essential question. Informal." },
  { front: "It's two o'clock", back: "ساعت دوئه",         sentence: "It's two o'clock.",                      translation: "ساعت دوئه.",                            notes: "Pattern: ساعت + number + ه." },
  { front: "in the morning",   back: "صبح",               sentence: "I wake up at seven in the morning.",     translation: "صبح ساعت هفت بیدار می‌شم.",             notes: "صبح = morning. بعدازظهر = afternoon. شب = night." },
  { front: "today",            back: "امروز",             sentence: "What are you doing today?",              translation: "امروز چیکار می‌کنی؟",                   notes: "Key time word." },
  { front: "tomorrow",         back: "فردا",              sentence: "See you tomorrow!",                      translation: "فردا می‌بینمت!",                        notes: "دیروز = yesterday. پس‌فردا = day after tomorrow." },
  { front: "yesterday",        back: "دیروز",             sentence: "I saw her yesterday.",                   translation: "دیروز دیدمش.",                          notes: "Opposite of فردا (tomorrow)." },
  { front: "Monday",           back: "دوشنبه",            sentence: "The meeting is on Monday.",              translation: "جلسه دوشنبه‌ست.",                       notes: "Days follow Arabic numbering: دو = two, شنبه = Saturday-root." },
  { front: "Friday",           back: "جمعه",              sentence: "Friday is a holiday in Iran.",           translation: "جمعه در ایران تعطیله.",                 notes: "The weekend day in Iran. یکشنبه = Sunday." },
  { front: "week",             back: "هفته",              sentence: "I exercise three times a week.",         translation: "هفته‌ای سه بار ورزش می‌کنم.",           notes: "ماه = month. سال = year." },
  { front: "month",            back: "ماه",               sentence: "This month is very busy.",               translation: "این ماه خیلی شلوغه.",                   notes: "Also means 'moon'." },
  { front: "year",             back: "سال",               sentence: "Happy New Year!",                        translation: "سال نو مبارک!",                         notes: "Persian New Year: نوروز." },
  { front: "now",              back: "الان / حالا",        sentence: "I can't talk now.",                      translation: "الان نمی‌تونم حرف بزنم.",               notes: "Interchangeable in most contexts." },
  { front: "later",            back: "بعداً",             sentence: "I'll call you later.",                   translation: "بعداً زنگ می‌زنم.",                     notes: "زود = early/soon. دیر = late." },
  { front: "always",           back: "همیشه",             sentence: "I always drink tea in the morning.",     translation: "صبح‌ها همیشه چای می‌خورم.",             notes: "هرگز / هیچ‌وقت = never." },
  { front: "never",            back: "هرگز / هیچ‌وقت",   sentence: "I never wake up late.",                  translation: "هیچ‌وقت دیر بیدار نمی‌شم.",            notes: "هرگز is more literary; هیچ‌وقت is colloquial." },
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
