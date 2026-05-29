set = Deck.find_by!(name: "Work & Society", is_system: true, language_pair: "en_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 3 – Economy & Society") { |s| s.position = 2 }

[
  { front: "economy",          back: "اقتصاد",            sentence: "The economy is growing slowly.",         translation: "اقتصاد آروم داره رشد می‌کنه.",          notes: "اقتصادی = economic. اقتصاددان = economist." },
  { front: "inflation",        back: "تورم",              sentence: "Inflation is a big problem.",            translation: "تورم یه مشکل بزرگه.",                   notes: "A major topic in Iranian economic discourse." },
  { front: "unemployment",     back: "بیکاری",            sentence: "Youth unemployment is high.",            translation: "بیکاری جوانان زیاده.",                  notes: "بیکار = unemployed. کار = work." },
  { front: "tax",              back: "مالیات",            sentence: "Everyone must pay their taxes.",         translation: "همه باید مالیاتشون رو بدن.",             notes: "مالیاتی = tax-related. مالیات بر ارزش افزوده = VAT." },
  { front: "investment",       back: "سرمایه‌گذاری",      sentence: "Foreign investment has increased.",      translation: "سرمایه‌گذاری خارجی افزایش داشته.",     notes: "سرمایه = capital. سرمایه‌گذار = investor." },
  { front: "trade",            back: "تجارت",             sentence: "Iran has trade relations with many countries.", translation: "ایران با کشورهای زیادی روابط تجاری داره.", notes: "تجارت = trade/commerce. تاجر = merchant." },
  { front: "poverty",          back: "فقر",               sentence: "We need to fight against poverty.",      translation: "باید با فقر مبارزه کنیم.",              notes: "فقیر = poor. مقابل: ثروت (wealth)." },
  { front: "wealth",           back: "ثروت",              sentence: "The country's wealth is not shared equally.", translation: "ثروت کشور به طور مساوی تقسیم نمی‌شه.", notes: "ثروتمند = wealthy. مقابل: فقر (poverty)." },
  { front: "government",       back: "دولت",              sentence: "The government announced new policies.", translation: "دولت سیاست‌های جدیدی اعلام کرد.",      notes: "دولت = government. حکومت = governance/rule." },
  { front: "democracy",        back: "دموکراسی",          sentence: "Democracy requires free elections.",      translation: "دموکراسی به انتخابات آزاد نیاز داره.", notes: "انتخابات = elections. آزاد = free." },
  { front: "election",         back: "انتخابات",          sentence: "The elections are next month.",           translation: "انتخابات ماه آینده‌ست.",                notes: "انتخاب کردن = to choose/elect. رأی = vote." },
  { front: "law",              back: "قانون",             sentence: "Everyone is equal before the law.",      translation: "همه در برابر قانون مساوین.",            notes: "قانونی = legal. غیرقانونی = illegal." },
  { front: "rights",           back: "حقوق",              sentence: "Human rights must be respected.",        translation: "حقوق بشر باید رعایت بشه.",              notes: "حق = right (singular). حقوق also means salary." },
  { front: "society",          back: "جامعه",             sentence: "Education is important for society.",    translation: "آموزش برای جامعه مهمه.",                notes: "اجتماعی = social. از Arabic جماعة." },
  { front: "culture",          back: "فرهنگ",             sentence: "Iran has a rich culture.",               translation: "ایران فرهنگ غنی‌ای داره.",              notes: "فرهنگی = cultural. فرهنگ‌پذیری = acculturation." },
  { front: "population",       back: "جمعیت",             sentence: "Iran's population is around 85 million.", translation: "جمعیت ایران حدود ۸۵ میلیونه.",         notes: "جمع = plural/collective. جمعیت = population." },
  { front: "immigration",      back: "مهاجرت",            sentence: "Immigration is a global issue.",         translation: "مهاجرت یه مسئله جهانیه.",               notes: "مهاجر = immigrant/migrant. مهاجرت کردن = to emigrate." },
  { front: "equality",         back: "برابری / مساوات",   sentence: "Equality is a fundamental value.",       translation: "برابری یه ارزش اساسیه.",                notes: "برابر = equal. برابری = equality." },
  { front: "corruption",       back: "فساد",              sentence: "Fighting corruption is essential.",      translation: "مبارزه با فساد ضروریه.",                notes: "فاسد = corrupt. ضد فساد = anti-corruption." },
  { front: "reform",           back: "اصلاحات",           sentence: "The government promised reforms.",       translation: "دولت اصلاحات وعده داد.",                notes: "اصلاح = correction. اصلاح‌طلب = reformist." },
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
