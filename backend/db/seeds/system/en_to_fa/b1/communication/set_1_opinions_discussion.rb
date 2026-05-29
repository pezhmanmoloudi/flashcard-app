set = Deck.find_by!(name: "Communication", is_system: true, language_pair: "en_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 1 – Opinions & Discussion") { |s| s.position = 0 }

[
  { front: "In my opinion…",   back: "به نظر من…",        sentence: "In my opinion, this is the best option.", translation: "به نظر من این بهترین گزینه‌ست.",        notes: "به نظرم = in my opinion (colloquial). از نظر من = from my perspective." },
  { front: "I think…",         back: "فکر می‌کنم…",       sentence: "I think we need more time.",              translation: "فکر می‌کنم به وقت بیشتری نیاز داریم.", notes: "فکر می‌کنم = I think. به نظرم می‌رسه = it seems to me." },
  { front: "I agree",          back: "موافقم",            sentence: "I completely agree with you.",            translation: "کاملاً موافقم.",                        notes: "موافق = agreeing. مخالفم = I disagree." },
  { front: "I disagree",       back: "مخالفم",            sentence: "I'm afraid I disagree.",                 translation: "متأسفانه مخالفم.",                       notes: "مخالف = opposing. موافقم = I agree." },
  { front: "That's a good point", back: "نکته خوبیه",     sentence: "That's a very good point.",               translation: "نکته خیلی خوبیه.",                     notes: "نکته = point/note. خوب = good." },
  { front: "On the other hand", back: "از طرف دیگه",      sentence: "On the other hand, it might not work.",  translation: "از طرف دیگه، ممکنه جواب نده.",          notes: "ولی / اما = but. از سوی دیگر (formal)." },
  { front: "However",          back: "با این حال / ولی",  sentence: "However, there are other options.",       translation: "با این حال، گزینه‌های دیگه‌ای هم هست.", notes: "ولی = but (informal). با این حال = nevertheless." },
  { front: "In addition",      back: "علاوه بر این",      sentence: "In addition, it saves money.",            translation: "علاوه بر این، پول صرفه‌جویی می‌کنه.",   notes: "همچنین = also/moreover. اضافه بر این = in addition." },
  { front: "For example",      back: "مثلاً / برای مثال", sentence: "For example, you could take the bus.",   translation: "مثلاً می‌تونی با اتوبوس بری.",          notes: "به طور مثال = for example (formal)." },
  { front: "In conclusion",    back: "در نتیجه / در پایان", sentence: "In conclusion, this plan is better.",  translation: "در نتیجه، این طرح بهتره.",               notes: "نتیجه‌گیری = conclusion. خلاصه = summary." },
  { front: "It depends",       back: "بستگی داره",        sentence: "It depends on the situation.",            translation: "بستگی داره به موقعیت.",                 notes: "Very useful phrase. بستگی داشتن = to depend on." },
  { front: "As far as I know", back: "تا جایی که می‌دونم", sentence: "As far as I know, she's right.",         translation: "تا جایی که می‌دونم، حق با اونه.",       notes: "Useful for expressing limited knowledge." },
  { front: "I'm not sure",     back: "مطمئن نیستم",       sentence: "I'm not sure about that.",               translation: "راجع به اون مطمئن نیستم.",               notes: "مطمئن = certain/sure. نامطمئن = uncertain." },
  { front: "That's interesting", back: "جالبه",           sentence: "That's a very interesting idea.",         translation: "ایده خیلی جالبیه.",                     notes: "جالب = interesting. جذاب = attractive/interesting." },
  { front: "I see your point",  back: "منظورت رو می‌فهمم", sentence: "I see your point, but I disagree.",      translation: "منظورت رو می‌فهمم، ولی مخالفم.",        notes: "منظور = meaning/intention. می‌فهمم = I understand." },
  { front: "to argue",         back: "استدلال کردن / بحث کردن", sentence: "Don't argue, discuss calmly.",     translation: "بحث نکنید، آروم گفتگو کنید.",           notes: "بحث = discussion/argument. دعوا = quarrel." },
  { front: "to convince",      back: "متقاعد کردن",       sentence: "It's hard to convince him.",             translation: "متقاعد کردنش سخته.",                    notes: "متقاعد = convinced. قانع کردن is also used." },
  { front: "to suggest",       back: "پیشنهاد دادن",      sentence: "Can I suggest an alternative?",          translation: "می‌تونم یه جایگزین پیشنهاد بدم؟",       notes: "پیشنهاد = suggestion. پیشنهاد کردم = I suggested." },
  { front: "evidence",         back: "شواهد / دلیل",       sentence: "Do you have evidence for that?",         translation: "برای اون شواهدی داری؟",                 notes: "دلیل = reason/evidence. مدرک = proof/document." },
  { front: "perspective",      back: "دیدگاه",            sentence: "Try to see it from my perspective.",     translation: "سعی کن از دیدگاه من ببینیش.",           notes: "دید = view/sight. دیدگاه = viewpoint/perspective." },
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
