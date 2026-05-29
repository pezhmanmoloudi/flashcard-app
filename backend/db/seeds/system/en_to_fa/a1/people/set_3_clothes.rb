set = Deck.find_by!(name: "People", is_system: true, language_pair: "en_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 3 – Clothes") { |s| s.position = 2 }

[
  { front: "clothes",          back: "لباس",              sentence: "I need to buy new clothes.",             translation: "باید لباس جدید بخرم.",                  notes: "لباس = clothing/clothes. Pl: لباس‌ها." },
  { front: "shirt",            back: "پیراهن",            sentence: "He's wearing a white shirt.",            translation: "یه پیراهن سفید پوشیده.",                notes: "Covers shirts and dresses in general use." },
  { front: "t-shirt",          back: "تی‌شرت",            sentence: "I like this t-shirt.",                   translation: "این تی‌شرت رو دوست دارم.",              notes: "Borrowed from English." },
  { front: "trousers / pants",  back: "شلوار",            sentence: "These trousers are too big.",            translation: "این شلوار خیلی بزرگه.",                 notes: "شلوار جین = jeans. شلوار کوتاه = shorts." },
  { front: "dress",            back: "پیراهن / لباس",     sentence: "She's wearing a beautiful dress.",       translation: "یه لباس قشنگ پوشیده.",                 notes: "پیراهن زنانه = women's dress." },
  { front: "jacket / coat",    back: "کت / پالتو",        sentence: "Take your jacket, it's cold.",           translation: "کتت رو ببر، هواسرده.",                  notes: "کت = jacket. پالتو = coat. مانتو = overcoat (women)." },
  { front: "shoes",            back: "کفش",               sentence: "I bought new shoes.",                    translation: "کفش جدید خریدم.",                       notes: "Pl: کفش‌ها. کفش ورزشی = sports shoes." },
  { front: "socks",            back: "جوراب",             sentence: "Where are my socks?",                    translation: "جورابام کجان؟",                         notes: "Pl: جوراب‌ها / جورابا (colloquial)." },
  { front: "hat",              back: "کلاه",              sentence: "Wear your hat, it's sunny.",             translation: "کلاهت رو بذار، آفتابیه.",               notes: "Also means cap/hat in general." },
  { front: "scarf",            back: "شال / روسری",       sentence: "She's wearing a colourful scarf.",       translation: "یه شال رنگارنگ پوشیده.",                notes: "روسری = headscarf. شال = scarf/shawl." },
  { front: "to wear",          back: "پوشیدن",            sentence: "What are you wearing today?",            translation: "امروز چی پوشیدی؟",                      notes: "می‌پوشم = I wear. پوشیدم = I wore." },
  { front: "to try on",        back: "پرو کردن",          sentence: "Can I try this on?",                     translation: "می‌تونم این رو پرو کنم؟",               notes: "Fitting room: اتاق پرو." },
  { front: "size",             back: "سایز",              sentence: "What size do you wear?",                 translation: "چه سایزی می‌پوشی؟",                     notes: "Borrowed from English. اندازه = size (formal)." },
  { front: "colour",           back: "رنگ",               sentence: "What colour do you prefer?",             translation: "چه رنگی رو ترجیح می‌دی؟",               notes: "رنگارنگ = colourful. رنگ = colour/dye." },
  { front: "comfortable",      back: "راحت",              sentence: "These shoes are very comfortable.",      translation: "این کفش‌ها خیلی راحتن.",                notes: "راحت also means easy/relaxed." },
  { front: "tight",            back: "تنگ",               sentence: "This shirt is too tight.",               translation: "این پیراهن خیلی تنگه.",                 notes: "Opposite: گشاد (loose/wide)." },
  { front: "loose / wide",     back: "گشاد",              sentence: "I prefer loose trousers.",               translation: "شلوار گشاد ترجیح می‌دم.",               notes: "Opposite: تنگ (tight)." },
  { front: "clean",            back: "تمیز",              sentence: "Put on clean clothes.",                  translation: "لباس تمیز بپوش.",                       notes: "Opposite: کثیف (dirty)." },
  { front: "dirty",            back: "کثیف",              sentence: "My clothes are dirty.",                  translation: "لباسام کثیفه.",                         notes: "Opposite: تمیز (clean)." },
  { front: "to wash",          back: "شستن",              sentence: "I need to wash my clothes.",             translation: "باید لباسامو بشورم.",                   notes: "می‌شورم = I wash. شستم = I washed. ماشین لباسشویی = washing machine." },
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
