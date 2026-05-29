set = Deck.find_by!(name: "World & Media", is_system: true, language_pair: "en_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 3 – Media & News") { |s| s.position = 2 }

[
  { front: "news",             back: "خبر",               sentence: "Have you heard the news?",               translation: "خبر رو شنیدی؟",                         notes: "اخبار = news (plural). رسانه = media." },
  { front: "newspaper",        back: "روزنامه",           sentence: "I read the newspaper every morning.",    translation: "هر صبح روزنامه می‌خونم.",               notes: "روز = day. نامه = letter. روزنامه = daily paper." },
  { front: "magazine",         back: "مجله",              sentence: "She reads many magazines.",              translation: "مجله‌های زیادی می‌خونه.",               notes: "مجله تخصصی = specialist magazine." },
  { front: "social media",     back: "شبکه‌های اجتماعی",  sentence: "I spend too much time on social media.",  translation: "خیلی وقت توی شبکه‌های اجتماعی می‌گذرونم.", notes: "شبکه = network. اجتماعی = social." },
  { front: "internet",         back: "اینترنت",           sentence: "The internet has changed everything.",    translation: "اینترنت همه چیز رو تغییر داده.",        notes: "وب = web. آنلاین = online." },
  { front: "broadcast",        back: "پخش",               sentence: "The game is broadcast live.",            translation: "بازی زنده پخش می‌شه.",                  notes: "پخش زنده = live broadcast. پخش کردن = to broadcast." },
  { front: "journalist",       back: "روزنامه‌نگار / خبرنگار", sentence: "Journalists have a difficult job.", translation: "روزنامه‌نگاران کار سختی دارن.",         notes: "خبرنگار = reporter. روزنامه‌نگار = journalist." },
  { front: "headline",         back: "تیتر",              sentence: "What are the main headlines today?",     translation: "تیترهای اصلی امروز چیه؟",               notes: "تیتر = headline/title. خبر اصلی = main news." },
  { front: "fake news",        back: "اخبار کذب / فیک‌نیوز", sentence: "Be careful of fake news.",           translation: "مراقب اخبار کذب باش.",                  notes: "کذب = false/lie. شایعه = rumour." },
  { front: "freedom of speech", back: "آزادی بیان",       sentence: "Freedom of speech is a basic right.",   translation: "آزادی بیان یه حق اساسیه.",             notes: "بیان = expression. آزادی = freedom." },
  { front: "censorship",       back: "سانسور",            sentence: "Censorship limits information.",         translation: "سانسور اطلاعات رو محدود می‌کنه.",       notes: "سانسور کردن = to censor. محدودیت = restriction." },
  { front: "documentary",      back: "مستند",             sentence: "I watched an interesting documentary.",  translation: "یه مستند جالب دیدم.",                   notes: "فیلم مستند = documentary film." },
  { front: "interview",        back: "مصاحبه",            sentence: "The politician gave an interview.",      translation: "سیاستمدار مصاحبه داد.",                 notes: "مصاحبه کردن = to interview. گفتگو = conversation/interview." },
  { front: "opinion",          back: "نظر / عقیده",       sentence: "What is your opinion on this?",          translation: "نظرت راجع به این چیه؟",                 notes: "نظر = opinion/view. به نظرم = in my opinion." },
  { front: "debate",           back: "بحث / مناظره",      sentence: "There was a heated debate.",             translation: "یه بحث داغ برقرار بود.",                notes: "مناظره = formal debate. بحث = discussion/debate." },
  { front: "report",           back: "گزارش",             sentence: "The report was published today.",        translation: "گزارش امروز منتشر شد.",                  notes: "گزارش دادن = to report. خبرگزاری = news agency." },
  { front: "propaganda",       back: "تبلیغات",           sentence: "Propaganda can mislead people.",         translation: "تبلیغات می‌تونه مردم رو گمراه کنه.",    notes: "تبلیغات also means advertising." },
  { front: "to publish",       back: "منتشر کردن",        sentence: "When will the article be published?",    translation: "مقاله کی منتشر می‌شه؟",                 notes: "نشر = publication. ناشر = publisher." },
  { front: "trending",         back: "ترند / پربازدید",   sentence: "This video is trending.",                translation: "این ویدیو داره ترند می‌شه.",             notes: "پربازدید = high-views. ترند is from English trend." },
  { front: "reliable",         back: "قابل اعتماد",       sentence: "Use reliable sources for information.",  translation: "از منابع قابل اعتماد استفاده کن.",      notes: "اعتماد = trust. قابل اعتماد = trustworthy/reliable." },
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
