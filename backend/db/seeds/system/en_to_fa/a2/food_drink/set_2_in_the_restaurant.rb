set = Deck.find_by!(name: "Food & Drink", is_system: true, language_pair: "en_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 2 – In the Restaurant") { |s| s.position = 1 }

[
  { front: "menu",             back: "منو",               sentence: "Can I see the menu, please?",            translation: "می‌تونم منو رو ببینم لطفاً؟",           notes: "From French menu. کارت غذا also used." },
  { front: "to order",         back: "سفارش دادن",        sentence: "Are you ready to order?",                translation: "آماده‌ای سفارش بدی؟",                   notes: "سفارش = order. سفارش دادم = I ordered." },
  { front: "starter",          back: "پیش‌غذا",           sentence: "I'll have the soup as a starter.",       translation: "پیش‌غذا سوپ می‌خورم.",                 notes: "پیش = before. پیش‌غذا = before-food." },
  { front: "main course",      back: "غذای اصلی",         sentence: "What is the main course today?",         translation: "غذای اصلی امروز چیه؟",                  notes: "اصلی = main/principal." },
  { front: "dessert",          back: "دسر",               sentence: "I want ice cream for dessert.",          translation: "برای دسر بستنی می‌خوام.",               notes: "Persian sweets: شیرینی." },
  { front: "waiter / waitress", back: "گارسون / پیشخدمت", sentence: "Excuse me, waiter!",                     translation: "ببخشید، گارسون!",                       notes: "گارسون is from French. پیشخدمت is more formal." },
  { front: "bill",             back: "صورت‌حساب",         sentence: "Can we have the bill, please?",          translation: "می‌تونیم صورت‌حساب رو داشته باشیم؟",    notes: "حساب = account/bill. حساب کردن = to pay/calculate." },
  { front: "portion",          back: "پرس",               sentence: "One portion of rice, please.",           translation: "یه پرس برنج لطفاً.",                    notes: "پرس = serving/portion in restaurant context." },
  { front: "tip",              back: "انعام",             sentence: "I left a tip for the waiter.",           translation: "برای گارسون انعام گذاشتم.",             notes: "Tipping in Iran is customary but not always expected." },
  { front: "to recommend",     back: "پیشنهاد دادن",      sentence: "What do you recommend?",                 translation: "چی پیشنهاد می‌دی؟",                     notes: "پیشنهاد = suggestion/recommendation." },
  { front: "soup",             back: "سوپ / آش",          sentence: "Today's soup is lentil.",                translation: "سوپ امروز عدسیه.",                      notes: "آش = thick traditional Persian soup stew." },
  { front: "kebab",            back: "کباب",              sentence: "Iranian kebabs are world-famous.",       translation: "کباب ایرانی در جهان معروفه.",            notes: "کباب کوبیده، جوجه کباب are the most popular." },
  { front: "stew",             back: "خورش / خوراک",      sentence: "Ghormeh sabzi is a famous stew.",        translation: "قورمه سبزی یه خورش مشهوره.",            notes: "Persian stews are called خورش: ghormeh sabzi, fesenjan, etc." },
  { front: "vegetarian",       back: "گیاه‌خوار",         sentence: "Do you have vegetarian options?",        translation: "غذای گیاه‌خواری دارید؟",                notes: "گیاه = plant. خوار = eater. بدون گوشت = without meat." },
  { front: "allergy",          back: "آلرژی",             sentence: "I have a nut allergy.",                  translation: "به آجیل آلرژی دارم.",                   notes: "Borrowed from English/French. آلرژی دارم = I have an allergy." },
  { front: "to taste",         back: "مزه کردن",          sentence: "Does the food taste good?",              translation: "غذا مزه خوبی داره؟",                    notes: "مزه = taste/flavour. چطوره؟ = How is it?" },
  { front: "tasty / delicious", back: "خوشمزه",           sentence: "Everything here is delicious.",          translation: "اینجا همه چیز خوشمزه‌ست.",              notes: "Lit. 'good-flavoured'. مزه = flavour." },
  { front: "sweet",            back: "شیرین",             sentence: "This dessert is very sweet.",            translation: "این دسر خیلی شیرینه.",                   notes: "Also a common Persian girl's name." },
  { front: "sour",             back: "ترش",               sentence: "The lemon is sour.",                     translation: "لیمو ترشه.",                            notes: "Sour flavour (ترش) is central to Persian cuisine." },
  { front: "bitter",           back: "تلخ",               sentence: "This coffee is very bitter.",            translation: "این قهوه خیلی تلخه.",                   notes: "Also used figuratively: زندگی تلخ = bitter life." },
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
