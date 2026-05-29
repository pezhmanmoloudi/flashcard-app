deck = Deck.find_by!(name: "Gesellschaft", is_system: true)

flashcard_data = {
  "Set 1 – Education" => [
    { front: "die Schule",         back: "school",         sentence: "Die Schule beginnt um 8 Uhr.",           translation: "School starts at 8 o'clock.",          notes: "Feminine noun. Pl: die Schulen." },
    { front: "die Universität",    back: "university",     sentence: "Sie studiert an der Universität Berlin.", translation: "She studies at the University of Berlin.", notes: "Feminine noun. Pl: die Universitäten. Informal: die Uni." },
    { front: "das Studium",        back: "studies / degree programme", sentence: "Das Studium dauert vier Jahre.", translation: "The degree takes four years.",     notes: "Neuter noun. Pl: die Studien." },
    { front: "der Abschluss",      back: "degree / graduation", sentence: "Sie macht bald ihren Abschluss.",   translation: "She's finishing her degree soon.",     notes: "Masculine noun. Pl: die Abschlüsse." },
    { front: "das Stipendium",     back: "scholarship",    sentence: "Er hat ein Stipendium bekommen.",        translation: "He received a scholarship.",            notes: "Neuter noun. Pl: die Stipendien." },
    { front: "die Prüfung",        back: "exam",           sentence: "Morgen schreibe ich eine Prüfung.",      translation: "Tomorrow I'm taking an exam.",         notes: "Feminine noun. Pl: die Prüfungen." },
    { front: "das Fach",           back: "subject",        sentence: "Mein Lieblingsfach ist Mathematik.",     translation: "My favourite subject is Maths.",       notes: "Neuter noun. Pl: die Fächer." },
    { front: "der Unterricht",     back: "lesson / class", sentence: "Der Unterricht beginnt gleich.",         translation: "The lesson is about to start.",        notes: "Masculine noun. Singular only." },
    { front: "die Hausaufgaben",   back: "homework",       sentence: "Hast du deine Hausaufgaben gemacht?",    translation: "Have you done your homework?",         notes: "Always plural. Singular: die Hausaufgabe." },
    { front: "lernen",             back: "to learn / to study", sentence: "Ich lerne für die Prüfung.",        translation: "I'm studying for the exam.",           notes: "Regular verb. 'Lernen' = to learn/study. 'Studieren' = university." },
    { front: "studieren",          back: "to study (at university)", sentence: "Er studiert Physik in München.", translation: "He studies Physics in Munich.",      notes: "Regular verb. Only used for university-level study." },
    { front: "bestehen",           back: "to pass (an exam)", sentence: "Ich habe die Prüfung bestanden!",   translation: "I passed the exam!",                  notes: "Strong verb. Past participle: bestanden." },
    { front: "durchfallen",        back: "to fail (an exam)", sentence: "Sie ist leider durch die Prüfung gefallen.", translation: "Unfortunately, she failed the exam.", notes: "Separable verb. 'Durch die Prüfung fallen'." },
    { front: "die Note",           back: "grade / mark",   sentence: "Ich habe eine gute Note bekommen.",     translation: "I got a good grade.",                  notes: "Feminine noun. Pl: die Noten. German grades: 1 (best) to 6 (worst)." },
    { front: "das Zeugnis",        back: "report card / certificate", sentence: "Ich habe ein gutes Zeugnis.", translation: "I have a good report card.",          notes: "Neuter noun. Pl: die Zeugnisse." },
    { front: "der Lehrer",         back: "teacher",        sentence: "Der Lehrer erklärt den Stoff gut.",     translation: "The teacher explains the subject well.", notes: "Masculine noun. Fem: die Lehrerin." },
    { front: "das Lehrbuch",       back: "textbook",       sentence: "Das Lehrbuch ist sehr teuer.",          translation: "The textbook is very expensive.",      notes: "Neuter noun. Pl: die Lehrbücher." },
    { front: "die Bibliothek",     back: "library",        sentence: "Ich lerne am liebsten in der Bibliothek.", translation: "I prefer studying in the library.",  notes: "Feminine noun. Pl: die Bibliotheken." },
    { front: "der Austausch",      back: "exchange (programme)", sentence: "Sie macht ein Austauschsemester in London.", translation: "She's doing an exchange semester in London.", notes: "Masculine noun. 'Schüleraustausch' = student exchange." },
    { front: "lebenslanges Lernen", back: "lifelong learning", sentence: "Lebenslanges Lernen ist heute wichtig.", translation: "Lifelong learning is important today.", notes: "Fixed phrase. Increasingly valued in modern society." },
  ],

  "Set 2 – Environment" => [
    { front: "die Umwelt",          back: "the environment",       sentence: "Wir müssen die Umwelt schützen.",      translation: "We must protect the environment.",     notes: "Feminine noun. Singular only in this sense." },
    { front: "der Klimawandel",     back: "climate change",        sentence: "Der Klimawandel ist eine globale Herausforderung.", translation: "Climate change is a global challenge.", notes: "Masculine noun. Singular only." },
    { front: "die Nachhaltigkeit",  back: "sustainability",        sentence: "Nachhaltigkeit ist ein wichtiges Thema.", translation: "Sustainability is an important topic.", notes: "Feminine noun. Key concept in modern German politics." },
    { front: "erneuerbare Energien", back: "renewable energies",   sentence: "Deutschland investiert in erneuerbare Energien.", translation: "Germany invests in renewable energies.", notes: "Always plural. 'Erneuerbar' = renewable." },
    { front: "die Solarenergie",    back: "solar energy",          sentence: "Solarenergie wird immer günstiger.",    translation: "Solar energy is becoming cheaper.",    notes: "Feminine noun. Solar panels: die Solarpanele." },
    { front: "die Windenergie",     back: "wind energy",           sentence: "Windenergie ist in Norddeutschland weit verbreitet.", translation: "Wind energy is widespread in northern Germany.", notes: "Feminine noun." },
    { front: "recyceln",            back: "to recycle",            sentence: "In Deutschland recycelt man sehr viel.", translation: "In Germany, people recycle a lot.",    notes: "Regular verb. Germany has a highly developed recycling system." },
    { front: "der Müll",            back: "waste / garbage",       sentence: "Bitte wirf den Müll in den richtigen Behälter!", translation: "Please put the rubbish in the right bin!", notes: "Masculine noun. Germany has strict waste separation rules." },
    { front: "die Emissionen",      back: "emissions",             sentence: "Wir müssen die CO₂-Emissionen reduzieren.", translation: "We need to reduce CO₂ emissions.",   notes: "Plural. Singular: die Emission." },
    { front: "der Treibhauseffekt", back: "the greenhouse effect", sentence: "Der Treibhauseffekt erwärmt die Erde.",  translation: "The greenhouse effect warms the Earth.", notes: "Masculine noun. 'Treibhausgas' = greenhouse gas." },
    { front: "die Abholzung",       back: "deforestation",         sentence: "Die Abholzung des Regenwaldes ist ein Problem.", translation: "The deforestation of the rainforest is a problem.", notes: "Feminine noun. From 'abholzen' (to clear-cut)." },
    { front: "der Artenschutz",     back: "species protection",    sentence: "Der Artenschutz ist wichtig.",          translation: "Species protection is important.",     notes: "Masculine noun. 'Artenschutz' = protection of species." },
    { front: "die Dürre",           back: "drought",               sentence: "Dürren werden häufiger durch den Klimawandel.", translation: "Droughts are becoming more frequent due to climate change.", notes: "Feminine noun. Pl: die Dürren." },
    { front: "die Überschwemmung",  back: "flood",                 sentence: "Die Überschwemmung hat viele Häuser beschädigt.", translation: "The flood damaged many houses.",  notes: "Feminine noun. Pl: die Überschwemmungen." },
    { front: "das Elektroauto",     back: "electric car",          sentence: "Immer mehr Leute fahren Elektroauto.",  translation: "More and more people drive electric cars.", notes: "Neuter noun. Pl: die Elektroautos." },
    { front: "umweltfreundlich",    back: "environmentally friendly", sentence: "Fahrradfahren ist umweltfreundlich.", translation: "Cycling is environmentally friendly.", notes: "Adjective. Compound: Umwelt + freundlich." },
    { front: "schützen",            back: "to protect",            sentence: "Wir müssen die Natur schützen.",        translation: "We must protect nature.",              notes: "Regular verb. schütze / schützt." },
    { front: "verbrauchen",         back: "to consume / use up",   sentence: "Wir verbrauchen zu viel Energie.",      translation: "We consume too much energy.",          notes: "Regular verb. 'Der Verbrauch' = consumption." },
    { front: "das Bewusstsein",     back: "awareness / consciousness", sentence: "Das Umweltbewusstsein wächst.",     translation: "Environmental awareness is growing.",  notes: "Neuter noun. 'Umweltbewusstsein' = environmental awareness." },
    { front: "der Fußabdruck",      back: "footprint",             sentence: "Wie groß ist dein CO₂-Fußabdruck?",    translation: "How big is your carbon footprint?",    notes: "Masculine noun. 'Der ökologische Fußabdruck' = ecological footprint." },
  ],

  "Set 3 – Media & News" => [
    { front: "die Nachrichten",    back: "the news",         sentence: "Ich schaue jeden Abend die Nachrichten.",  translation: "I watch the news every evening.",      notes: "Always plural. Singular: die Nachricht (a piece of news)." },
    { front: "die Zeitung",        back: "newspaper",        sentence: "Er liest jeden Morgen die Zeitung.",       translation: "He reads the newspaper every morning.", notes: "Feminine noun. Pl: die Zeitungen." },
    { front: "die Zeitschrift",    back: "magazine",         sentence: "Diese Zeitschrift erscheint monatlich.",   translation: "This magazine is published monthly.",  notes: "Feminine noun. Pl: die Zeitschriften." },
    { front: "das Radio",          back: "radio",            sentence: "Im Auto höre ich immer Radio.",            translation: "In the car, I always listen to the radio.", notes: "Neuter noun. 'Radio hören' = to listen to the radio." },
    { front: "das Fernsehen",      back: "television",       sentence: "Er verbringt zu viel Zeit vor dem Fernsehen.", translation: "He spends too much time in front of the TV.", notes: "Neuter noun. 'Fernseher' = the TV set." },
    { front: "die sozialen Medien", back: "social media",   sentence: "Soziale Medien haben unsere Kommunikation verändert.", translation: "Social media has changed our communication.", notes: "Plural. 'Social Media' is also widely used in German." },
    { front: "der Journalist",     back: "journalist",       sentence: "Journalisten berichten über aktuelle Ereignisse.", translation: "Journalists report on current events.", notes: "Masculine noun. Fem: die Journalistin." },
    { front: "die Meinungsfreiheit", back: "freedom of speech / opinion", sentence: "Meinungsfreiheit ist ein Grundrecht.", translation: "Freedom of speech is a fundamental right.", notes: "Feminine noun. One of Germany's constitutional rights." },
    { front: "berichten",          back: "to report",        sentence: "Der Sender berichtet live vom Ort.",       translation: "The broadcaster reports live from the scene.", notes: "Regular verb. berichte / berichtest / berichtet." },
    { front: "die Schlagzeile",    back: "headline",         sentence: "Die Schlagzeile ist sehr provokant.",      translation: "The headline is very provocative.",    notes: "Feminine noun. Pl: die Schlagzeilen." },
    { front: "die Werbung",        back: "advertising",      sentence: "Es gibt zu viel Werbung im Internet.",     translation: "There is too much advertising on the internet.", notes: "Feminine noun. Usually uncountable." },
    { front: "die Sendung",        back: "programme / broadcast", sentence: "Die Sendung beginnt um 20 Uhr.",    translation: "The programme starts at 8 pm.",        notes: "Feminine noun. Pl: die Sendungen." },
    { front: "die Debatte",        back: "debate",           sentence: "Es gibt eine öffentliche Debatte darüber.", translation: "There is a public debate about it.",  notes: "Feminine noun. Pl: die Debatten." },
    { front: "die Zensur",         back: "censorship",       sentence: "Pressefreiheit bedeutet keine Zensur.",    translation: "Press freedom means no censorship.",   notes: "Feminine noun. 'Die Pressefreiheit' = freedom of the press." },
    { front: "der Einfluss",       back: "influence",        sentence: "Die Medien haben großen Einfluss.",        translation: "The media has great influence.",       notes: "Masculine noun. Pl: die Einflüsse." },
    { front: "die Fake News",      back: "fake news",        sentence: "Fake News verbreiten sich schnell.",       translation: "Fake news spreads quickly.",            notes: "Borrowed English term. Widely used in German." },
    { front: "glaubwürdig",        back: "credible",         sentence: "Diese Quelle ist nicht glaubwürdig.",      translation: "This source is not credible.",         notes: "Adjective. 'Glaubwürdigkeit' = credibility." },
    { front: "veröffentlichen",    back: "to publish",       sentence: "Das Buch wird nächsten Monat veröffentlicht.", translation: "The book will be published next month.", notes: "Regular verb. veröffentliche / veröffentlichst." },
    { front: "aktuell",            back: "current / up to date", sentence: "Ich brauche aktuelle Informationen.", translation: "I need current/up-to-date information.", notes: "Adjective. False friend: NOT 'actually' (= eigentlich)." },
    { front: "die Quelle",         back: "source",           sentence: "Bitte nenne die Quelle!",                  translation: "Please cite the source!",              notes: "Feminine noun. Pl: die Quellen. Also: spring (water source)." },
  ],
}.freeze

deck.flashcard_sets.each do |set|
  cards = DATA[set.name]
  next unless cards

  cards.each do |c|
    Flashcard.find_or_create_by!(flashcard_set: set, front_text: c[:front]) do |f|
      f.back_text           = c[:back]
      f.example_sentence    = c[:sentence]
      f.translated_sentence = c[:translation]
      f.grammar_notes       = c[:notes]
      f.source_language     = "german"
      f.target_language     = "english"
    end
  end
end

puts "  → Gesellschaft flashcards seeded"
