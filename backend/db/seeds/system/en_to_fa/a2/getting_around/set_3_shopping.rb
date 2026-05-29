set = Deck.find_by!(name: "Getting Around", is_system: true, language_pair: "en_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 3 – Shopping") { |s| s.position = 2 }

[
  { front: "shop / store",     back: "مغازه / فروشگاه",  sentence: "There's a good shop near here.",         translation: "یه مغازه خوب اینجا نزدیکه.",            notes: "مغازه = small shop. فروشگاه = larger store." },
  { front: "to buy",           back: "خریدن",             sentence: "I want to buy a present.",               translation: "می‌خوام یه هدیه بخرم.",                 notes: "می‌خرم = I buy. خریدم = I bought." },
  { front: "to sell",          back: "فروختن",            sentence: "They sell fresh fruit here.",            translation: "اینجا میوه تازه می‌فروشن.",              notes: "می‌فروشم = I sell. فروختم = I sold." },
  { front: "price",            back: "قیمت",              sentence: "What is the price of this?",             translation: "قیمت این چقدره؟",                       notes: "چقدر می‌شه؟ = How much is it? (colloquial)" },
  { front: "expensive",        back: "گرون",              sentence: "That's too expensive.",                  translation: "این خیلی گرونه.",                        notes: "گران is the formal spelling. گرونی = high prices." },
  { front: "cheap",            back: "ارزان",             sentence: "I found something cheap.",               translation: "یه چیز ارزون پیدا کردم.",               notes: "Opposite: گرون. ارزون is colloquial form." },
  { front: "discount",         back: "تخفیف",             sentence: "Is there a discount on this?",           translation: "روی این تخفیف هست؟",                    notes: "تخفیف دادن = to give a discount." },
  { front: "checkout / till",  back: "صندوق",             sentence: "Please pay at the checkout.",            translation: "لطفاً پشت صندوق بپرداز.",               notes: "صندوق‌دار = cashier." },
  { front: "receipt",          back: "رسید",              sentence: "Can I have a receipt?",                  translation: "می‌تونم رسید داشته باشم؟",              notes: "فاکتور = invoice." },
  { front: "cash",             back: "نقد / پول نقد",     sentence: "Do you pay cash or by card?",            translation: "نقد می‌پردازی یا با کارت؟",             notes: "نقد = cash. کارت = card." },
  { front: "credit card",      back: "کارت بانکی",        sentence: "Can I pay by card?",                     translation: "می‌تونم با کارت بپردازم؟",              notes: "In Iran often referred to as کارت (card)." },
  { front: "bag",              back: "کیسه / پاکت",       sentence: "Do you need a bag?",                     translation: "کیسه لازم داری؟",                       notes: "کیسه = plastic/paper bag. کیف = handbag." },
  { front: "size",             back: "سایز",              sentence: "What size are you?",                     translation: "چه سایزی هستی؟",                        notes: "اندازه = size/measurement (general)." },
  { front: "to exchange",      back: "عوض کردن / تعویض",  sentence: "Can I exchange this item?",              translation: "می‌تونم این رو عوض کنم؟",               notes: "تعویض = exchange/replacement." },
  { front: "to look for",      back: "دنبال … گشتن",      sentence: "I'm looking for a birthday gift.",       translation: "دنبال هدیه تولد می‌گردم.",              notes: "Also: دنبال … بودن. گشتن = to search." },
  { front: "special offer",    back: "تخفیف ویژه",        sentence: "There are special offers today.",        translation: "امروز تخفیف ویژه هست.",                 notes: "ویژه = special/dedicated." },
  { front: "How much?",        back: "چقدر؟",             sentence: "How much does this cost?",               translation: "این چقدره؟",                            notes: "Informal. Formal: قیمتش چقدر است؟" },
  { front: "euro",             back: "یورو",              sentence: "It costs fifty euros.",                  translation: "پنجاه یورو قیمتشه.",                    notes: "In Iran: تومان (Toman) or ریال (Rial)." },
  { front: "to need",          back: "نیاز داشتن / لازم داشتن", sentence: "I need a new jacket.",           translation: "یه کت جدید نیاز دارم.",                 notes: "لازم دارم is more colloquial." },
  { front: "to find",          back: "پیدا کردن",         sentence: "I can't find it anywhere.",              translation: "هیچ جا پیداش نمی‌کنم.",                notes: "پیدا = found. پیدا کردم = I found." },
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
