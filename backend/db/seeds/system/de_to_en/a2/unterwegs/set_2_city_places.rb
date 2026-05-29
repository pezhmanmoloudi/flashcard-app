set = Deck.find_by!(name: "Unterwegs", is_system: true, language_pair: "de_to_en")
          .flashcard_sets
          .find_or_create_by!(name: "Set 2 – City & Places") { |s| s.position = 1 }

[
  { front: "die Stadt",       back: "city / town",        sentence: "Diese Stadt hat viele Museen.",         translation: "This city has many museums.",           notes: "Feminine noun. Pl: die Städte." },
  { front: "das Zentrum",     back: "city centre",        sentence: "Das Hotel liegt im Zentrum.",           translation: "The hotel is in the city centre.",     notes: "Neuter noun. Pl: die Zentren." },
  { front: "der Park",        back: "park",               sentence: "Wir gehen in den Park.",                translation: "We're going to the park.",             notes: "Masculine noun. Pl: die Parks." },
  { front: "das Museum",      back: "museum",             sentence: "Das Museum ist heute geschlossen.",     translation: "The museum is closed today.",          notes: "Neuter noun. Pl: die Museen." },
  { front: "die Kirche",      back: "church",             sentence: "Die Kirche ist sehr alt.",              translation: "The church is very old.",              notes: "Feminine noun. Pl: die Kirchen." },
  { front: "das Rathaus",     back: "town hall",          sentence: "Das Rathaus ist im Stadtzentrum.",      translation: "The town hall is in the city centre.", notes: "Neuter noun. Pl: die Rathäuser." },
  { front: "das Hotel",       back: "hotel",              sentence: "Ich habe ein Zimmer im Hotel.",         translation: "I have a room at the hotel.",          notes: "Neuter noun. Pl: die Hotels." },
  { front: "das Restaurant",  back: "restaurant",         sentence: "Das Restaurant öffnet um 12 Uhr.",      translation: "The restaurant opens at 12 o'clock.", notes: "Neuter noun. Pl: die Restaurants." },
  { front: "der Supermarkt",  back: "supermarket",        sentence: "Ich gehe in den Supermarkt.",           translation: "I'm going to the supermarket.",        notes: "Masculine noun. Pl: die Supermärkte." },
  { front: "die Apotheke",    back: "pharmacy / chemist", sentence: "Die Apotheke ist bis 20 Uhr offen.",    translation: "The pharmacy is open until 8 pm.",    notes: "Feminine noun. Pl: die Apotheken." },
  { front: "das Krankenhaus", back: "hospital",           sentence: "Das Krankenhaus ist in der Nähe.",      translation: "The hospital is nearby.",              notes: "Neuter noun. Pl: die Krankenhäuser." },
  { front: "die Post",        back: "post office",        sentence: "Ich muss zur Post gehen.",              translation: "I need to go to the post office.",    notes: "Feminine noun. Pl: die Posts." },
  { front: "die Bank",        back: "bank",               sentence: "Die Bank öffnet um 9 Uhr.",             translation: "The bank opens at 9 o'clock.",        notes: "Feminine noun. Pl: die Banken." },
  { front: "der Markt",       back: "market",             sentence: "Am Samstag gibt es einen Markt.",       translation: "There's a market on Saturday.",        notes: "Masculine noun. Pl: die Märkte." },
  { front: "die Schule",      back: "school",             sentence: "Die Schule beginnt um 8 Uhr.",          translation: "School starts at 8 o'clock.",          notes: "Feminine noun. Pl: die Schulen." },
  { front: "gegenüber",       back: "opposite / across from", sentence: "Das Café ist gegenüber dem Bahnhof.", translation: "The café is opposite the station.", notes: "Preposition/adverb. Takes dative case." },
  { front: "neben",           back: "next to / beside",   sentence: "Das Kino ist neben dem Hotel.",         translation: "The cinema is next to the hotel.",     notes: "Preposition. Takes dative (location) or accusative (movement)." },
  { front: "zwischen",        back: "between",            sentence: "Das Café ist zwischen Bank und Post.",  translation: "The café is between the bank and post office.", notes: "Preposition. Takes dative (location) or accusative (movement)." },
  { front: "offen",           back: "open",               sentence: "Ist das Geschäft heute offen?",         translation: "Is the shop open today?",              notes: "Adjective. Opposite: geschlossen (closed)." },
  { front: "geschlossen",     back: "closed",             sentence: "Das Museum ist montags geschlossen.",   translation: "The museum is closed on Mondays.",    notes: "Adjective. From 'schließen' (to close)." },
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
