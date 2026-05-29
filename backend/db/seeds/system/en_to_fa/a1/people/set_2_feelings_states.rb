set = Deck.find_by!(name: "People", is_system: true, language_pair: "en_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 2 – Feelings & States") { |s| s.position = 1 }

[
  { front: "happy",            back: "خوشحال / شاد",      sentence: "I'm very happy today.",                  translation: "امروز خیلی خوشحالم.",                   notes: "شاد = cheerful/joyful. خوشحال = pleased/happy." },
  { front: "sad",              back: "ناراحت / غمگین",    sentence: "Why are you sad?",                       translation: "چرا ناراحتی؟",                          notes: "ناراحت = unhappy/upset. غمگین = sad/sorrowful." },
  { front: "angry",            back: "عصبانی",            sentence: "Don't be angry.",                        translation: "عصبانی نباش.",                          notes: "Also: ناراحت (upset). عصبانی شدن = to get angry." },
  { front: "tired",            back: "خسته",              sentence: "I'm so tired after work.",               translation: "بعد از کار خیلی خسته‌ام.",              notes: "خستگی = tiredness." },
  { front: "excited",          back: "هیجان‌زده",         sentence: "I'm very excited about the trip.",       translation: "خیلی هیجان‌زده‌ام برای سفر.",           notes: "هیجان = excitement." },
  { front: "scared / afraid",  back: "ترسیده / می‌ترسم",  sentence: "I'm scared of spiders.",                 translation: "از عنکبوت می‌ترسم.",                    notes: "ترس = fear. ترسیدن = to be afraid." },
  { front: "surprised",        back: "تعجب‌زده / متعجب",  sentence: "I was very surprised.",                  translation: "خیلی تعجب‌زده شدم.",                    notes: "تعجب کردن = to be surprised." },
  { front: "bored",            back: "حوصله‌ام سر رفته",  sentence: "I'm so bored at home.",                  translation: "خونه خیلی حوصله‌ام سر رفته.",           notes: "Lit. 'my patience has run out'. حوصله = patience." },
  { front: "nervous",          back: "نگران / دلشوره دارم", sentence: "I'm nervous about the exam.",          translation: "نگران امتحانم.",                         notes: "نگرانی = worry. دلشوره = anxiety." },
  { front: "calm",             back: "آروم",              sentence: "Stay calm, everything is fine.",          translation: "آروم باش، همه چیز خوبه.",               notes: "آرام is formal. آروم = calm/quiet (colloquial)." },
  { front: "love",             back: "عشق / دوست داشتن",  sentence: "I love my family.",                      translation: "خانواده‌ام رو دوست دارم.",              notes: "عشق = love (noun). دوست داشتن = to love/like (verb)." },
  { front: "to like",          back: "دوست داشتن",        sentence: "I like tea.",                            translation: "چای دوست دارم.",                        notes: "Same verb as 'to love', context determines strength." },
  { front: "to want",          back: "خواستن",            sentence: "I want a cup of coffee.",                translation: "یه فنجان قهوه می‌خوام.",                notes: "می‌خوام = I want. می‌خوای = you want." },
  { front: "to know",          back: "دانستن / بلد بودن", sentence: "I don't know the answer.",               translation: "جواب رو نمی‌دونم.",                     notes: "دانستن = to know (facts). بلد بودن = to know how to do." },
  { front: "to think",         back: "فکر کردن",          sentence: "What do you think?",                     translation: "نظرت چیه؟ / چی فکر می‌کنی؟",           notes: "فکر = thought/mind. فکر می‌کنم = I think." },
  { front: "to understand",    back: "فهمیدن",            sentence: "Do you understand?",                     translation: "می‌فهمی؟",                              notes: "می‌فهمم = I understand. نمی‌فهمم = I don't understand." },
  { front: "to feel",          back: "احساس کردن",        sentence: "How do you feel?",                       translation: "چه احساسی داری؟",                       notes: "احساس = feeling. حس کردن is more colloquial." },
  { front: "to hope",          back: "امیدوار بودن",      sentence: "I hope everything goes well.",           translation: "امیدوارم همه چیز خوب بشه.",            notes: "امید = hope. إن‌شاءالله = God willing (very common)." },
  { front: "to need",          back: "نیاز داشتن",        sentence: "I need help.",                           translation: "کمک نیاز دارم.",                        notes: "نیاز = need. لازم داشتن = to need (colloquial)." },
  { front: "to miss",          back: "دلتنگ بودن",        sentence: "I miss you so much.",                    translation: "خیلی دلتنگتم.",                         notes: "دلتنگی = missing/longing. Lit. 'heart is narrow'." },
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
