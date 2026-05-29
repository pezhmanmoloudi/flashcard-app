set = Deck.find_by!(name: "Grundlagen", is_system: true, language_pair: "de_to_en")
          .flashcard_sets
          .find_or_create_by!(name: "Set 2 – Numbers & Time") { |s| s.position = 1 }

[
  { front: "eins",               back: "one",                      sentence: "Ich habe eins gefunden.",               translation: "I found one.",                         notes: "Cardinal number 1. 'Ein/eine' used before nouns." },
  { front: "zwei",               back: "two",                      sentence: "Ich habe zwei Kinder.",                 translation: "I have two children.",                 notes: "Cardinal 2. 'Beide' = 'both'." },
  { front: "drei",               back: "three",                    sentence: "Das kostet drei Euro.",                 translation: "That costs three euros.",               notes: "Cardinal 3." },
  { front: "vier",               back: "four",                     sentence: "Der Zug fährt um vier Uhr ab.",         translation: "The train departs at four o'clock.",   notes: "Cardinal 4." },
  { front: "fünf",               back: "five",                     sentence: "Wir treffen uns um fünf.",              translation: "We'll meet at five.",                  notes: "Cardinal 5." },
  { front: "zehn",               back: "ten",                      sentence: "Sie ist zehn Jahre alt.",               translation: "She is ten years old.",                notes: "Cardinal 10." },
  { front: "zwanzig",            back: "twenty",                   sentence: "Es sind noch zwanzig Minuten.",         translation: "There are still twenty minutes left.", notes: "Cardinal 20." },
  { front: "hundert",            back: "one hundred",              sentence: "Das kostet hundert Euro.",              translation: "That costs one hundred euros.",         notes: "Cardinal 100. 'Ein hundert' is also used." },
  { front: "heute",              back: "today",                    sentence: "Heute ist Montag.",                     translation: "Today is Monday.",                     notes: "Adverb of time. Refers to the current day." },
  { front: "morgen",             back: "tomorrow",                 sentence: "Morgen gehe ich zum Arzt.",             translation: "Tomorrow I'm going to the doctor.",    notes: "Also means 'morning' (der Morgen)." },
  { front: "gestern",            back: "yesterday",                sentence: "Gestern war ich sehr müde.",            translation: "Yesterday I was very tired.",          notes: "Adverb of time. Always refers to the previous day." },
  { front: "jetzt",              back: "now",                      sentence: "Ich bin jetzt bereit.",                 translation: "I am ready now.",                      notes: "Immediate present time." },
  { front: "die Stunde",         back: "hour",                     sentence: "Die Fahrt dauert eine Stunde.",         translation: "The journey takes one hour.",          notes: "Feminine noun. Pl: die Stunden." },
  { front: "die Minute",         back: "minute",                   sentence: "Warte bitte fünf Minuten.",             translation: "Please wait five minutes.",            notes: "Feminine noun. Pl: die Minuten." },
  { front: "die Uhr",            back: "clock / o'clock",          sentence: "Meine Uhr ist kaputt.",                 translation: "My clock is broken.",                  notes: "Feminine noun. Also means 'o'clock' in time expressions." },
  { front: "Wie spät ist es?",   back: "What time is it?",         sentence: "Entschuldigung, wie spät ist es?",      translation: "Excuse me, what time is it?",          notes: "Common way to ask the time." },
  { front: "Es ist drei Uhr",    back: "It is three o'clock",      sentence: "Es ist genau drei Uhr.",                translation: "It is exactly three o'clock.",         notes: "Stating the time. Add 'Uhr' after the number." },
  { front: "der Montag",         back: "Monday",                   sentence: "Am Montag habe ich Kurs.",              translation: "On Monday I have a class.",            notes: "All days are masculine (der). Pl: die Montage." },
  { front: "der Samstag",        back: "Saturday",                 sentence: "Am Samstag schlafe ich aus.",           translation: "On Saturday I have a lie-in.",         notes: "'Sonnabend' is an alternative in northern Germany." },
  { front: "das Wochenende",     back: "weekend",                  sentence: "Was machst du am Wochenende?",          translation: "What are you doing at the weekend?",   notes: "Neuter noun. Pl: die Wochenenden." },
].each do |c|
  Flashcard.find_or_create_by!(flashcard_set: set, front_text: c[:front]) do |f|
    f.back_text           = c[:back]
    f.example_sentence    = c[:sentence]
    f.translated_sentence = c[:translation]
    f.grammar_notes       = c[:notes]
    f.source_language     = "german"
    f.target_language     = "english"
  end
end
