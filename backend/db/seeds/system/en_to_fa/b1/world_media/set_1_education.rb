set = Deck.find_by!(name: "World & Media", is_system: true, language_pair: "en_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 1 – Education") { |s| s.position = 0 }

[
  { front: "education",        back: "آموزش / تحصیل",     sentence: "Education is the key to success.",       translation: "آموزش کلید موفقیته.",                   notes: "آموزش = education/teaching. تحصیل = studying." },
  { front: "university",       back: "دانشگاه",           sentence: "I study at Tehran University.",          translation: "در دانشگاه تهران تحصیل می‌کنم.",        notes: "دانش = knowledge. گاه = place. Largest uni: دانشگاه تهران." },
  { front: "degree",           back: "مدرک",              sentence: "I have a degree in engineering.",        translation: "مدرک مهندسی دارم.",                     notes: "لیسانس = bachelor's. فوق لیسانس = master's. دکترا = PhD." },
  { front: "professor",        back: "استاد",             sentence: "The professor explains clearly.",        translation: "استاد واضح توضیح می‌ده.",                notes: "استاد also means master/expert. دانشجو = university student." },
  { front: "student",          back: "دانش‌آموز / دانشجو", sentence: "She is an excellent student.",          translation: "اون دانش‌آموز ممتازیه.",                notes: "دانش‌آموز = school student. دانشجو = university student." },
  { front: "exam",             back: "امتحان / آزمون",    sentence: "I have a final exam tomorrow.",          translation: "فردا امتحان نهایی دارم.",                notes: "امتحان دادن = to take an exam. قبول شدن = to pass." },
  { front: "grade / mark",     back: "نمره",              sentence: "I got a good grade in maths.",           translation: "توی ریاضی نمره خوبی گرفتم.",            notes: "نمره ۲۰ = full marks (out of 20 in Iran). قبولی = pass mark." },
  { front: "homework",         back: "تکلیف",             sentence: "Have you done your homework?",           translation: "تکلیفت رو انجام دادی؟",                 notes: "تکلیف also means duty/obligation." },
  { front: "scholarship",      back: "بورسیه",            sentence: "She won a scholarship abroad.",          translation: "بورسیه خارج از کشور گرفت.",             notes: "بورسیه تحصیلی = academic scholarship." },
  { front: "to study",         back: "درس خواندن",        sentence: "I study three hours every day.",         translation: "هر روز سه ساعت درس می‌خونم.",           notes: "درس = lesson. خواندن = to read/study." },
  { front: "to graduate",      back: "فارغ‌التحصیل شدن",  sentence: "She graduated last year.",               translation: "سال پیش فارغ‌التحصیل شد.",              notes: "فارغ = free/finished. فارغ‌التحصیل = graduate." },
  { front: "subject / field",  back: "رشته",              sentence: "What is your field of study?",           translation: "رشته تحصیلیت چیه؟",                    notes: "رشته = field/major. Also means string/thread." },
  { front: "research",         back: "تحقیق / پژوهش",    sentence: "She is doing research on cancer.",       translation: "داره روی سرطان تحقیق می‌کنه.",          notes: "تحقیق کردن = to research. پژوهش is more academic." },
  { front: "library",          back: "کتابخانه",          sentence: "I spent the day at the library.",        translation: "روز رو توی کتابخانه گذروندم.",          notes: "کتاب = book. خانه = house. کتابخانه = book-house." },
  { front: "knowledge",        back: "دانش / معلومات",    sentence: "Knowledge is power.",                    translation: "دانش قدرت است.",                        notes: "دانا = knowledgeable. بی‌سواد = illiterate/ignorant." },
  { front: "skill",            back: "مهارت",             sentence: "You need good communication skills.",    translation: "به مهارت‌های ارتباطی خوب نیاز داری.",   notes: "ماهر = skilled. مهارت‌آموزی = skill training." },
  { front: "literacy",         back: "سواد",              sentence: "Literacy rates have improved.",          translation: "نرخ سواد بهتر شده.",                    notes: "باسواد = literate. بی‌سواد = illiterate." },
  { front: "compulsory",       back: "اجباری",            sentence: "Education is compulsory until age 16.",  translation: "تحصیل تا ۱۶ سالگی اجباریه.",           notes: "اجبار = compulsion. اختیاری = optional." },
  { front: "curriculum",       back: "برنامه درسی",       sentence: "The curriculum was updated.",            translation: "برنامه درسی به‌روز شد.",                notes: "برنامه = programme. درسی = educational/academic." },
  { front: "critical thinking", back: "تفکر انتقادی",    sentence: "Critical thinking is key to learning.",  translation: "تفکر انتقادی کلید یادگیریه.",           notes: "انتقادی = critical. تفکر = thinking." },
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
