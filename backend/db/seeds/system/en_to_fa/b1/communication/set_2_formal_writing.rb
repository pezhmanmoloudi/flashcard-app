set = Deck.find_by!(name: "Communication", is_system: true, language_pair: "en_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 2 – Formal Writing") { |s| s.position = 1 }

[
  { front: "Dear Sir/Madam",   back: "جناب آقا / سرکار خانم", sentence: "Dear Sir, I am writing to enquire…", translation: "جناب آقا، این نامه را برای استعلام می‌نویسم…", notes: "جناب = honourable. آقا = Mr. خانم = Ms/Mrs." },
  { front: "I am writing to…", back: "این نامه را برای … می‌نویسم", sentence: "I am writing to apply for the position.", translation: "این نامه را برای درخواست برای پست می‌نویسم.", notes: "Formal letter opening. می‌نویسم = I am writing." },
  { front: "With regards to…", back: "در خصوص…",             sentence: "With regards to your email of Monday…", translation: "در خصوص ایمیل شما در روز دوشنبه…",    notes: "در خصوص / در رابطه با = regarding/concerning." },
  { front: "I would like to",  back: "مایلم / می‌خواهم",      sentence: "I would like to enquire about the course.", translation: "مایلم در مورد دوره استعلام کنم.",    notes: "می‌خواهم is informal; مایلم is more formal." },
  { front: "Please find attached", back: "پیوست ملاحظه بفرمایید", sentence: "Please find attached my CV.", translation: "پیوست رزومه‌ام را ملاحظه بفرمایید.",    notes: "پیوست = attachment. ملاحظه = observation/notice." },
  { front: "I look forward to", back: "منتظر … هستم",         sentence: "I look forward to your reply.",          translation: "منتظر پاسخ شما هستم.",                 notes: "منتظر بودن = to wait/look forward to." },
  { front: "Yours sincerely",  back: "با احترام",             sentence: "Yours sincerely, Ali Ahmadi",            translation: "با احترام، علی احمدی",                 notes: "Standard letter closing. ارادتمند = devoted (more formal)." },
  { front: "to enquire",       back: "استعلام کردن / پرسیدن", sentence: "I am writing to enquire about prices.",  translation: "برای استعلام قیمت‌ها می‌نویسم.",         notes: "استعلام = official enquiry. پرسش = question." },
  { front: "to confirm",       back: "تأیید کردن",            sentence: "Please confirm your attendance.",        translation: "لطفاً حضورتان را تأیید کنید.",          notes: "تأیید = confirmation/approval. تأییدیه = confirmation." },
  { front: "to apologise",     back: "عذرخواهی کردن",         sentence: "I sincerely apologise for the delay.",   translation: "صمیمانه برای تأخیر عذرخواهی می‌کنم.",  notes: "عذرخواهی = apology. پوزش = apology (more literary)." },
  { front: "to request",       back: "درخواست کردن",          sentence: "I request your assistance.",             translation: "تقاضای کمک شما را دارم.",               notes: "تقاضا = request (formal). درخواست = request/application." },
  { front: "formal",           back: "رسمی",                  sentence: "Please use formal language.",            translation: "لطفاً از زبان رسمی استفاده کنید.",     notes: "غیررسمی = informal. رسمی = official/formal." },
  { front: "informal",         back: "غیررسمی / محاوره‌ای",  sentence: "This email is too informal.",             translation: "این ایمیل خیلی غیررسمیه.",              notes: "محاوره = conversation. محاوره‌ای = colloquial." },
  { front: "paragraph",        back: "پاراگراف / بند",        sentence: "Write three paragraphs.",                translation: "سه پاراگراف بنویسید.",                  notes: "بند = paragraph/clause. صفحه = page." },
  { front: "introduction",     back: "مقدمه",                 sentence: "Write a brief introduction.",            translation: "یه مقدمه کوتاه بنویسید.",               notes: "نتیجه‌گیری = conclusion. بدنه = body (of text)." },
  { front: "conclusion",       back: "نتیجه‌گیری",            sentence: "End with a strong conclusion.",          translation: "با یه نتیجه‌گیری قوی تموم کنید.",      notes: "نتیجه = result/conclusion. جمع‌بندی = summary." },
  { front: "signature",        back: "امضا",                  sentence: "Please add your signature.",             translation: "لطفاً امضاتون رو اضافه کنید.",          notes: "امضا کردن = to sign. امضای دیجیتال = digital signature." },
  { front: "subject line",     back: "موضوع",                 sentence: "Write a clear subject line.",            translation: "یه موضوع واضح بنویسید.",                notes: "موضوع = subject/topic." },
  { front: "to proofread",     back: "ویرایش کردن",           sentence: "Always proofread before sending.",       translation: "همیشه قبل از ارسال ویرایش کنید.",       notes: "ویرایش = editing. غلط‌گیری = proofreading." },
  { front: "fluent",           back: "روان / مسلط",           sentence: "She writes fluent Persian.",             translation: "فارسی روان می‌نویسه.",                  notes: "روانی = fluency. مسلط = proficient/fluent." },
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
