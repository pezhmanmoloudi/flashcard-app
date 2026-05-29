set = Deck.find_by!(name: "People", is_system: true, language_pair: "en_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 1 – Family") { |s| s.position = 0 }

[
  { front: "family",           back: "خانواده",           sentence: "My family is very important to me.",     translation: "خانواده‌ام خیلی برام مهمه.",            notes: "خانواده = family. خانواده‌ام = my family." },
  { front: "mother",           back: "مادر / مامان",      sentence: "My mother is a teacher.",                translation: "مادرم معلمه.",                          notes: "مادر is formal; مامان is informal/affectionate." },
  { front: "father",           back: "پدر / بابا",        sentence: "My father works in an office.",          translation: "پدرم توی اداره کار می‌کنه.",            notes: "پدر is formal; بابا is informal/affectionate." },
  { front: "parents",          back: "والدین / پدر و مادر", sentence: "My parents live in Tehran.",           translation: "والدینم در تهران زندگی می‌کنن.",         notes: "والدین is the formal plural of parent." },
  { front: "brother",          back: "برادر",             sentence: "I have one brother.",                    translation: "یه برادر دارم.",                        notes: "داداش is informal/affectionate." },
  { front: "sister",           back: "خواهر",             sentence: "My sister is older than me.",            translation: "خواهرم از من بزرگ‌تره.",                notes: "آبجی is informal/affectionate." },
  { front: "son",              back: "پسر",               sentence: "They have two sons.",                    translation: "دو تا پسر دارن.",                       notes: "Also means 'boy'." },
  { front: "daughter",         back: "دختر",              sentence: "Their daughter is very smart.",          translation: "دخترشون خیلی باهوشه.",                  notes: "Also means 'girl'." },
  { front: "grandfather",      back: "پدربزرگ",           sentence: "My grandfather is 80 years old.",        translation: "پدربزرگم هشتاد سالشه.",                 notes: "Lit. 'big father'. بابابزرگ is informal." },
  { front: "grandmother",      back: "مادربزرگ",          sentence: "My grandmother cooks very well.",        translation: "مادربزرگم خیلی خوب آشپزی می‌کنه.",     notes: "Lit. 'big mother'. مامان‌بزرگ is informal." },
  { front: "husband",          back: "شوهر / همسر",       sentence: "Her husband is a doctor.",               translation: "شوهرش دکتره.",                          notes: "همسر = spouse (gender-neutral, formal)." },
  { front: "wife",             back: "زن / همسر",         sentence: "His wife is a teacher.",                 translation: "زنش معلمه.",                            notes: "زن = woman/wife. همسر = spouse (neutral)." },
  { front: "child / children", back: "بچه / بچه‌ها",      sentence: "They have three children.",              translation: "سه تا بچه دارن.",                       notes: "بچه = child (informal). فرزند = child (formal)." },
  { front: "uncle",            back: "عمو / دایی",         sentence: "My uncle lives in Germany.",             translation: "عموم در آلمان زندگی می‌کنه.",           notes: "عمو = father's brother. دایی = mother's brother." },
  { front: "aunt",             back: "عمه / خاله",         sentence: "My aunt makes great food.",              translation: "خاله‌ام غذاهای خوبی درست می‌کنه.",     notes: "عمه = father's sister. خاله = mother's sister." },
  { front: "cousin",           back: "پسرعمو / دخترعمو",  sentence: "My cousin is my best friend.",           translation: "پسرعموم بهترین دوستمه.",                notes: "Persian distinguishes many cousin types by gender/parent." },
  { front: "friend",           back: "دوست",              sentence: "She is my best friend.",                 translation: "اون بهترین دوستمه.",                    notes: "دوست دارم = I love/like. دوستی = friendship." },
  { front: "neighbour",        back: "همسایه",            sentence: "My neighbours are very kind.",           translation: "همسایه‌هام خیلی مهربونن.",              notes: "همسایگی = neighbourhood." },
  { front: "old",              back: "پیر / مسن",         sentence: "My grandfather is old.",                 translation: "پدربزرگم پیره.",                        notes: "پیر = old (people). قدیمی = old (things)." },
  { front: "young",            back: "جوان",              sentence: "She looks very young.",                  translation: "خیلی جوون به نظر می‌رسه.",               notes: "جوان = young/youth. جوانی = youth (noun)." },
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
