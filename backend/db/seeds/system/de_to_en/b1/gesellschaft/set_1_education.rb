set = Deck.find_by!(name: "Gesellschaft", is_system: true)
          .flashcard_sets
          .find_or_create_by!(name: "Set 1 – Education") { |s| s.position = 0 }

[
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
