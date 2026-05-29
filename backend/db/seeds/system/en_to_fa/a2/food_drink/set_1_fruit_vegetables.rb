set = Deck.find_by!(name: "Food & Drink", is_system: true, language_pair: "en_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 1 – Fruit & Vegetables") { |s| s.position = 0 }

[
  { front: "apple",            back: "سیب",               sentence: "An apple a day keeps the doctor away.",  translation: "روزی یه سیب، دکتر رو دور می‌کنه.",     notes: "سیب درختی = tree apple. سیب زمینی = potato (lit. earth apple)." },
  { front: "banana",           back: "موز",               sentence: "I eat a banana every morning.",          translation: "هر صبح یه موز می‌خورم.",                notes: "Tropical fruit. موزی = banana-like/simple (informal)." },
  { front: "orange",           back: "پرتقال",            sentence: "I love fresh orange juice.",             translation: "آب پرتقال تازه رو عاشقم.",              notes: "Named after Portugal. آب پرتقال = orange juice." },
  { front: "strawberry",       back: "توت‌فرنگی",         sentence: "Strawberries are my favourite fruit.",   translation: "توت‌فرنگی میوه مورد علاقه‌امه.",       notes: "Lit. 'foreign mulberry'. توت = mulberry." },
  { front: "grape",            back: "انگور",             sentence: "These grapes are very sweet.",           translation: "این انگورا خیلی شیرینن.",               notes: "کشمش = raisins (dried grapes)." },
  { front: "tomato",           back: "گوجه‌فرنگی",        sentence: "Tomatoes are used in many Iranian dishes.", translation: "گوجه‌فرنگی در غذاهای ایرانی خیلی استفاده می‌شه.", notes: "Lit. 'foreign tomato'. گوجه alone = plum in some regions." },
  { front: "potato",           back: "سیب زمینی",         sentence: "Potatoes are used in many dishes.",      translation: "سیب زمینی توی خیلی از غذاها استفاده می‌شه.", notes: "Lit. 'earth apple'. سیب = apple. زمینی = earthly." },
  { front: "carrot",           back: "هویج",              sentence: "Carrots are good for your eyes.",        translation: "هویج برای چشم خوبه.",                   notes: "هویج is the standard Persian word." },
  { front: "onion",            back: "پیاز",              sentence: "The onion makes me cry.",                translation: "پیاز منو به گریه می‌اندازه.",           notes: "Essential ingredient in Persian cooking." },
  { front: "garlic",           back: "سیر",               sentence: "Persian food uses a lot of garlic.",     translation: "غذای ایرانی خیلی سیر داره.",            notes: "سیر also means full (not hungry)." },
  { front: "salad",            back: "سالاد",             sentence: "I eat salad every day.",                 translation: "هر روز سالاد می‌خورم.",                  notes: "Persian salads often include cucumbers and tomatoes." },
  { front: "cucumber",         back: "خیار",              sentence: "Cucumber with cheese is delicious.",     translation: "خیار با پنیر خوشمزه‌ست.",               notes: "Very common in Iranian cuisine and breakfasts." },
  { front: "pepper (capsicum)", back: "فلفل دلمه‌ای",    sentence: "Red peppers are sweeter than green.",    translation: "فلفل دلمه‌ای قرمز از سبز شیرین‌تره.",  notes: "فلفل = pepper. دلمه = stuffed — commonly stuffed in Persian cuisine." },
  { front: "lemon",            back: "لیمو",              sentence: "I like tea with lemon.",                 translation: "چای با لیمو دوست دارم.",                 notes: "لیموترش = sour lemon. لیموشیرین = sweet lime." },
  { front: "watermelon",       back: "هندوانه",           sentence: "Watermelon is a summer fruit.",          translation: "هندوانه میوه تابستونیه.",               notes: "Eating هندوانه is a Yalda Night tradition in Iran." },
  { front: "pomegranate",      back: "انار",              sentence: "Pomegranate is a symbol of Iran.",       translation: "انار نماد ایرانه.",                     notes: "انار دانه = pomegranate seeds. Very important in Persian culture." },
  { front: "pear",             back: "گلابی",             sentence: "The pear is ripe and juicy.",            translation: "گلابی رسیده و آبداره.",                 notes: "Common Iranian fruit." },
  { front: "peach",            back: "هلو",               sentence: "I love eating peaches in summer.",       translation: "تابستون عاشق خوردن هلوام.",             notes: "Common summer fruit in Iran." },
  { front: "fresh",            back: "تازه",              sentence: "I prefer fresh vegetables.",             translation: "سبزیجات تازه رو ترجیح می‌دم.",          notes: "تازه also means new/recent." },
  { front: "ripe",             back: "رسیده",             sentence: "Is the fruit ripe yet?",                 translation: "میوه هنوز رسیده؟",                      notes: "Opposite: نارس (unripe). رسیده = arrived/ripe." },
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
