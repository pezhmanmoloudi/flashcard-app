set = Deck.find_by!(name: "Freizeit", is_system: true, language_pair: "de_to_en")
          .flashcard_sets
          .find_or_create_by!(name: "Set 2 – Weather & Seasons") { |s| s.position = 1 }

[
  { front: "das Wetter",      back: "weather",            sentence: "Wie ist das Wetter heute?",              translation: "What is the weather like today?",       notes: "Neuter noun. No plural in common use." },
  { front: "die Jahreszeit",  back: "season",             sentence: "Was ist deine Lieblingsjahreszeit?",     translation: "What is your favourite season?",        notes: "Feminine noun. Pl: die Jahreszeiten." },
  { front: "der Frühling",    back: "spring",             sentence: "Im Frühling blühen die Blumen.",         translation: "In spring the flowers bloom.",          notes: "Masculine noun. Pl: die Frühlinge." },
  { front: "der Sommer",      back: "summer",             sentence: "Im Sommer ist es sehr heiß.",            translation: "In summer it is very hot.",             notes: "Masculine noun. Pl: die Sommer." },
  { front: "der Herbst",      back: "autumn / fall",      sentence: "Im Herbst fallen die Blätter.",          translation: "In autumn the leaves fall.",            notes: "Masculine noun. Pl: die Herbste." },
  { front: "der Winter",      back: "winter",             sentence: "Im Winter schneit es oft.",              translation: "In winter it often snows.",             notes: "Masculine noun. Pl: die Winter." },
  { front: "die Sonne",       back: "sun",                sentence: "Die Sonne scheint heute.",               translation: "The sun is shining today.",             notes: "Feminine noun. No plural in this sense." },
  { front: "der Regen",       back: "rain",               sentence: "Es gibt viel Regen im Herbst.",          translation: "There is a lot of rain in autumn.",     notes: "Masculine noun. No plural in common use." },
  { front: "der Schnee",      back: "snow",               sentence: "Die Kinder spielen im Schnee.",          translation: "The children are playing in the snow.", notes: "Masculine noun. No plural in common use." },
  { front: "der Wind",        back: "wind",               sentence: "Heute weht ein starker Wind.",           translation: "A strong wind is blowing today.",       notes: "Masculine noun. Pl: die Winde." },
  { front: "bewölkt",         back: "cloudy / overcast",  sentence: "Es ist heute sehr bewölkt.",             translation: "It is very cloudy today.",              notes: "Adjective. From 'die Wolke' (cloud)." },
  { front: "sonnig",          back: "sunny",              sentence: "Morgen soll es sonnig sein.",            translation: "Tomorrow it should be sunny.",          notes: "Adjective. From 'die Sonne' (sun)." },
  { front: "regnerisch",      back: "rainy",              sentence: "Das Wetter ist sehr regnerisch.",        translation: "The weather is very rainy.",            notes: "Adjective. From 'der Regen' (rain)." },
  { front: "warm",            back: "warm",               sentence: "Im Frühling wird es wärmer.",            translation: "In spring it gets warmer.",             notes: "Adjective. Comparative: wärmer." },
  { front: "kalt",            back: "cold",               sentence: "Im Winter ist es sehr kalt.",            translation: "In winter it is very cold.",            notes: "Adjective. Comparative: kälter." },
  { front: "die Temperatur",  back: "temperature",        sentence: "Die Temperatur liegt bei 20 Grad.",      translation: "The temperature is 20 degrees.",        notes: "Feminine noun. Pl: die Temperaturen." },
  { front: "der Grad",        back: "degree",             sentence: "Es sind 15 Grad draußen.",               translation: "It is 15 degrees outside.",             notes: "Masculine noun. Pl: die Grad (unchanged)." },
  { front: "das Gewitter",    back: "thunderstorm",       sentence: "Heute Nacht kommt ein Gewitter.",        translation: "There's a thunderstorm coming tonight.", notes: "Neuter noun. Pl: die Gewitter." },
  { front: "der Nebel",       back: "fog / mist",         sentence: "Morgens gibt es oft Nebel.",             translation: "There is often fog in the mornings.",   notes: "Masculine noun. No plural in common use." },
  { front: "die Wolke",       back: "cloud",              sentence: "Die Wolken sehen bedrohlich aus.",       translation: "The clouds look threatening.",          notes: "Feminine noun. Pl: die Wolken." },
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
