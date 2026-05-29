set = Deck.find_by!(name: "Freizeit", is_system: true, language_pair: "de_to_en")
          .flashcard_sets
          .find_or_create_by!(name: "Set 1 – Hobbies & Sports") { |s| s.position = 0 }

[
  { front: "das Hobby",       back: "hobby",              sentence: "Was ist dein Hobby?",                    translation: "What is your hobby?",                  notes: "Neuter noun. Pl: die Hobbys." },
  { front: "der Sport",       back: "sport / exercise",   sentence: "Sport ist gesund.",                      translation: "Sport is healthy.",                    notes: "Masculine noun. Pl: die Sportarten (types of sport)." },
  { front: "spielen",         back: "to play",            sentence: "Ich spiele gerne Fußball.",              translation: "I like playing football.",             notes: "Regular verb. spiele / spielst / spielt." },
  { front: "schwimmen",       back: "to swim",            sentence: "Im Sommer schwimme ich jeden Tag.",      translation: "I swim every day in summer.",          notes: "Strong verb. schwimme / schwimmst / schwimmt." },
  { front: "laufen",          back: "to run / to walk",   sentence: "Ich laufe jeden Morgen im Park.",        translation: "I run in the park every morning.",     notes: "Strong verb. laufe / läufst / läuft." },
  { front: "Fahrrad fahren",  back: "to cycle",           sentence: "Ich fahre gerne Fahrrad.",               translation: "I like cycling.",                      notes: "Separable phrase. Fahrrad = bicycle." },
  { front: "der Fußball",     back: "football / soccer",  sentence: "Fußball ist der beliebteste Sport.",     translation: "Football is the most popular sport.",  notes: "Masculine noun. Pl: die Fußbälle." },
  { front: "das Tennis",      back: "tennis",             sentence: "Spielst du Tennis?",                     translation: "Do you play tennis?",                  notes: "Neuter noun. No plural." },
  { front: "das Schwimmbad",  back: "swimming pool",      sentence: "Wir gehen ins Schwimmbad.",              translation: "We're going to the swimming pool.",    notes: "Neuter noun. Pl: die Schwimmbäder." },
  { front: "das Fitnessstudio", back: "gym / fitness studio", sentence: "Ich gehe dreimal pro Woche ins Fitnessstudio.", translation: "I go to the gym three times a week.", notes: "Neuter noun. Pl: die Fitnessstudios." },
  { front: "lesen",           back: "to read",            sentence: "Ich lese gerne Bücher.",                 translation: "I like reading books.",                notes: "Strong verb. lese / liest / liest." },
  { front: "kochen",          back: "to cook",            sentence: "Kochen ist mein liebstes Hobby.",        translation: "Cooking is my favourite hobby.",        notes: "Regular verb. kochen here as hobby." },
  { front: "malen",           back: "to paint / to draw", sentence: "Meine Schwester malt sehr gerne.",       translation: "My sister loves painting.",             notes: "Regular verb. male / malst / malt." },
  { front: "Musik hören",     back: "to listen to music", sentence: "Abends höre ich gerne Musik.",          translation: "I like listening to music in the evenings.", notes: "Phrase. 'hören' = to hear/listen." },
  { front: "tanzen",          back: "to dance",           sentence: "Wir gehen am Wochenende tanzen.",        translation: "We go dancing at the weekend.",         notes: "Regular verb. tanze / tanzt." },
  { front: "fotografieren",   back: "to photograph",      sentence: "Er fotografiert gerne die Natur.",       translation: "He likes photographing nature.",        notes: "Regular verb. fotografiere / fotografiert." },
  { front: "reisen",          back: "to travel",          sentence: "In meiner Freizeit reise ich gerne.",    translation: "I like to travel in my free time.",     notes: "Regular verb. reise / reist." },
  { front: "die Mannschaft",  back: "team",               sentence: "Unsere Mannschaft hat gewonnen.",        translation: "Our team won.",                         notes: "Feminine noun. Pl: die Mannschaften." },
  { front: "gewinnen",        back: "to win",             sentence: "Wir haben das Spiel gewonnen.",          translation: "We won the game.",                      notes: "Strong verb. gewinne / gewinnst / gewinnt." },
  { front: "verlieren",       back: "to lose",            sentence: "Manchmal verliert man.",                 translation: "Sometimes you lose.",                   notes: "Strong verb. verliere / verlierst / verliert." },
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
