set = Deck.find_by!(name: "Grundlagen", is_system: true)
          .flashcard_sets
          .find_or_create_by!(name: "Set 2 – Numbers & Time") { |s| s.position = 1 }

[
  { front: "eins",               back: "یک",       sentence: "Ich habe eins gefunden.",          translation: "یکی پیدا کردم.",                 notes: "Cardinal number 1. 'Ein/eine' used before nouns." },
  { front: "zwei",               back: "دو",        sentence: "Ich habe zwei Kinder.",            translation: "من دو بچه دارم.",                notes: "Cardinal 2. 'Beide' = 'both two'." },
  { front: "drei",               back: "سه",        sentence: "Das kostet drei Euro.",            translation: "این سه یورو هزینه دارد.",         notes: "Cardinal 3." },
  { front: "vier",               back: "چهار",      sentence: "Der Zug fährt um vier Uhr ab.",    translation: "قطار ساعت چهار حرکت می‌کند.",    notes: "Cardinal 4." },
  { front: "fünf",               back: "پنج",       sentence: "Wir treffen uns um fünf.",         translation: "ساعت پنج قرار می‌گذاریم.",       notes: "Cardinal 5." },
  { front: "zehn",               back: "ده",        sentence: "Sie ist zehn Jahre alt.",          translation: "او ده سال دارد.",                notes: "Cardinal 10." },
  { front: "zwanzig",            back: "بیست",      sentence: "Es sind noch zwanzig Minuten.",    translation: "هنوز بیست دقیقه مانده.",         notes: "Cardinal 20." },
  { front: "hundert",            back: "صد",        sentence: "Das kostet hundert Euro.",         translation: "این صد یورو هزینه دارد.",         notes: "Cardinal 100. 'Ein hundert' is also used." },
  { front: "heute",              back: "امروز",     sentence: "Heute ist Montag.",                translation: "امروز دوشنبه است.",              notes: "Adverb of time. Refers to the current day." },
  { front: "morgen",             back: "فردا",      sentence: "Morgen gehe ich zum Arzt.",        translation: "فردا پیش دکتر می‌روم.",          notes: "Also means 'morning' (der Morgen)." },
  { front: "gestern",            back: "دیروز",     sentence: "Gestern war ich sehr müde.",       translation: "دیروز خیلی خسته بودم.",          notes: "Adverb of time. Always refers to the previous day." },
  { front: "jetzt",              back: "الان / حالا", sentence: "Ich bin jetzt bereit.",           translation: "الان آماده‌ام.",                 notes: "Immediate present time." },
  { front: "die Stunde",         back: "ساعت (واحد زمان)", sentence: "Die Fahrt dauert eine Stunde.", translation: "سفر یک ساعت طول می‌کشد.",     notes: "Feminine noun. Pl: die Stunden." },
  { front: "die Minute",         back: "دقیقه",     sentence: "Warte bitte fünf Minuten.",        translation: "لطفاً پنج دقیقه صبر کن.",       notes: "Feminine noun. Pl: die Minuten." },
  { front: "die Uhr",            back: "ساعت (وسیله)", sentence: "Meine Uhr ist kaputt.",           translation: "ساعتم خراب است.",               notes: "Feminine noun. Also means 'o'clock'." },
  { front: "Wie spät ist es?",   back: "ساعت چند است؟", sentence: "Entschuldigung, wie spät ist es?", translation: "ببخشید، ساعت چند است؟",       notes: "Common way to ask the time." },
  { front: "Es ist drei Uhr",    back: "ساعت سه است",  sentence: "Es ist genau drei Uhr.",          translation: "دقیقاً ساعت سه است.",            notes: "Stating the time. Add 'Uhr' after the number." },
  { front: "der Montag",         back: "دوشنبه",    sentence: "Am Montag habe ich Kurs.",         translation: "روز دوشنبه کلاس دارم.",          notes: "All days are masculine (der). Pl: die Montage." },
  { front: "der Samstag",        back: "شنبه",      sentence: "Am Samstag schlafe ich aus.",      translation: "روز شنبه تا دیر وقت می‌خوابم.", notes: "'Sonnabend' is an alternative in northern Germany." },
  { front: "das Wochenende",     back: "آخر هفته",  sentence: "Was machst du am Wochenende?",    translation: "آخر هفته چیکار می‌کنی؟",        notes: "Neuter noun. Pl: die Wochenenden." },
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
