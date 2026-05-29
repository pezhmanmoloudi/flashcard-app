deck = Deck.find_by!(name: "Freizeit", is_system: true)

flashcard_data = {
  "Set 1 – Hobbies & Sports" => [
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
  ],

  "Set 2 – Weather & Seasons" => [
    { front: "das Wetter",      back: "هوا / آب و هوا", sentence: "Wie ist das Wetter heute?",     translation: "امروز هوا چطوره؟",              notes: "Neuter noun. No plural. Common topic of conversation!" },
    { front: "die Temperatur",  back: "دما",         sentence: "Die Temperatur beträgt 20 Grad.",  translation: "دما ۲۰ درجه است.",              notes: "Feminine noun. Pl: die Temperaturen." },
    { front: "die Sonne",       back: "خورشید",      sentence: "Die Sonne scheint heute.",         translation: "امروز خورشید می‌تابد.",          notes: "Feminine noun. 'Die Sonne scheint' = the sun is shining." },
    { front: "der Regen",       back: "باران",       sentence: "Es gibt heute viel Regen.",        translation: "امروز باران زیادی هست.",         notes: "Masculine noun. 'Es regnet' = it's raining." },
    { front: "der Schnee",      back: "برف",         sentence: "Im Winter fällt viel Schnee.",      translation: "در زمستان برف زیادی می‌بارد.",  notes: "Masculine noun. 'Es schneit' = it's snowing." },
    { front: "der Wind",        back: "باد",         sentence: "Heute weht ein starker Wind.",      translation: "امروز باد شدیدی می‌وزد.",        notes: "Masculine noun. Pl: die Winde." },
    { front: "die Wolke",       back: "ابر",         sentence: "Heute ist der Himmel voller Wolken.", translation: "امروز آسمان پر از ابر است.",   notes: "Feminine noun. Pl: die Wolken." },
    { front: "der Nebel",       back: "مه",          sentence: "Heute Morgen ist es sehr neblig.",  translation: "امروز صبح خیلی مه آلود است.",   notes: "Masculine noun. 'Neblig' = foggy (adjective)." },
    { front: "das Gewitter",    back: "طوفان / رعد و برق", sentence: "Ein Gewitter zieht auf.",   translation: "طوفان در راه است.",             notes: "Neuter noun. Pl: die Gewitter." },
    { front: "heiß",            back: "گرم (داغ)",   sentence: "Es ist sehr heiß heute.",          translation: "امروز خیلی گرمه.",              notes: "Adjective. More extreme than 'warm'. Opposite: kalt." },
    { front: "warm",            back: "گرم",         sentence: "Das Wetter ist angenehm warm.",     translation: "هوا به خوشایندی گرم است.",      notes: "Adjective. Pleasant warmth. Comparative: wärmer." },
    { front: "kalt",            back: "سرد",         sentence: "Heute ist es sehr kalt draußen.",   translation: "امروز بیرون خیلی سرد است.",     notes: "Adjective. Opposite: heiß/warm. Comparative: kälter." },
    { front: "der Frühling",    back: "بهار",        sentence: "Im Frühling blühen die Blumen.",    translation: "در بهار گل‌ها می‌شکفند.",       notes: "Masculine noun. The first season. 'Im Frühling' = in spring." },
    { front: "der Sommer",      back: "تابستان",     sentence: "Im Sommer fahren wir ans Meer.",    translation: "در تابستان به دریا می‌رویم.",   notes: "Masculine noun. 'Im Sommer' = in summer." },
    { front: "der Herbst",      back: "پاییز",       sentence: "Im Herbst fallen die Blätter.",     translation: "در پاییز برگ‌ها می‌ریزند.",     notes: "Masculine noun. 'Im Herbst' = in autumn/fall." },
    { front: "der Winter",      back: "زمستان",      sentence: "Der Winter in Deutschland ist kalt.", translation: "زمستان در آلمان سرد است.",    notes: "Masculine noun. 'Im Winter' = in winter." },
    { front: "sonnig",          back: "آفتابی",      sentence: "Heute ist es sonnig.",              translation: "امروز هوا آفتابیه.",            notes: "Adjective. From Sonne (sun)." },
    { front: "regnerisch",      back: "بارانی",      sentence: "Es ist heute sehr regnerisch.",     translation: "امروز هوا خیلی بارانیه.",        notes: "Adjective. From Regen (rain)." },
    { front: "bewölkt",         back: "ابری",        sentence: "Es ist bewölkt und kühl.",          translation: "هوا ابری و خنک است.",           notes: "Adjective. From Wolke (cloud)." },
    { front: "windig",          back: "بادی",        sentence: "An der Küste ist es sehr windig.",  translation: "در ساحل خیلی بادیه.",            notes: "Adjective. From Wind." },
  ],

  "Set 3 – Travel & Holidays" => [
    { front: "der Urlaub",      back: "تعطیلات",     sentence: "Ich freue mich auf den Urlaub.",   translation: "منتظر تعطیلاتم.",               notes: "Masculine noun. Pl: die Urlaube. Paid holiday/vacation." },
    { front: "die Reise",       back: "سفر",         sentence: "Die Reise war sehr schön.",         translation: "سفر خیلی خوب بود.",             notes: "Feminine noun. Pl: die Reisen." },
    { front: "das Gepäck",      back: "چمدان / بار", sentence: "Mein Gepäck ist sehr schwer.",      translation: "چمدانم خیلی سنگین است.",         notes: "Neuter noun. Usually singular. 'Gepäck aufgeben' = to check bags." },
    { front: "der Koffer",      back: "چمدان",       sentence: "Ich packe meinen Koffer.",          translation: "چمدانم را می‌بندم.",             notes: "Masculine noun. Pl: die Koffer." },
    { front: "der Reisepass",   back: "پاسپورت",     sentence: "Vergiss deinen Reisepass nicht!",   translation: "پاسپورتت را فراموش نکن!",        notes: "Masculine noun. Pl: die Reisepässe." },
    { front: "das Visum",       back: "ویزا",        sentence: "Ich brauche ein Visum für China.",  translation: "برای چین ویزا لازم دارم.",       notes: "Neuter noun. Pl: die Visa." },
    { front: "buchen",          back: "رزرو کردن",   sentence: "Ich buche das Hotel online.",       translation: "هتل را آنلاین رزرو می‌کنم.",    notes: "Regular verb. buche / buchst / bucht." },
    { front: "die Unterkunft",  back: "اقامتگاه",    sentence: "Wir suchen noch eine Unterkunft.",  translation: "هنوز دنبال اقامتگاه می‌گردیم.",  notes: "Feminine noun. Pl: die Unterkünfte." },
    { front: "das Meer",        back: "دریا",        sentence: "Ich liebe das Meer im Sommer.",     translation: "در تابستان دریا را دوست دارم.",  notes: "Neuter noun. Pl: die Meere." },
    { front: "der Strand",      back: "ساحل",        sentence: "Wir liegen am Strand.",             translation: "ما روی ساحل دراز کشیدیم.",      notes: "Masculine noun. Pl: die Strände." },
    { front: "die Berge",       back: "کوهستان",     sentence: "Ich wandere gerne in den Bergen.",  translation: "دوست دارم در کوه‌ها پیاده‌روی کنم.", notes: "Always plural here. Singular: der Berg." },
    { front: "die Sehenswürdigkeit", back: "جاذبه گردشگری", sentence: "Wien hat viele Sehenswürdigkeiten.", translation: "وین جاذبه‌های گردشگری زیادی دارد.", notes: "Feminine noun. Pl: die Sehenswürdigkeiten. Tourist attraction." },
    { front: "die Stadtführung", back: "تور شهری",   sentence: "Ich mache eine Stadtführung.",      translation: "یک تور شهری می‌روم.",           notes: "Feminine noun. Pl: die Stadtführungen. City tour." },
    { front: "das Souvenir",    back: "سوغاتی",      sentence: "Ich kaufe Souvenirs für meine Familie.", translation: "برای خانواده‌ام سوغاتی می‌خرم.", notes: "Neuter noun. Pl: die Souvenirs." },
    { front: "die Kamera",      back: "دوربین",      sentence: "Ich vergesse immer meine Kamera.",  translation: "همیشه دوربینم را فراموش می‌کنم.", notes: "Feminine noun. Pl: die Kameras." },
    { front: "ankommen",        back: "رسیدن",       sentence: "Wir kommen morgen in Paris an.",    translation: "فردا به پاریس می‌رسیم.",         notes: "Separable verb. komme an / kommst an." },
    { front: "abfahren",        back: "حرکت کردن",   sentence: "Der Bus fährt in zehn Minuten ab.", translation: "اتوبوس ده دقیقه دیگر حرکت می‌کند.", notes: "Separable verb. fahre ab / fährst ab." },
    { front: "die Karte",       back: "نقشه / کارت", sentence: "Hast du eine Karte von der Stadt?", translation: "نقشه شهر داری؟",               notes: "Feminine noun. Context determines meaning (map or card)." },
    { front: "verloren",        back: "گم شده",      sentence: "Ich habe mich verlaufen.",          translation: "گم شدم.",                       notes: "Past participle of 'verlieren'. 'Sich verlaufen' = to get lost." },
    { front: "aufregend",       back: "هیجان‌انگیز", sentence: "Die Reise war sehr aufregend.",     translation: "سفر خیلی هیجان‌انگیز بود.",     notes: "Adjective. From 'aufregen' (to excite)." },
  ],
}.freeze

deck.flashcard_sets.each do |set|
  cards = DATA[set.name]
  next unless cards

  cards.each do |c|
    Flashcard.find_or_create_by!(flashcard_set: set, front_text: c[:front]) do |f|
      f.back_text           = c[:back]
      f.example_sentence    = c[:sentence]
      f.translated_sentence = c[:translation]
      f.grammar_notes       = c[:notes]
      f.source_language     = "german"
      f.target_language     = "persian"
    end
  end
end

puts "  → Freizeit flashcards seeded"
