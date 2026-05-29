set = Deck.find_by!(name: "Work & Society", is_system: true, language_pair: "en_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 2 – Workplace") { |s| s.position = 1 }

[
  { front: "office",           back: "دفتر / اداره",      sentence: "I work in an office in the city centre.", translation: "توی یه دفتر در مرکز شهر کار می‌کنم.",  notes: "دفتر = office (room). اداره = office/department (organisation)." },
  { front: "meeting",          back: "جلسه",              sentence: "I have a meeting at ten.",                translation: "ساعت ده جلسه دارم.",                    notes: "جلسه برگزار کردن = to hold a meeting." },
  { front: "deadline",         back: "مهلت / ددلاین",     sentence: "The deadline is this Friday.",            translation: "مهلت جمعه این هفته‌ست.",                notes: "مهلت = time limit. ددلاین is the borrowed term." },
  { front: "colleague",        back: "همکار",             sentence: "My colleagues are very friendly.",        translation: "همکارام خیلی صمیمین.",                  notes: "هم = together. کار = work. همکاری = cooperation." },
  { front: "boss / supervisor", back: "رئیس / مدیر",      sentence: "My boss gave me more responsibility.",    translation: "رئیسم مسئولیت بیشتری بهم داد.",        notes: "رئیس = head/boss. مدیر = manager." },
  { front: "employee",         back: "کارمند",            sentence: "The company has 200 employees.",          translation: "شرکت ۲۰۰ کارمند داره.",                 notes: "کار = work. کارمند = worker/employee." },
  { front: "contract",         back: "قرارداد",           sentence: "I signed a new contract.",               translation: "قرارداد جدید امضا کردم.",               notes: "امضا = signature. امضا کردن = to sign." },
  { front: "promotion",        back: "ارتقا / ترفیع",     sentence: "She received a promotion.",              translation: "ترفیع گرفت.",                           notes: "ارتقا = advancement. ترفیع = promotion." },
  { front: "overtime",         back: "اضافه‌کاری",        sentence: "I worked overtime this week.",           translation: "این هفته اضافه‌کاری کردم.",             notes: "اضافه = extra. کاری = related to work." },
  { front: "application",      back: "درخواست / اپلیکیشن", sentence: "I sent my job application.",            translation: "درخواست شغلم رو فرستادم.",             notes: "درخواست = request/application. رزومه = CV/resume." },
  { front: "CV / résumé",      back: "رزومه",             sentence: "Please send your CV.",                   translation: "لطفاً رزومه‌ات رو بفرست.",              notes: "From French résumé. سابقه کاری = work history." },
  { front: "interview",        back: "مصاحبه",            sentence: "I have a job interview tomorrow.",       translation: "فردا مصاحبه شغلی دارم.",                notes: "مصاحبه کاری = job interview. مصاحبه خبری = press interview." },
  { front: "to apply",         back: "درخواست دادن",      sentence: "I applied for three jobs.",              translation: "برای سه شغل درخواست دادم.",             notes: "درخواست = request/application." },
  { front: "to resign",        back: "استعفا دادن",       sentence: "He resigned from his job.",              translation: "از شغلش استعفا داد.",                   notes: "استعفانامه = resignation letter." },
  { front: "to be fired",      back: "اخراج شدن",         sentence: "He was fired from the company.",         translation: "از شرکت اخراج شد.",                     notes: "اخراج کردن = to fire. اخراج شدن = to be fired." },
  { front: "remote work",      back: "کار از راه دور / دورکاری", sentence: "I work remotely from home.",     translation: "از خونه دورکاری می‌کنم.",                notes: "دورکاری = remote work. دور = far." },
  { front: "project",          back: "پروژه",             sentence: "We're working on a big project.",        translation: "روی یه پروژه بزرگ کار می‌کنیم.",        notes: "From French projet. طرح = plan/project (also used)." },
  { front: "responsibility",   back: "مسئولیت",           sentence: "I have a lot of responsibility.",        translation: "مسئولیت زیادی دارم.",                   notes: "مسئول = responsible. مسئولیت‌پذیر = responsible (adj)." },
  { front: "achievement",      back: "دستاورد",           sentence: "This is a great achievement.",           translation: "این یه دستاورد بزرگه.",                 notes: "دست = hand/achievement. آورد = brought." },
  { front: "teamwork",         back: "کار تیمی",          sentence: "Teamwork is very important here.",       translation: "کار تیمی اینجا خیلی مهمه.",             notes: "تیم = team. کار تیمی = teamwork." },
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
