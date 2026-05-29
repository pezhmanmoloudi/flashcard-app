set = Deck.find_by!(name: "Freizeit", is_system: true, language_pair: "de_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 3 – Travel & Holidays") { |s| s.position = 2 }

[
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
