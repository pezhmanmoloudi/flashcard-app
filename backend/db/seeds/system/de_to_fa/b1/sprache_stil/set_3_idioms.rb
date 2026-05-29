set = Deck.find_by!(name: "Sprache & Stil", is_system: true, language_pair: "de_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 3 – Redewendungen") { |s| s.position = 2 }

[
  { front: "Das ist nicht mein Bier.",              back: "به من ربطی ندارد.",                  sentence: "Was er macht, ist nicht mein Bier.",                translation: "به کارهای او ربطی به من ندارد.",                notes: "Colloquial idiom. Bier (beer) used figuratively for 'business/concern'." },
  { front: "auf dem Laufenden bleiben",             back: "در جریان بودن / به‌روز ماندن",       sentence: "Ich versuche, auf dem Laufenden zu bleiben.",        translation: "سعی می‌کنم در جریان امور باشم.",                notes: "Fixed expression. 'Jemanden auf dem Laufenden halten' = to keep sb updated." },
  { front: "unter vier Augen",                     back: "خصوصی / دو نفری",                   sentence: "Können wir das unter vier Augen besprechen?",        translation: "می‌توانیم این را خصوصی بحث کنیم؟",             notes: "Idiom. Literally 'under four eyes' = just the two of us, privately." },
  { front: "jemandem auf den Zahn fühlen",         back: "از کسی بازجویی کردن / کاوش کردن",    sentence: "Der Journalist fühlte dem Politiker auf den Zahn.",   translation: "روزنامه‌نگار از سیاستمدار بازجویی کرد.",        notes: "Idiom. Literally 'to feel someone's tooth'. To probe or question sb closely." },
  { front: "ins Schwarze treffen",                 back: "به هدف زدن / درست گفتن",             sentence: "Mit dieser Bemerkung hat er ins Schwarze getroffen.", translation: "با آن حرف دقیقاً به هدف زد.",                  notes: "Idiom. Literally 'to hit the black (bullseye)'. To be exactly right." },
  { front: "jemandem auf die Nerven gehen",        back: "روی اعصاب کسی رفتن",                sentence: "Er geht mir so auf die Nerven!",                     translation: "او خیلی روی اعصابم می‌رود!",                   notes: "Common colloquial expression. 'Die Nerven' = nerves." },
  { front: "zwei Fliegen mit einer Klappe schlagen", back: "یک تیر و دو نشان زدن",             sentence: "Mit diesem Kurs schlage ich zwei Fliegen mit einer Klappe.", translation: "با این دوره یک تیر و دو نشان می‌زنم.",      notes: "Idiom. Literally 'to hit two flies with one flap'. Equivalent to Persian proverb." },
  { front: "um den heißen Brei herumreden",        back: "دور زدن / مستقیم نگفتن",            sentence: "Hör auf, um den heißen Brei herumzureden!",           translation: "دست بردار از دور زدن و مستقیم بگو!",           notes: "Idiom. Literally 'to talk around the hot porridge'. To beat around the bush." },
  { front: "die Nase voll haben",                  back: "دیگر طاقت نداشتن / کافی بودن",      sentence: "Ich habe die Nase voll von dieser Arbeit.",           translation: "از این کار دیگر طاقتم تمام شده.",              notes: "Colloquial idiom. Literally 'to have one's nose full'. To be fed up." },
  { front: "auf der Hand liegen",                  back: "کاملاً واضح بودن / آشکار بودن",      sentence: "Die Lösung liegt doch auf der Hand!",                 translation: "جواب که کاملاً واضح است!",                      notes: "Idiom. Literally 'to lie on the hand'. Obviously clear to everyone." },
  { front: "Daumen drücken",                       back: "آرزوی موفقیت کردن",                 sentence: "Drück mir die Daumen für die Prüfung!",               translation: "برای امتحانم آرزوی موفقیت کن!",                notes: "German: press thumbs (not fingers). 'Ich drücke dir die Daumen' = Good luck!" },
  { front: "jemandem den Rücken stärken",          back: "پشتیبانی از کسی کردن",              sentence: "Sie hat mir immer den Rücken gestärkt.",              translation: "او همیشه از من پشتیبانی کرده.",                notes: "Idiom. Literally 'to strengthen someone's back'. To back someone up." },
  { front: "über den Tellerrand schauen",          back: "فراتر از حد معمول فکر کردن",        sentence: "Wir müssen über den Tellerrand schauen.",             translation: "باید فراتر از حد معمول فکر کنیم.",             notes: "Idiom. Literally 'to look beyond the edge of the plate'. To think outside the box." },
  { front: "im Handumdrehen",                      back: "در یک چشم به هم زدن",               sentence: "Das ist im Handumdrehen erledigt.",                   translation: "این در یک چشم به هم زدن تمام می‌شود.",         notes: "Adverbial idiom. Literally 'in the turning of a hand'. In no time at all." },
  { front: "von vorne anfangen",                   back: "از نو / از صفر شروع کردن",          sentence: "Wir müssen leider von vorne anfangen.",               translation: "متأسفانه باید از نو شروع کنیم.",               notes: "Phrase. 'Ganz von vorne anfangen' = to start completely from scratch." },
  { front: "in der Klemme sitzen",                 back: "در مخمصه بودن / گیر کردن",          sentence: "Ich sitze gerade in der Klemme.",                     translation: "الان گیر کرده‌ام.",                             notes: "Idiom. Literally 'to sit in the clamp'. To be in a fix or tight spot." },
  { front: "unter Druck stehen",                   back: "زیر فشار بودن / تحت فشار بودن",    sentence: "Er steht im Moment sehr unter Druck.",                translation: "او الان خیلی زیر فشار است.",                   notes: "Fixed expression. 'Jemanden unter Druck setzen' = to put pressure on sb." },
  { front: "den Nagel auf den Kopf treffen",       back: "دقیقاً به نکته اصلی اشاره کردن",   sentence: "Da hast du den Nagel auf den Kopf getroffen.",         translation: "دقیقاً به نکته اصلی اشاره کردی.",              notes: "Idiom. Literally 'to hit the nail on the head'. Similar to 'ins Schwarze treffen'." },
  { front: "Butter bei die Fische",                back: "مستقیم برو سر اصل مطلب",            sentence: "Butter bei die Fische – was willst du eigentlich?",   translation: "مستقیم بگو – اصلاً چه می‌خواهی؟",             notes: "Northern German idiom. Literally 'put butter with the fish'. Get to the point." },
  { front: "über Nacht",                           back: "یک شبه / در طول یک شب",             sentence: "Über Nacht ist er berühmt geworden.",                  translation: "یک شبه معروف شد.",                              notes: "Adverbial phrase. Used for sudden change. 'Das geht nicht über Nacht' = it takes time." },
].each do |c|
  Flashcard.find_or_create_by!(flashcard_set: set, front_text: c[:front]) do |f|
    f.back_text           = c[:back]
    f.example_sentence    = c[:sentence]
    f.translated_sentence = c[:translation]
    f.grammar_notes       = c[:notes]
    f.source_language     = "german"
    f.target_language     = "persian"
  end
end
