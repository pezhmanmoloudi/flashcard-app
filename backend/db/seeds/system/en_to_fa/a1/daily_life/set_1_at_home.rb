set = Deck.find_by!(name: "Daily Life", is_system: true, language_pair: "en_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 1 – At Home") { |s| s.position = 0 }

[
  { front: "house / home",     back: "خونه / خانه",       sentence: "I live in a big house.",                 translation: "تو یه خونه بزرگ زندگی می‌کنم.",         notes: "خونه is colloquial; خانه is formal." },
  { front: "room",             back: "اتاق",              sentence: "My room is on the second floor.",        translation: "اتاقم طبقه دومه.",                     notes: "اتاق خواب = bedroom. اتاق نشیمن = living room." },
  { front: "kitchen",          back: "آشپزخونه",          sentence: "I'm in the kitchen.",                    translation: "توی آشپزخونه‌ام.",                      notes: "آشپزخانه (formal). آشپز = cook/chef." },
  { front: "bathroom",         back: "حمام / دستشویی",    sentence: "The bathroom is clean.",                 translation: "حمام تمیزه.",                           notes: "حمام = bathroom/shower. دستشویی = toilet." },
  { front: "bedroom",          back: "اتاق خواب",         sentence: "My bedroom is very comfortable.",        translation: "اتاق خوابم خیلی راحته.",                notes: "خواب = sleep." },
  { front: "living room",      back: "اتاق نشیمن / پذیرایی", sentence: "We watch TV in the living room.",   translation: "توی اتاق نشیمن تلویزیون می‌بینیم.",    notes: "پذیرایی is used for more formal sitting room." },
  { front: "door",             back: "در",                sentence: "Please close the door.",                 translation: "لطفاً در رو ببند.",                     notes: "Also means 'in/inside' – same word, different meaning from context." },
  { front: "window",           back: "پنجره",             sentence: "Open the window, it's hot.",             translation: "پنجره رو باز کن، گرمه.",                notes: "Feminine in Persian grammar sense." },
  { front: "table",            back: "میز",               sentence: "The book is on the table.",              translation: "کتاب روی میزه.",                        notes: "میز کار = desk. میز غذاخوری = dining table." },
  { front: "chair",            back: "صندلی",             sentence: "Please sit on the chair.",               translation: "لطفاً روی صندلی بشین.",                 notes: "Pl: صندلی‌ها." },
  { front: "bed",              back: "تخت",               sentence: "I sleep in a big bed.",                  translation: "توی یه تخت بزرگ می‌خوابم.",             notes: "تخت خواب = bed. تخت = flat surface/bed." },
  { front: "sofa / couch",     back: "مبل",               sentence: "The cat is sleeping on the sofa.",       translation: "گربه روی مبل داره می‌خوابه.",           notes: "مبل = sofa/armchair in Persian." },
  { front: "television / TV",  back: "تلویزیون",          sentence: "What's on TV tonight?",                  translation: "امشب توی تلویزیون چی هست؟",             notes: "Also: TV (تی‌وی) in colloquial speech." },
  { front: "to clean",         back: "تمیز کردن",         sentence: "I clean my room every week.",            translation: "هر هفته اتاقم رو تمیز می‌کنم.",         notes: "تمیز = clean (adj). تمیز کردن = to clean (verb)." },
  { front: "to cook",          back: "آشپزی کردن",        sentence: "My mum loves to cook.",                  translation: "مامانم عاشق آشپزی کردنه.",              notes: "پختن = to cook/boil (specific)." },
  { front: "to sleep",         back: "خوابیدن",           sentence: "I sleep eight hours a night.",           translation: "شبانه هشت ساعت می‌خوابم.",              notes: "می‌خوابم = I sleep. خوابیدم = I slept." },
  { front: "to wake up",       back: "بیدار شدن",         sentence: "I wake up at seven every day.",          translation: "هر روز ساعت هفت بیدار می‌شم.",          notes: "بیدار = awake. بیدار شدن = to wake up." },
  { front: "to eat",           back: "خوردن",             sentence: "We eat dinner together.",                translation: "با هم شام می‌خوریم.",                   notes: "می‌خورم = I eat. خوردم = I ate." },
  { front: "to drink",         back: "نوشیدن / خوردن",    sentence: "I drink tea every morning.",             translation: "هر صبح چای می‌خورم.",                   notes: "In Persian, خوردن is used for both eating and drinking." },
  { front: "to live",          back: "زندگی کردن",        sentence: "I live in Tehran.",                      translation: "در تهران زندگی می‌کنم.",                 notes: "Also: ساکن بودن = to reside." },
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
