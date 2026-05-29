set = Deck.find_by!(name: "Unterwegs", is_system: true, language_pair: "de_to_en")
          .flashcard_sets
          .find_or_create_by!(name: "Set 1 – Transport & Directions") { |s| s.position = 0 }

[
  { front: "das Auto",        back: "car",                sentence: "Das Auto ist kaputt.",                  translation: "The car is broken.",                   notes: "Neuter noun. Pl: die Autos." },
  { front: "der Bus",         back: "bus",                sentence: "Der Bus kommt in fünf Minuten.",        translation: "The bus comes in five minutes.",        notes: "Masculine noun. Pl: die Busse." },
  { front: "die U-Bahn",      back: "underground / metro", sentence: "Ich nehme jeden Tag die U-Bahn.",     translation: "I take the underground every day.",    notes: "Feminine noun. Pl: die U-Bahnen. Short for Untergrundbahn." },
  { front: "der Zug",         back: "train",              sentence: "Der Zug hat Verspätung.",               translation: "The train is delayed.",                notes: "Masculine noun. Pl: die Züge." },
  { front: "das Flugzeug",    back: "plane / aeroplane",  sentence: "Das Flugzeug landet in einer Stunde.",  translation: "The plane lands in one hour.",          notes: "Neuter noun. Pl: die Flugzeuge." },
  { front: "das Fahrrad",     back: "bicycle / bike",     sentence: "Ich fahre mit dem Fahrrad zur Arbeit.", translation: "I cycle to work.",                     notes: "Neuter noun. Pl: die Fahrräder." },
  { front: "der Bahnhof",     back: "train station",      sentence: "Wo ist der nächste Bahnhof?",           translation: "Where is the nearest train station?",  notes: "Masculine noun. Pl: die Bahnhöfe." },
  { front: "der Flughafen",   back: "airport",            sentence: "Der Flughafen ist sehr weit.",          translation: "The airport is very far.",              notes: "Masculine noun. Pl: die Flughäfen." },
  { front: "die Haltestelle", back: "bus / tram stop",    sentence: "Die Haltestelle ist gleich um die Ecke.", translation: "The stop is just around the corner.", notes: "Feminine noun. Pl: die Haltestellen." },
  { front: "links",           back: "left",               sentence: "Biegen Sie links ab.",                  translation: "Turn left.",                           notes: "Adverb/adjective. Direction. 'Nach links' = to the left." },
  { front: "rechts",          back: "right",              sentence: "Das Hotel ist rechts.",                 translation: "The hotel is on the right.",            notes: "Adverb/adjective. Direction. 'Nach rechts' = to the right." },
  { front: "geradeaus",       back: "straight ahead",     sentence: "Gehen Sie immer geradeaus.",            translation: "Keep going straight ahead.",            notes: "Adverb. Means straight ahead." },
  { front: "die Straße",      back: "street / road",      sentence: "Ich wohne in der Hauptstraße.",         translation: "I live on the main street.",            notes: "Feminine noun. Pl: die Straßen." },
  { front: "die Kreuzung",    back: "crossroads / junction", sentence: "An der Kreuzung rechts abbiegen.",  translation: "Turn right at the crossroads.",         notes: "Feminine noun. Pl: die Kreuzungen." },
  { front: "nah",             back: "near / close",       sentence: "Der Supermarkt ist nicht weit, er ist nah.", translation: "The supermarket isn't far, it's near.", notes: "Adjective. Opposite: weit/fern (far)." },
  { front: "weit",            back: "far",                sentence: "Der Flughafen ist weit vom Zentrum.",   translation: "The airport is far from the centre.",  notes: "Adjective. Opposite: nah (close)." },
  { front: "fahren",          back: "to drive / to travel", sentence: "Ich fahre mit dem Bus.",             translation: "I travel by bus.",                     notes: "Strong verb. fahre / fährst / fährt. To drive/travel." },
  { front: "gehen",           back: "to go / to walk",    sentence: "Ich gehe zu Fuß.",                      translation: "I'm walking.",                         notes: "Irregular verb. gehe / gehst / geht." },
  { front: "aussteigen",      back: "to get off",         sentence: "Wir steigen hier aus.",                 translation: "We're getting off here.",               notes: "Separable verb. steige aus / steigst aus." },
  { front: "einsteigen",      back: "to get on / board",  sentence: "Bitte schnell einsteigen!",             translation: "Please board quickly!",                notes: "Separable verb. steige ein / steigst ein." },
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
