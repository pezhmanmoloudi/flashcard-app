set = Deck.find_by!(name: "Daily Life", is_system: true, language_pair: "en_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 2 – Food & Meals") { |s| s.position = 1 }

[
  { front: "food",             back: "غذا",               sentence: "Iranian food is delicious.",             translation: "غذای ایرانی خوشمزه‌ست.",                notes: "خوراک is more formal. غذا = food in general." },
  { front: "breakfast",        back: "صبحانه",            sentence: "I eat breakfast at eight.",              translation: "صبحانه رو ساعت هشت می‌خورم.",           notes: "ناهار = lunch. شام = dinner." },
  { front: "lunch",            back: "ناهار",             sentence: "Let's have lunch together.",             translation: "بیا با هم ناهار بخوریم.",                notes: "Main meal in Iran, often eaten at midday." },
  { front: "dinner",           back: "شام",               sentence: "Dinner is at seven.",                    translation: "شام ساعت هفته.",                        notes: "Often lighter than lunch in Iranian culture." },
  { front: "bread",            back: "نان",               sentence: "We eat bread with every meal.",          translation: "با هر وعده نان می‌خوریم.",               notes: "Central to Iranian diet. Various types: بربری، لواش، سنگک." },
  { front: "rice",             back: "برنج",              sentence: "Rice is very popular in Iran.",          translation: "برنج در ایران خیلی محبوبه.",             notes: "Cooked rice: چلو. Rice dish: پلو." },
  { front: "water",            back: "آب",                sentence: "Can I have a glass of water?",           translation: "می‌تونم یه لیوان آب داشته باشم؟",       notes: "آب میوه = juice. آبمیوه = fruit juice." },
  { front: "tea",              back: "چای",               sentence: "Do you want tea or coffee?",             translation: "چای می‌خوای یا قهوه؟",                  notes: "Tea is the national drink of Iran." },
  { front: "coffee",           back: "قهوه",              sentence: "I drink one coffee a day.",              translation: "روزی یه قهوه می‌خورم.",                  notes: "قهوه‌ای = coffee-coloured (brown)." },
  { front: "milk",             back: "شیر",               sentence: "I drink a glass of milk every morning.", translation: "هر صبح یه لیوان شیر می‌خورم.",          notes: "Also means lion and tiger. شیر آب = tap water." },
  { front: "egg",              back: "تخم‌مرغ",           sentence: "I want two fried eggs.",                 translation: "دو تا تخم‌مرغ نیمرو می‌خوام.",          notes: "Lit. 'chicken egg'. نیمرو = fried egg." },
  { front: "chicken",          back: "مرغ",               sentence: "We're having chicken for dinner.",       translation: "شام مرغ داریم.",                        notes: "Meat: گوشت. Chicken: مرغ. Lamb: گوسفند." },
  { front: "fruit",            back: "میوه",              sentence: "I eat fruit every day.",                 translation: "هر روز میوه می‌خورم.",                   notes: "Vegetables: سبزیجات." },
  { front: "vegetable",        back: "سبزی / سبزیجات",   sentence: "Eat your vegetables!",                   translation: "سبزیجاتت رو بخور!",                     notes: "سبزی can also mean fresh herbs (very common in Persian food)." },
  { front: "hungry",           back: "گرسنه",             sentence: "I'm very hungry.",                       translation: "خیلی گرسنه‌ام.",                        notes: "گرسنه بودن = to be hungry. تشنه = thirsty." },
  { front: "thirsty",          back: "تشنه",              sentence: "I'm thirsty, can I have water?",         translation: "تشنه‌ام، می‌تونم آب داشته باشم؟",       notes: "Opposite: سیراب (satisfied thirst)." },
  { front: "delicious",        back: "خوشمزه",            sentence: "This food is delicious!",                translation: "این غذا خوشمزه‌ست!",                    notes: "Lit. 'good flavour'. مزه = taste/flavour." },
  { front: "sweet",            back: "شیرین",             sentence: "This tea is too sweet.",                 translation: "این چای خیلی شیرینه.",                   notes: "Also a common girl's name in Persian." },
  { front: "salty",            back: "شور",               sentence: "The soup is too salty.",                 translation: "سوپ خیلی شوره.",                        notes: "Adjective. شوری = saltiness." },
  { front: "spicy",            back: "تند",               sentence: "I like spicy food.",                     translation: "غذای تند دوست دارم.",                   notes: "تند also means fast/sharp. تندی = spiciness." },
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
