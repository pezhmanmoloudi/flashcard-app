set = Deck.find_by!(name: "Work & Society", is_system: true, language_pair: "en_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 1 – Professions") { |s| s.position = 0 }

[
  { front: "profession / job", back: "شغل / حرفه",        sentence: "What is your profession?",               translation: "شغلتون چیه؟",                           notes: "شغل = job. حرفه = profession/trade. کار = work." },
  { front: "engineer",         back: "مهندس",             sentence: "She is a civil engineer.",               translation: "اون مهندس عمرانه.",                     notes: "مهندسی = engineering. مهندس from Arabic." },
  { front: "doctor",           back: "دکتر / پزشک",       sentence: "He became a doctor after six years.",    translation: "بعد از شش سال دکتر شد.",                notes: "پزشک is more formal. دکتر also used for PhDs." },
  { front: "teacher",          back: "معلم / استاد",       sentence: "My mother is a primary school teacher.", translation: "مادرم معلم ابتداییه.",                   notes: "معلم = school teacher. استاد = university professor." },
  { front: "lawyer",           back: "وکیل",              sentence: "I need to speak to a lawyer.",           translation: "باید با یه وکیل صحبت کنم.",             notes: "وکالت = law/advocacy. دادگاه = court." },
  { front: "accountant",       back: "حسابدار",           sentence: "The accountant prepared the report.",    translation: "حسابدار گزارش رو آماده کرد.",           notes: "حساب = account. حسابداری = accounting." },
  { front: "manager / director", back: "مدیر",            sentence: "She was promoted to manager.",           translation: "به مقام مدیر ارتقا پیدا کرد.",          notes: "مدیریت = management. مدیر عامل = CEO." },
  { front: "nurse",            back: "پرستار",            sentence: "The nurse was very kind.",               translation: "پرستار خیلی مهربون بود.",               notes: "پرستاری = nursing. بیمارستان = hospital." },
  { front: "journalist",       back: "روزنامه‌نگار",      sentence: "The journalist asked difficult questions.", translation: "روزنامه‌نگار سوال‌های سختی پرسید.",    notes: "روزنامه = newspaper. نگار = writer." },
  { front: "programmer",       back: "برنامه‌نویس",       sentence: "I work as a programmer.",                translation: "به عنوان برنامه‌نویس کار می‌کنم.",      notes: "برنامه = programme. نویس = writer. نرم‌افزار = software." },
  { front: "architect",        back: "معمار",             sentence: "The architect designed a modern building.", translation: "معمار یه ساختمون مدرن طراحی کرد.",    notes: "معماری = architecture. ساختمان = building." },
  { front: "artist",           back: "هنرمند",            sentence: "She is a talented artist.",              translation: "اون یه هنرمند با استعدادیه.",            notes: "هنر = art. هنرمند = art-person." },
  { front: "chef / cook",      back: "آشپز",              sentence: "The chef cooked an amazing meal.",       translation: "آشپز یه غذای عالی پخت.",                notes: "آشپزخانه = kitchen. آشپزی = cooking." },
  { front: "police officer",   back: "پلیس / افسر",       sentence: "The police officer helped us.",          translation: "پلیس بهمون کمک کرد.",                   notes: "نیروی انتظامی = police force (official name in Iran)." },
  { front: "dentist",          back: "دندانپزشک",         sentence: "I have an appointment with the dentist.", translation: "نوبت دندانپزشک دارم.",                 notes: "دندان = tooth. پزشک = doctor." },
  { front: "pharmacist",       back: "داروساز",           sentence: "Ask the pharmacist for advice.",         translation: "از داروساز مشاوره بگیر.",               notes: "دارو = medicine. داروخانه = pharmacy." },
  { front: "scientist",        back: "دانشمند",           sentence: "The scientist published new research.",  translation: "دانشمند تحقیقات جدیدی منتشر کرد.",     notes: "دانش = knowledge. دانشمند = knowledgeable person." },
  { front: "translator",       back: "مترجم",             sentence: "We need a translator for this meeting.", translation: "برای این جلسه مترجم لازم داریم.",        notes: "ترجمه = translation. مترجم = translator." },
  { front: "salary",           back: "حقوق",              sentence: "My salary increased this year.",         translation: "امسال حقوقم زیاد شد.",                  notes: "حقوق also means rights (plural of حق)." },
  { front: "experience",       back: "تجربه",             sentence: "She has ten years of experience.",       translation: "ده سال تجربه داره.",                    notes: "با تجربه = experienced. بی‌تجربه = inexperienced." },
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
