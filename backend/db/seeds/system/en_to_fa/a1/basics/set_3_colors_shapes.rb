set = Deck.find_by!(name: "Basics", is_system: true, language_pair: "en_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 3 – Colours & Shapes") { |s| s.position = 2 }

[
  { front: "red",              back: "قرمز",              sentence: "I love the colour red.",                 translation: "رنگ قرمز رو دوست دارم.",                notes: "Colour adjective. رنگ = colour." },
  { front: "blue",             back: "آبی",               sentence: "The sky is blue.",                       translation: "آسمون آبیه.",                           notes: "Colour adjective." },
  { front: "green",            back: "سبز",               sentence: "The grass is green.",                    translation: "چمن سبزه.",                             notes: "Colour adjective." },
  { front: "yellow",           back: "زرد",               sentence: "The sun is yellow.",                     translation: "خورشید زرده.",                          notes: "Colour adjective." },
  { front: "white",            back: "سفید",              sentence: "She's wearing a white dress.",            translation: "یه لباس سفید پوشیده.",                  notes: "Colour adjective. Opposite: سیاه (black)." },
  { front: "black",            back: "سیاه",              sentence: "My car is black.",                       translation: "ماشینم سیاهه.",                         notes: "Colour adjective. Opposite: سفید (white)." },
  { front: "orange",           back: "نارنجی",            sentence: "I like orange.",                         translation: "رنگ نارنجی رو دوست دارم.",              notes: "Named after the fruit نارنج." },
  { front: "pink",             back: "صورتی",             sentence: "She loves pink flowers.",                translation: "گل‌های صورتی رو دوست داره.",            notes: "Colour adjective." },
  { front: "purple",           back: "بنفش",              sentence: "The curtains are purple.",               translation: "پرده‌ها بنفشن.",                        notes: "Colour adjective." },
  { front: "brown",            back: "قهوه‌ای",           sentence: "My eyes are brown.",                     translation: "چشمام قهوه‌اییه.",                      notes: "Named after قهوه (coffee)." },
  { front: "circle",           back: "دایره",             sentence: "Draw a circle.",                         translation: "یه دایره بکش.",                         notes: "Geometric shape." },
  { front: "square",           back: "مربع",              sentence: "A square has four equal sides.",         translation: "مربع چهار ضلع مساوی داره.",             notes: "Geometric shape. مستطیل = rectangle." },
  { front: "triangle",         back: "مثلث",              sentence: "A triangle has three sides.",            translation: "مثلث سه ضلع داره.",                     notes: "Geometric shape. Tri = three." },
  { front: "big",              back: "بزرگ",              sentence: "That's a very big house.",               translation: "اون یه خونه خیلی بزرگه.",               notes: "Adjective. Opposite: کوچک (small)." },
  { front: "small",            back: "کوچک",              sentence: "I have a small cat.",                    translation: "یه گربه کوچک دارم.",                    notes: "Adjective. Also: کوچولو (informal/cute)." },
  { front: "tall / long",      back: "بلند",              sentence: "He is very tall.",                       translation: "خیلی بلنده.",                           notes: "Adjective for height and length." },
  { front: "short",            back: "کوتاه",             sentence: "She has short hair.",                    translation: "موهای کوتاه داره.",                     notes: "Adjective for height and length." },
  { front: "new",              back: "جدید / نو",          sentence: "I bought a new phone.",                  translation: "یه گوشی جدید خریدم.",                   notes: "جدید = new/recent. نو = brand new." },
  { front: "old",              back: "قدیمی",             sentence: "This is an old building.",               translation: "این یه ساختمون قدیمیه.",                notes: "Adjective. Also: پیر for people (elderly)." },
  { front: "beautiful",        back: "زیبا / قشنگ",       sentence: "What a beautiful city!",                 translation: "چه شهر زیبایی!",                        notes: "زیبا is more formal; قشنگ is colloquial." },
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
