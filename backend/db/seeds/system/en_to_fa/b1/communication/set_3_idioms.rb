set = Deck.find_by!(name: "Communication", is_system: true, language_pair: "en_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 3 – Idioms & Expressions") { |s| s.position = 2 }

[
  { front: "Break a leg!",     back: "موفق باشی!",         sentence: "Break a leg in your exam!",              translation: "موفق باشی توی امتحانت!",                notes: "English idiom for good luck. Persian equivalent: موفق باشی." },
  { front: "Hit the nail on the head", back: "دقیقاً به هدف زدی", sentence: "You hit the nail on the head.", translation: "دقیقاً به هدف زدی.",                    notes: "Meaning: you said exactly the right thing." },
  { front: "Under the weather", back: "حالم خوب نیست",     sentence: "I'm feeling a bit under the weather.",  translation: "یکم حالم خوب نیست.",                   notes: "Meaning: feeling slightly ill." },
  { front: "Once in a blue moon", back: "خیلی بندرت",      sentence: "We meet once in a blue moon.",           translation: "خیلی بندرت همدیگه رو می‌بینیم.",        notes: "Persian equiv: هر از گاهی / سال به سال." },
  { front: "Spill the beans",  back: "راز رو لو دادن",     sentence: "Don't spill the beans!",                 translation: "راز رو لو نده!",                        notes: "Meaning: to reveal a secret." },
  { front: "Cost an arm and a leg", back: "خیلی گرونه",   sentence: "That car costs an arm and a leg.",       translation: "اون ماشین خیلی گرونه.",                 notes: "Persian equiv: پول مفتی نیست." },
  { front: "Let the cat out of the bag", back: "راز رو فاش کردن", sentence: "He let the cat out of the bag.", translation: "راز رو فاش کرد.",                       notes: "Meaning: to accidentally reveal a secret." },
  { front: "Beat around the bush", back: "در و دیوار کوبیدن", sentence: "Stop beating around the bush.",       translation: "بس کن در و دیوار کوبیدن.",             notes: "Meaning: to avoid saying something directly." },
  { front: "Hit the books",    back: "سر کتاب نشستن",      sentence: "I need to hit the books tonight.",       translation: "امشب باید سر کتاب بشینم.",              notes: "Meaning: to study hard." },
  { front: "Bite the bullet",  back: "سختی رو تحمل کردن", sentence: "Just bite the bullet and do it.",        translation: "فقط سختیش رو تحمل کن و انجامش بده.",   notes: "Meaning: to endure a painful situation." },
  { front: "Actions speak louder than words", back: "با کار ثابت کن نه با حرف", sentence: "Actions speak louder than words.", translation: "با کار ثابت کن نه با حرف.", notes: "Persian equiv: حرف زدن آسانه، عمل کن." },
  { front: "Every cloud has a silver lining", back: "پشت هر ابری آفتابیه", sentence: "Every cloud has a silver lining.", translation: "پشت هر ابری آفتابیه.",          notes: "Direct translation works in Persian!" },
  { front: "Kill two birds with one stone", back: "با یه تیر دو نشون زدن", sentence: "We can kill two birds with one stone.", translation: "می‌تونیم با یه تیر دو نشون بزنیم.", notes: "Same idiom exists in Persian!" },
  { front: "The ball is in your court", back: "توپ توی زمین توئه", sentence: "The ball is in your court now.", translation: "الان توپ توی زمین توئه.",             notes: "Meaning: it's your turn to take action." },
  { front: "Bite off more than you can chew", back: "بیشتر از تواناییت کار گرفتی", sentence: "Don't bite off more than you can chew.", translation: "بیشتر از تواناییت کار نگیر.", notes: "Meaning: to take on too much." },
  { front: "Get cold feet",    back: "جا زدن / ترسیدن",   sentence: "He got cold feet before the wedding.",   translation: "قبل از عروسی جا زد.",                   notes: "Meaning: to suddenly feel nervous about something." },
  { front: "It's not rocket science", back: "کار سختی نیست", sentence: "It's not rocket science!",            translation: "کار سختی نیست!",                        notes: "Meaning: it's not complicated." },
  { front: "Piece of cake",    back: "مثل آب خوردن",       sentence: "The exam was a piece of cake.",          translation: "امتحان مثل آب خوردن بود.",              notes: "Persian equiv: مثل آب خوردن = like drinking water." },
  { front: "Burn bridges",     back: "پل‌ها رو خراب کردن", sentence: "Don't burn your bridges.",               translation: "پل‌هاتو خراب نکن.",                    notes: "Meaning: to destroy relationships permanently." },
  { front: "Go the extra mile", back: "بیشتر از حد انتظار تلاش کردن", sentence: "She always goes the extra mile.", translation: "اون همیشه بیشتر از حد انتظار تلاش می‌کنه.", notes: "Meaning: to make more effort than expected." },
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
