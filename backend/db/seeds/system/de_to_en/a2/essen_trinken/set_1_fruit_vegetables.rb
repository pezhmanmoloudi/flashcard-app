set = Deck.find_by!(name: "Essen & Trinken", is_system: true, language_pair: "de_to_en")
          .flashcard_sets
          .find_or_create_by!(name: "Set 1 – Fruit & Vegetables") { |s| s.position = 0 }

[
  { front: "der Apfel",     back: "apple",           sentence: "Ein Apfel am Tag hält den Arzt fern.",     translation: "An apple a day keeps the doctor away.",  notes: "Masculine noun. Pl: die Äpfel." },
  { front: "die Banane",    back: "banana",           sentence: "Die Banane ist überreif.",                 translation: "The banana is overripe.",                 notes: "Feminine noun. Pl: die Bananen." },
  { front: "die Orange",    back: "orange",           sentence: "Ich mag frisch gepressten Orangensaft.",   translation: "I like freshly squeezed orange juice.",  notes: "Feminine noun. Pl: die Orangen." },
  { front: "die Erdbeere",  back: "strawberry",       sentence: "Im Sommer esse ich gerne Erdbeeren.",      translation: "I love eating strawberries in summer.",  notes: "Feminine noun. Pl: die Erdbeeren." },
  { front: "die Traube",    back: "grape",            sentence: "Diese Trauben sind süß.",                  translation: "These grapes are sweet.",                 notes: "Feminine noun. Pl: die Trauben." },
  { front: "die Tomate",    back: "tomato",           sentence: "Tomaten sind eigentlich ein Obst.",        translation: "Tomatoes are actually a fruit.",          notes: "Feminine noun. Pl: die Tomaten." },
  { front: "die Kartoffel", back: "potato",           sentence: "Deutschland liebt Kartoffeln.",            translation: "Germany loves potatoes.",                 notes: "Feminine noun. Pl: die Kartoffeln." },
  { front: "die Karotte",   back: "carrot",           sentence: "Karotten sind gut für die Augen.",         translation: "Carrots are good for the eyes.",          notes: "Feminine noun. Pl: die Karotten. Also: die Möhre." },
  { front: "die Zwiebel",   back: "onion",            sentence: "Die Zwiebel bringt mich zum Weinen.",      translation: "The onion makes me cry.",                 notes: "Feminine noun. Pl: die Zwiebeln." },
  { front: "der Knoblauch", back: "garlic",           sentence: "Knoblauch gibt dem Essen viel Geschmack.", translation: "Garlic gives food a lot of flavour.",    notes: "Masculine noun. No plural in common use." },
  { front: "der Salat",     back: "salad / lettuce",  sentence: "Ich esse jeden Tag Salat.",                translation: "I eat salad every day.",                  notes: "Masculine noun. Pl: die Salate. Can mean salad or lettuce." },
  { front: "die Gurke",     back: "cucumber",         sentence: "Eine Gurke ist kühlend im Sommer.",        translation: "A cucumber is refreshing in summer.",    notes: "Feminine noun. Pl: die Gurken." },
  { front: "der Paprika",   back: "pepper (bell pepper)", sentence: "Roter Paprika ist süßer als grüner.", translation: "Red pepper is sweeter than green.",       notes: "Masculine noun. Pl: die Paprika. Can be any colour." },
  { front: "der Brokkoli",  back: "broccoli",         sentence: "Brokkoli ist sehr gesund.",                translation: "Broccoli is very healthy.",               notes: "Masculine noun. No plural in common use." },
  { front: "der Spinat",    back: "spinach",          sentence: "Popeye isst viel Spinat.",                 translation: "Popeye eats a lot of spinach.",           notes: "Masculine noun. No plural in common use." },
  { front: "die Zitrone",   back: "lemon",            sentence: "Ich mag Tee mit Zitrone.",                 translation: "I like tea with lemon.",                  notes: "Feminine noun. Pl: die Zitronen." },
  { front: "die Birne",     back: "pear",             sentence: "Die Birne ist reif.",                      translation: "The pear is ripe.",                       notes: "Feminine noun. Pl: die Birnen." },
  { front: "der Pfirsich",  back: "peach",            sentence: "Im Sommer esse ich gerne Pfirsiche.",      translation: "I love eating peaches in summer.",       notes: "Masculine noun. Pl: die Pfirsiche." },
  { front: "frisch",        back: "fresh",            sentence: "Das Gemüse ist frisch vom Markt.",         translation: "The vegetables are fresh from the market.", notes: "Adjective. Opposite: alt/abgestanden (stale)." },
  { front: "reif",          back: "ripe",             sentence: "Ist die Banane schon reif?",               translation: "Is the banana ripe yet?",                 notes: "Adjective. Opposite: unreif (unripe)." },
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
