set = Deck.find_by!(name: "Alltag", is_system: true, language_pair: "de_to_en")
          .flashcard_sets
          .find_or_create_by!(name: "Set 2 – Food Basics") { |s| s.position = 1 }

[
  { front: "das Brot",    back: "bread",       sentence: "Ich esse morgens Brot mit Butter.",    translation: "In the mornings I eat bread with butter.", notes: "Neuter noun. Pl: die Brote. Central part of German breakfast." },
  { front: "die Butter",  back: "butter",      sentence: "Gib mir bitte die Butter.",            translation: "Please pass me the butter.",               notes: "Feminine noun. No plural in common use." },
  { front: "das Ei",      back: "egg",         sentence: "Ich esse jeden Tag ein Ei.",           translation: "I eat an egg every day.",                  notes: "Neuter noun. Pl: die Eier." },
  { front: "die Milch",   back: "milk",        sentence: "Die Milch ist kalt.",                  translation: "The milk is cold.",                        notes: "Feminine noun. No plural in common use." },
  { front: "der Käse",    back: "cheese",      sentence: "Deutschland hat viele Käsesorten.",    translation: "Germany has many types of cheese.",        notes: "Masculine noun. Pl: die Käsesorten (types of cheese)." },
  { front: "das Fleisch", back: "meat",        sentence: "Ich esse kein Fleisch.",               translation: "I don't eat meat.",                        notes: "Neuter noun. No plural. 'Kein Fleisch' = vegetarian." },
  { front: "der Fisch",   back: "fish",        sentence: "Der Fisch schmeckt gut.",              translation: "The fish tastes good.",                    notes: "Masculine noun. Pl: die Fische." },
  { front: "das Gemüse",  back: "vegetables",  sentence: "Iss mehr Gemüse!",                     translation: "Eat more vegetables!",                     notes: "Neuter noun. Usually singular (collective noun)." },
  { front: "das Obst",    back: "fruit",       sentence: "Obst ist gesund.",                     translation: "Fruit is healthy.",                        notes: "Neuter noun. Usually singular (collective noun)." },
  { front: "das Wasser",  back: "water",       sentence: "Ich trinke viel Wasser.",              translation: "I drink a lot of water.",                  notes: "Neuter noun. 'Stilles Wasser' = still water." },
  { front: "der Kaffee",  back: "coffee",      sentence: "Jeden Morgen trinke ich Kaffee.",      translation: "Every morning I drink coffee.",            notes: "Masculine noun. Pl: die Kaffees (cups of coffee)." },
  { front: "der Tee",     back: "tea",         sentence: "Magst du Tee mit Milch?",              translation: "Do you like tea with milk?",               notes: "Masculine noun. Pl: die Tees." },
  { front: "der Saft",    back: "juice",       sentence: "Ich trinke gern Orangensaft.",         translation: "I like drinking orange juice.",            notes: "Masculine noun. Pl: die Säfte." },
  { front: "der Zucker",  back: "sugar",       sentence: "Nimmst du Zucker in den Kaffee?",      translation: "Do you take sugar in your coffee?",        notes: "Masculine noun. No plural in common use." },
  { front: "das Salz",    back: "salt",        sentence: "Das Essen braucht etwas Salz.",        translation: "The food needs a little salt.",            notes: "Neuter noun. 'Zu salzig' = too salty." },
  { front: "essen",       back: "to eat",      sentence: "Was möchtest du essen?",               translation: "What would you like to eat?",              notes: "Irregular verb. esse / isst / isst. Strong verb." },
  { front: "trinken",     back: "to drink",    sentence: "Er trinkt jeden Abend Tee.",           translation: "He drinks tea every evening.",             notes: "Irregular verb. trinke / trinkst / trinkt." },
  { front: "kochen",      back: "to cook",     sentence: "Ich koche heute Abend.",               translation: "I'm cooking this evening.",                notes: "Regular verb. koche / kochst / kocht." },
  { front: "lecker",      back: "tasty / delicious", sentence: "Das Essen ist sehr lecker.",    translation: "The food is very tasty.",                  notes: "Adjective. Informal but widely used. Formal: köstlich." },
  { front: "hungrig",     back: "hungry",      sentence: "Ich bin hungrig.",                     translation: "I am hungry.",                             notes: "Adjective. Opposite: satt (full). 'Hunger haben' is also common." },
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
