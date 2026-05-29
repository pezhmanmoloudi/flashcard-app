set = Deck.find_by!(name: "Food & Drink", is_system: true, language_pair: "en_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 3 – Cooking & Kitchen") { |s| s.position = 2 }

[
  { front: "to cook",          back: "آشپزی کردن / پختن", sentence: "I'm cooking dinner.",                    translation: "دارم شام می‌پزم.",                      notes: "پختن = to cook/boil. آشپزی کردن = to cook (general)." },
  { front: "to fry",           back: "سرخ کردن",          sentence: "I'm frying the onions.",                 translation: "دارم پیازا رو سرخ می‌کنم.",              notes: "سرخ = red/fried. سرخ شده = fried." },
  { front: "to bake",          back: "پختن در فر",         sentence: "I'm baking a cake.",                     translation: "دارم کیک توی فر می‌پزم.",               notes: "فر = oven. پختن در فر = baking." },
  { front: "to cut",           back: "بریدن",              sentence: "Please cut the vegetables.",             translation: "لطفاً سبزیجات رو ببر.",                 notes: "می‌برم = I cut. بریدم = I cut (past)." },
  { front: "to mix",           back: "مخلوط کردن",         sentence: "Mix the ingredients well.",              translation: "مواد رو خوب مخلوط کن.",                 notes: "مخلوط = mixed. هم زدن = to stir." },
  { front: "frying pan",       back: "تابه",               sentence: "The frying pan is very hot.",            translation: "تابه خیلی داغه.",                       notes: "تابه = frying pan. ماهیتابه also used." },
  { front: "pot",              back: "قابلمه",             sentence: "Put the pot on the stove.",              translation: "قابلمه رو روی اجاق بذار.",              notes: "قابلمه = pot/saucepan." },
  { front: "oven",             back: "فر",                 sentence: "Preheat the oven to 180 degrees.",       translation: "فر رو به ۱۸۰ درجه گرم کن.",            notes: "فر نانوایی = bakery oven. مایکروفر = microwave." },
  { front: "stove / cooker",   back: "اجاق گاز",           sentence: "The stove is very modern.",              translation: "اجاق گاز خیلی مدرنه.",                  notes: "اجاق = stove. گاز = gas. اجاق برقی = electric cooker." },
  { front: "fridge",           back: "یخچال",              sentence: "The food is in the fridge.",             translation: "غذا توی یخچاله.",                       notes: "یخ = ice. یخچال = lit. 'ice place'." },
  { front: "knife",            back: "چاقو",               sentence: "Be careful, the knife is sharp.",        translation: "مواظب باش، چاقو تیزه.",                 notes: "چاقوی آشپزخانه = kitchen knife." },
  { front: "fork",             back: "چنگال",              sentence: "Can you give me a fork?",                translation: "می‌تونی چنگال بدی بهم؟",               notes: "قاشق = spoon. چاقو = knife." },
  { front: "spoon",            back: "قاشق",               sentence: "Stir the soup with a spoon.",            translation: "سوپ رو با قاشق هم بزن.",                notes: "قاشق چایخوری = teaspoon. قاشق غذاخوری = tablespoon." },
  { front: "recipe",           back: "دستور پخت / رسپی",   sentence: "Do you have a good recipe?",             translation: "دستور پخت خوبی داری؟",                 notes: "دستور پخت = cooking instructions. رسپی is borrowed." },
  { front: "ingredient",       back: "ماده / مواد",        sentence: "We need fresh ingredients.",             translation: "مواد تازه لازم داریم.",                 notes: "مواد اولیه = raw materials/basic ingredients." },
  { front: "oil",              back: "روغن",               sentence: "Heat some oil in the pan.",              translation: "یکم روغن توی تابه گرم کن.",             notes: "روغن زیتون = olive oil. روغن مایع = liquid oil." },
  { front: "flour",            back: "آرد",                sentence: "I need two cups of flour.",              translation: "دو پیمانه آرد لازم دارم.",              notes: "آرد گندم = wheat flour. آرد برنج = rice flour." },
  { front: "to season",        back: "چاشنی زدن",          sentence: "Season with salt and pepper.",           translation: "با نمک و فلفل چاشنی بزن.",             notes: "چاشنی = seasoning. ادویه = spice." },
  { front: "hot",              back: "داغ / گرم",          sentence: "Careful, the pan is hot!",               translation: "مواظب باش، تابه داغه!",                 notes: "داغ = very hot. گرم = warm/hot (temperature)." },
  { front: "ready",            back: "آماده",              sentence: "Dinner is ready!",                       translation: "شام آماده‌ست!",                         notes: "آماده کردن = to prepare. حاضر = ready (also used)." },
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
