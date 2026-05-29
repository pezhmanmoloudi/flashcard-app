set = Deck.find_by!(name: "Alltag", is_system: true, language_pair: "de_to_en")
          .flashcard_sets
          .find_or_create_by!(name: "Set 1 – At Home") { |s| s.position = 0 }

[
  { front: "das Haus",        back: "house",          sentence: "Wir haben ein großes Haus.",              translation: "We have a big house.",              notes: "Neuter noun. Pl: die Häuser." },
  { front: "die Wohnung",     back: "flat / apartment", sentence: "Meine Wohnung ist klein aber gemütlich.", translation: "My flat is small but cosy.",        notes: "Feminine noun. Pl: die Wohnungen." },
  { front: "das Zimmer",      back: "room",            sentence: "Das Zimmer hat ein großes Fenster.",      translation: "The room has a large window.",       notes: "Neuter noun. Pl: die Zimmer." },
  { front: "die Küche",       back: "kitchen",         sentence: "Ich koche gerne in der Küche.",           translation: "I love cooking in the kitchen.",     notes: "Feminine noun. Pl: die Küchen." },
  { front: "das Badezimmer",  back: "bathroom",        sentence: "Das Badezimmer ist im ersten Stock.",     translation: "The bathroom is on the first floor.", notes: "Neuter noun. Pl: die Badezimmer. Also: das Bad." },
  { front: "das Schlafzimmer", back: "bedroom",        sentence: "Mein Schlafzimmer ist ruhig.",            translation: "My bedroom is quiet.",               notes: "Neuter noun. Pl: die Schlafzimmer." },
  { front: "das Wohnzimmer",  back: "living room",     sentence: "Wir sitzen im Wohnzimmer.",               translation: "We are sitting in the living room.", notes: "Neuter noun. Pl: die Wohnzimmer." },
  { front: "die Tür",         back: "door",            sentence: "Bitte mach die Tür zu.",                  translation: "Please close the door.",             notes: "Feminine noun. Pl: die Türen." },
  { front: "das Fenster",     back: "window",          sentence: "Das Fenster ist offen.",                  translation: "The window is open.",                notes: "Neuter noun. Pl: die Fenster." },
  { front: "die Treppe",      back: "stairs / staircase", sentence: "Die Treppe ist steil.",               translation: "The stairs are steep.",              notes: "Feminine noun. Pl: die Treppen." },
  { front: "der Tisch",       back: "table",           sentence: "Das Buch liegt auf dem Tisch.",           translation: "The book is on the table.",          notes: "Masculine noun. Pl: die Tische." },
  { front: "der Stuhl",       back: "chair",           sentence: "Setz dich auf den Stuhl!",                translation: "Sit down on the chair!",             notes: "Masculine noun. Pl: die Stühle." },
  { front: "das Bett",        back: "bed",             sentence: "Ich gehe ins Bett.",                      translation: "I'm going to bed.",                  notes: "Neuter noun. Pl: die Betten. 'Ins Bett gehen' = to go to bed." },
  { front: "der Schrank",     back: "wardrobe / cupboard", sentence: "Meine Kleider sind im Schrank.",     translation: "My clothes are in the wardrobe.",    notes: "Masculine noun. Pl: die Schränke." },
  { front: "das Licht",       back: "light",           sentence: "Mach bitte das Licht an!",                translation: "Please turn the light on!",          notes: "Neuter noun. Pl: die Lichter." },
  { front: "der Schlüssel",   back: "key",             sentence: "Ich habe meinen Schlüssel vergessen.",    translation: "I forgot my key.",                   notes: "Masculine noun. Pl: die Schlüssel." },
  { front: "sauber",          back: "clean",           sentence: "Das Haus ist sehr sauber.",               translation: "The house is very clean.",           notes: "Adjective. Opposite: schmutzig (dirty)." },
  { front: "schmutzig",       back: "dirty",           sentence: "Die Küche ist schmutzig.",                translation: "The kitchen is dirty.",              notes: "Adjective. Opposite: sauber (clean)." },
  { front: "wohnen",          back: "to live / to reside", sentence: "Ich wohne in Berlin.",               translation: "I live in Berlin.",                  notes: "Regular verb. wohne / wohnst / wohnt." },
  { front: "putzen",          back: "to clean",        sentence: "Ich putze jeden Samstag die Wohnung.",    translation: "I clean the flat every Saturday.",   notes: "Regular verb. putze / putzt." },
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
