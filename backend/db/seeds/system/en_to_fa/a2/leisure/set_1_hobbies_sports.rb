set = Deck.find_by!(name: "Leisure", is_system: true, language_pair: "en_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 1 – Hobbies & Sports") { |s| s.position = 0 }

[
  { front: "hobby",            back: "سرگرمی / تفریح",    sentence: "What is your hobby?",                    translation: "سرگرمیت چیه؟",                          notes: "سرگرمی = hobby/pastime. تفریح = leisure/fun." },
  { front: "sport",            back: "ورزش",              sentence: "I exercise three times a week.",         translation: "هفته‌ای سه بار ورزش می‌کنم.",           notes: "ورزش کردن = to exercise/play sport." },
  { front: "to play",          back: "بازی کردن",         sentence: "I like playing football.",               translation: "فوتبال بازی کردن دوست دارم.",           notes: "بازی = game/play. بازی کردن = to play." },
  { front: "to swim",          back: "شنا کردن",          sentence: "I swim in the sea in summer.",           translation: "تابستون توی دریا شنا می‌کنم.",           notes: "شنا = swimming. استخر شنا = swimming pool." },
  { front: "to run",           back: "دویدن",             sentence: "I run in the park every morning.",       translation: "هر صبح توی پارک می‌دوم.",               notes: "می‌دوم = I run. دویدم = I ran." },
  { front: "to cycle",         back: "دوچرخه سواری کردن", sentence: "I cycle to work.",                       translation: "با دوچرخه سر کار می‌رم.",               notes: "دوچرخه = bicycle. سواری = riding." },
  { front: "football",         back: "فوتبال",            sentence: "Football is the most popular sport.",    translation: "فوتبال محبوب‌ترین ورزشه.",              notes: "Widely popular in Iran. تیم ملی = national team." },
  { front: "volleyball",       back: "والیبال",           sentence: "I play volleyball at the beach.",        translation: "توی ساحل والیبال بازی می‌کنم.",          notes: "Iran has a strong national volleyball team." },
  { front: "gym",              back: "باشگاه",            sentence: "I go to the gym every day.",             translation: "هر روز می‌رم باشگاه.",                   notes: "باشگاه ورزشی = sports club. باشگاه = club in general." },
  { front: "swimming pool",    back: "استخر",             sentence: "The swimming pool opens at 7 am.",       translation: "استخر ساعت ۷ صبح باز می‌شه.",           notes: "استخر شنا = swimming pool." },
  { front: "to read",          back: "خواندن / کتاب خواندن", sentence: "I love reading books.",              translation: "کتاب خوندن رو دوست دارم.",              notes: "خواندن = to read/sing. کتاب = book." },
  { front: "to paint",         back: "نقاشی کردن",        sentence: "My sister loves painting.",              translation: "خواهرم نقاشی کردن رو دوست داره.",       notes: "نقاشی = painting/drawing. نقاش = painter." },
  { front: "to listen to music", back: "موسیقی گوش دادن", sentence: "I listen to music when I cook.",        translation: "وقتی آشپزی می‌کنم موسیقی گوش می‌دم.",   notes: "موسیقی = music. آهنگ = song." },
  { front: "to dance",         back: "رقصیدن",            sentence: "We dance at parties.",                   translation: "توی مهمونی‌ها می‌رقصیم.",               notes: "رقص = dance. رقصیدن = to dance." },
  { front: "to photograph",    back: "عکاسی کردن",        sentence: "He loves photographing nature.",         translation: "عاشق عکاسی از طبیعته.",                 notes: "عکس = photo. عکاس = photographer." },
  { front: "to travel",        back: "سفر کردن",          sentence: "I love to travel.",                      translation: "عاشق سفر کردنم.",                       notes: "سفر = trip/journey. مسافر = traveller." },
  { front: "team",             back: "تیم",               sentence: "Our team won.",                          translation: "تیممون برد.",                            notes: "گروه = group/team. تیم is borrowed from English." },
  { front: "to win",           back: "برنده شدن / بردن",  sentence: "We won the match.",                      translation: "مسابقه رو بردیم.",                      notes: "برد = win (noun). بردیم = we won." },
  { front: "to lose",          back: "باختن",             sentence: "Sometimes you win, sometimes you lose.", translation: "گاهی می‌بری، گاهی می‌بازی.",             notes: "باخت = loss. باختیم = we lost." },
  { front: "free time",        back: "وقت آزاد",          sentence: "What do you do in your free time?",      translation: "اوقات فراغتت چی کار می‌کنی؟",           notes: "اوقات فراغت = leisure time (formal). وقت آزاد = free time." },
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
