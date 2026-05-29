set = Deck.find_by!(name: "Freizeit", is_system: true, language_pair: "de_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 1 – Hobbies & Sports") { |s| s.position = 0 }

[
  { front: "das Hobby",       back: "سرگرمی",      sentence: "Was ist dein Hobby?",               translation: "سرگرمیت چیه؟",                 notes: "Neuter noun. Pl: die Hobbys." },
  { front: "der Sport",       back: "ورزش",        sentence: "Er treibt jeden Tag Sport.",        translation: "هر روز ورزش می‌کند.",           notes: "Masculine noun. No plural. 'Sport machen/treiben' = to do sport." },
  { front: "Fußball spielen", back: "فوتبال بازی کردن", sentence: "Wir spielen am Wochenende Fußball.", translation: "آخر هفته فوتبال بازی می‌کنیم.", notes: "Fußball = football/soccer. 'spielen' = to play." },
  { front: "schwimmen",       back: "شنا کردن",    sentence: "Ich schwimme gerne im See.",        translation: "دوست دارم در دریاچه شنا کنم.",   notes: "Strong verb. schwimme / schwimmst / schwimmt." },
  { front: "laufen",          back: "دویدن / راه رفتن", sentence: "Ich laufe jeden Morgen.",      translation: "هر صبح می‌دوم.",                notes: "Strong verb. laufe / läufst / läuft." },
  { front: "Rad fahren",      back: "دوچرخه سواری", sentence: "Am Sonntag fahre ich Rad.",       translation: "یکشنبه دوچرخه‌سواری می‌کنم.",   notes: "Separable compound. fahre Rad / fährst Rad." },
  { front: "Ski fahren",      back: "اسکی کردن",   sentence: "Im Winter fahre ich gerne Ski.",    translation: "در زمستان دوست دارم اسکی کنم.", notes: "Separable compound. Same pattern as Rad fahren." },
  { front: "lesen",           back: "خواندن",      sentence: "Ich lese jeden Abend ein Buch.",    translation: "هر شب یک کتاب می‌خوانم.",       notes: "Strong verb. lese / liest / liest." },
  { front: "Musik hören",     back: "موسیقی گوش دادن", sentence: "Ich höre gerne Musik.",       translation: "دوست دارم موسیقی گوش بدم.",     notes: "'Hören' = to listen/hear. 'Musik hören' = to listen to music." },
  { front: "kochen",          back: "آشپزی کردن",  sentence: "Kochen ist mein Lieblingshobbby.",  translation: "آشپزی سرگرمی محبوبمه.",         notes: "Regular verb. A hobby as well as a necessity!" },
  { front: "reisen",          back: "مسافرت کردن", sentence: "Ich reise gerne ins Ausland.",      translation: "دوست دارم به خارج مسافرت کنم.", notes: "Regular verb. reise / reist. Travel as a hobby." },
  { front: "Foto machen",     back: "عکس گرفتن",   sentence: "Er macht gerne Fotos in der Natur.", translation: "دوست دارد در طبیعت عکس بگیرد.", notes: "'Fotografieren' is the formal verb. 'Ein Foto machen' is common." },
  { front: "zeichnen",        back: "نقاشی کردن",  sentence: "Meine Schwester zeichnet sehr gut.", translation: "خواهرم خیلی خوب نقاشی می‌کشد.", notes: "Regular verb. zeichne / zeichnest / zeichnet." },
  { front: "singen",          back: "آواز خواندن", sentence: "Er singt in einem Chor.",           translation: "او در یک گروه کر می‌خواند.",    notes: "Strong verb. singe / singst / singt." },
  { front: "tanzen",          back: "رقصیدن",      sentence: "Wir tanzen jeden Freitagabend.",    translation: "هر جمعه شب می‌رقصیم.",          notes: "Regular verb. tanze / tanzt." },
  { front: "der Verein",      back: "باشگاه / انجمن", sentence: "Ich bin Mitglied in einem Sportverein.", translation: "عضو یک باشگاه ورزشی هستم.", notes: "Masculine noun. Pl: die Vereine." },
  { front: "das Training",    back: "تمرین",       sentence: "Das Training beginnt um 19 Uhr.",   translation: "تمرین ساعت ۷ شب شروع می‌شود.", notes: "Neuter noun. Pl: die Trainings." },
  { front: "spielen",         back: "بازی کردن",   sentence: "Die Kinder spielen im Garten.",     translation: "بچه‌ها در باغ بازی می‌کنند.",  notes: "Regular verb. spiele / spielst / spielt." },
  { front: "gewinnen",        back: "برنده شدن",   sentence: "Wir haben das Spiel gewonnen.",     translation: "ما بازی را بردیم.",              notes: "Strong verb. gewinne / gewinnst / gewinnt." },
  { front: "verlieren",       back: "باختن",       sentence: "Verlieren gehört auch dazu.",       translation: "باختن هم بخشی از بازیه.",        notes: "Strong verb. verliere / verlierst / verliert." },
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
