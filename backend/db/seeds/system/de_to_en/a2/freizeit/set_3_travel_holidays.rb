set = Deck.find_by!(name: "Freizeit", is_system: true, language_pair: "de_to_en")
          .flashcard_sets
          .find_or_create_by!(name: "Set 3 – Travel & Holidays") { |s| s.position = 2 }

[
  { front: "die Reise",        back: "trip / journey",     sentence: "Die Reise hat zwei Wochen gedauert.",    translation: "The trip lasted two weeks.",            notes: "Feminine noun. Pl: die Reisen." },
  { front: "der Urlaub",       back: "holiday / vacation",  sentence: "Im Sommer machen wir Urlaub.",          translation: "We're going on holiday in summer.",    notes: "Masculine noun. Pl: die Urlaube." },
  { front: "der Flughafen",    back: "airport",            sentence: "Wir sind am Flughafen angekommen.",      translation: "We arrived at the airport.",            notes: "Masculine noun. Pl: die Flughäfen." },
  { front: "das Flugzeug",     back: "aeroplane",          sentence: "Das Flugzeug startet in einer Stunde.",  translation: "The plane takes off in an hour.",       notes: "Neuter noun. Pl: die Flugzeuge." },
  { front: "der Koffer",       back: "suitcase",           sentence: "Ich habe meinen Koffer gepackt.",        translation: "I've packed my suitcase.",              notes: "Masculine noun. Pl: die Koffer." },
  { front: "das Ticket",       back: "ticket",             sentence: "Hast du das Ticket gebucht?",            translation: "Have you booked the ticket?",           notes: "Neuter noun. Pl: die Tickets." },
  { front: "buchen",           back: "to book",            sentence: "Wir haben das Hotel online gebucht.",    translation: "We booked the hotel online.",           notes: "Regular verb. buche / buchst / bucht." },
  { front: "die Unterkunft",   back: "accommodation",      sentence: "Wir suchen eine günstige Unterkunft.",   translation: "We're looking for affordable accommodation.", notes: "Feminine noun. Pl: die Unterkünfte." },
  { front: "der Strand",       back: "beach",              sentence: "Wir verbringen den Tag am Strand.",      translation: "We're spending the day at the beach.",  notes: "Masculine noun. Pl: die Strände." },
  { front: "das Meer",         back: "sea / ocean",        sentence: "Das Meer ist heute sehr ruhig.",         translation: "The sea is very calm today.",           notes: "Neuter noun. Pl: die Meere." },
  { front: "die Sehenswürdigkeit", back: "sight / attraction", sentence: "Wien hat viele Sehenswürdigkeiten.", translation: "Vienna has many sights.",              notes: "Feminine noun. Pl: die Sehenswürdigkeiten." },
  { front: "die Kamera",       back: "camera",             sentence: "Vergiss nicht die Kamera!",              translation: "Don't forget the camera!",              notes: "Feminine noun. Pl: die Kameras." },
  { front: "die Landkarte",    back: "map",                sentence: "Haben Sie eine Landkarte der Stadt?",    translation: "Do you have a map of the city?",        notes: "Feminine noun. Pl: die Landkarten." },
  { front: "der Reisepass",    back: "passport",           sentence: "Vergiss deinen Reisepass nicht.",        translation: "Don't forget your passport.",           notes: "Masculine noun. Pl: die Reisepässe." },
  { front: "das Visum",        back: "visa",               sentence: "Für die Reise brauche ich ein Visum.",   translation: "I need a visa for the trip.",           notes: "Neuter noun. Pl: die Visa / Visen." },
  { front: "abfliegen",        back: "to depart / to fly off", sentence: "Das Flugzeug fliegt um 10 Uhr ab.", translation: "The plane departs at 10 o'clock.",      notes: "Separable verb. fliege ab / fliegt ab." },
  { front: "ankommen",         back: "to arrive",          sentence: "Wir kommen morgen früh an.",             translation: "We arrive early tomorrow.",             notes: "Separable verb. komme an / kommt an." },
  { front: "die Touristeninformation", back: "tourist information", sentence: "Die Touristeninformation ist am Marktplatz.", translation: "The tourist information is in the market square.", notes: "Feminine noun. Often shortened to 'Tourist-Info'." },
  { front: "die Währung",      back: "currency",           sentence: "Welche Währung benutzt man hier?",       translation: "What currency is used here?",           notes: "Feminine noun. Pl: die Währungen." },
  { front: "der Aufenthalt",   back: "stay / visit",       sentence: "Wir wünschen Ihnen einen schönen Aufenthalt.", translation: "We wish you a pleasant stay.",    notes: "Masculine noun. Pl: die Aufenthalte." },
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
