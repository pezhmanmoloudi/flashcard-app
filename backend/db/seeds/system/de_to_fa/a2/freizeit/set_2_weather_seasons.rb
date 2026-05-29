set = Deck.find_by!(name: "Freizeit", is_system: true, language_pair: "de_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 2 – Weather & Seasons") { |s| s.position = 1 }

[
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
