set = Deck.find_by!(name: "Essen & Trinken", is_system: true, language_pair: "de_to_en")
          .flashcard_sets
          .find_or_create_by!(name: "Set 2 – In the Restaurant") { |s| s.position = 1 }

[
  { front: "die Speisekarte", back: "menu",             sentence: "Kann ich bitte die Speisekarte haben?",  translation: "Could I have the menu please?",       notes: "Feminine noun. Pl: die Speisekarten. Also: die Karte." },
  { front: "bestellen",       back: "to order",         sentence: "Ich möchte bestellen.",                  translation: "I would like to order.",              notes: "Regular verb. bestelle / bestellst / bestellt." },
  { front: "die Vorspeise",   back: "starter",          sentence: "Als Vorspeise nehme ich die Suppe.",     translation: "I'll have the soup as a starter.",   notes: "Feminine noun. Pl: die Vorspeisen." },
  { front: "das Hauptgericht", back: "main course",     sentence: "Was ist das Hauptgericht heute?",        translation: "What is the main course today?",     notes: "Neuter noun. Pl: die Hauptgerichte." },
  { front: "die Nachspeise",  back: "dessert",          sentence: "Als Nachspeise möchte ich Eis.",         translation: "I would like ice cream for dessert.", notes: "Feminine noun. Pl: die Nachspeisen. Also: das Dessert." },
  { front: "der Kellner",     back: "waiter",           sentence: "Der Kellner kommt gleich.",              translation: "The waiter is coming right away.",   notes: "Masculine noun. Pl: die Kellner. Fem: die Kellnerin." },
  { front: "die Rechnung",    back: "bill / check",     sentence: "Die Rechnung, bitte!",                   translation: "The bill, please!",                  notes: "Feminine noun. Pl: die Rechnungen." },
  { front: "die Portion",     back: "portion / serving", sentence: "Die Portion ist sehr groß.",           translation: "The portion is very large.",          notes: "Feminine noun. Pl: die Portionen." },
  { front: "das Trinkgeld",   back: "tip / gratuity",   sentence: "Das Trinkgeld ist in Deutschland üblich.", translation: "Tipping is customary in Germany.",  notes: "Neuter noun. No plural. Literally 'drinking money'." },
  { front: "empfehlen",       back: "to recommend",     sentence: "Was können Sie empfehlen?",              translation: "What can you recommend?",            notes: "Strong verb. empfehle / empfiehlst / empfiehlt." },
  { front: "die Suppe",       back: "soup",             sentence: "Heute gibt es Tomatensuppe.",            translation: "Today there is tomato soup.",         notes: "Feminine noun. Pl: die Suppen." },
  { front: "das Schnitzel",   back: "schnitzel",        sentence: "Ein Wiener Schnitzel, bitte.",           translation: "A Wiener schnitzel, please.",         notes: "Neuter noun. Pl: die Schnitzel. Classic German/Austrian dish." },
  { front: "der Braten",      back: "roast (meat)",     sentence: "Der Braten ist heute besonders gut.",    translation: "The roast is particularly good today.", notes: "Masculine noun. Pl: die Braten." },
  { front: "vegetarisch",     back: "vegetarian",       sentence: "Haben Sie etwas Vegetarisches?",         translation: "Do you have anything vegetarian?",   notes: "Adjective. 'Vegan' = without any animal products." },
  { front: "die Allergie",    back: "allergy",          sentence: "Ich habe eine Nussallergie.",            translation: "I have a nut allergy.",               notes: "Feminine noun. Pl: die Allergien." },
  { front: "schmecken",       back: "to taste",         sentence: "Schmeckt das Essen?",                    translation: "Does the food taste good?",           notes: "Regular verb. schmecke / schmeckst / schmeckt." },
  { front: "salzig",          back: "salty",            sentence: "Das Essen ist zu salzig.",               translation: "The food is too salty.",              notes: "Adjective. Opposite: süß (sweet)." },
  { front: "süß",             back: "sweet",            sentence: "Der Kuchen ist sehr süß.",               translation: "The cake is very sweet.",             notes: "Adjective. Also means 'cute' in informal use." },
  { front: "scharf",          back: "spicy / hot",      sentence: "Das Curry ist sehr scharf.",             translation: "The curry is very spicy.",            notes: "Adjective. Means spicy/hot. Also: sharp (knife)." },
  { front: "sauer",           back: "sour",             sentence: "Die Zitrone ist sauer.",                 translation: "The lemon is sour.",                  notes: "Adjective. Also means 'annoyed' in informal speech." },
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
