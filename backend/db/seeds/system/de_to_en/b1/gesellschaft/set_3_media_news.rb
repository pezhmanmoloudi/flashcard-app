set = Deck.find_by!(name: "Gesellschaft", is_system: true, language_pair: "de_to_en")
          .flashcard_sets
          .find_or_create_by!(name: "Set 3 – Media & News") { |s| s.position = 2 }

[
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
