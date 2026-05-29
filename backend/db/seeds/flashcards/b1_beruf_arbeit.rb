deck = Deck.find_by!(name: "Beruf & Arbeit", is_system: true)

flashcard_data = {
  "Set 1 – Professions" => [
    { front: "der Arzt / die Ärztin",   back: "doctor",       sentence: "Mein Bruder ist Arzt.",                   translation: "My brother is a doctor.",             notes: "Professions in German take no article: 'Er ist Arzt' (no 'ein')." },
    { front: "der Lehrer / die Lehrerin", back: "teacher",    sentence: "Sie ist Lehrerin an einer Grundschule.",  translation: "She is a teacher at a primary school.", notes: "Feminine form adds -in suffix." },
    { front: "der Ingenieur",            back: "engineer",    sentence: "Er arbeitet als Ingenieur bei BMW.",       translation: "He works as an engineer at BMW.",     notes: "Masculine noun. Fem: die Ingenieurin." },
    { front: "der Anwalt / die Anwältin", back: "lawyer",     sentence: "Sie ist Anwältin in einer Kanzlei.",      translation: "She is a lawyer at a law firm.",      notes: "Pl: die Anwälte." },
    { front: "der Koch / die Köchin",    back: "chef / cook", sentence: "Er ist Koch in einem Sternerestaurant.",  translation: "He is a chef at a Michelin-starred restaurant.", notes: "Pl: die Köche." },
    { front: "der Polizist",             back: "police officer", sentence: "Der Polizist hilft den Leuten.",       translation: "The police officer helps people.",    notes: "Masculine noun. Fem: die Polizistin." },
    { front: "der Architekt",            back: "architect",   sentence: "Die Architektin entwirft moderne Häuser.", translation: "The architect designs modern houses.", notes: "Masculine noun. Fem: die Architektin." },
    { front: "der Journalist",           back: "journalist",  sentence: "Sie arbeitet als Journalistin bei der FAZ.", translation: "She works as a journalist at the FAZ.", notes: "Masculine noun. Fem: die Journalistin." },
    { front: "der Krankenpfleger",       back: "nurse",       sentence: "Der Krankenpfleger ist sehr einfühlsam.", translation: "The nurse is very empathetic.",       notes: "Fem: die Krankenpflegerin. Also: die Pflegekraft." },
    { front: "der Buchhalter",           back: "accountant",  sentence: "Unser Buchhalter arbeitet sehr genau.",   translation: "Our accountant works very precisely.", notes: "Fem: die Buchhalterin." },
    { front: "der Informatiker",         back: "computer scientist / IT specialist", sentence: "Sie ist Informatikerin bei einem Start-up.", translation: "She is an IT specialist at a start-up.", notes: "From Informatik (computer science)." },
    { front: "der Elektriker",           back: "electrician", sentence: "Wir brauchen einen Elektriker.",          translation: "We need an electrician.",             notes: "Masculine noun. Fem: die Elektrikerin." },
    { front: "der Kellner",              back: "waiter",      sentence: "Der Kellner bringt gleich die Rechnung.", translation: "The waiter will bring the bill soon.", notes: "Fem: die Kellnerin." },
    { front: "der Verkäufer",            back: "salesperson", sentence: "Der Verkäufer ist sehr hilfsbereit.",     translation: "The salesperson is very helpful.",    notes: "Fem: die Verkäuferin." },
    { front: "der Fahrer",               back: "driver",      sentence: "Der Fahrer kennt die Stadt gut.",         translation: "The driver knows the city well.",     notes: "Fem: die Fahrerin. Can be bus, taxi, truck driver etc." },
    { front: "der Fotograf",             back: "photographer", sentence: "Der Fotograf macht wunderschöne Bilder.", translation: "The photographer takes beautiful pictures.", notes: "Fem: die Fotografin." },
    { front: "der Übersetzer",           back: "translator",  sentence: "Sie arbeitet als Übersetzerin.",          translation: "She works as a translator.",          notes: "Fem: die Übersetzerin. 'Dolmetscher' = interpreter (spoken)." },
    { front: "der Musiker",              back: "musician",    sentence: "Er ist Musiker und gibt Konzerte.",        translation: "He is a musician and gives concerts.", notes: "Fem: die Musikerin." },
    { front: "der Wissenschaftler",      back: "scientist",   sentence: "Die Wissenschaftlerin forscht über Klimawandel.", translation: "The scientist researches climate change.", notes: "Fem: die Wissenschaftlerin." },
    { front: "der Selbstständige",       back: "self-employed person / freelancer", sentence: "Er ist selbstständig und hat seine eigene Firma.", translation: "He is self-employed and has his own company.", notes: "Adjective used as noun. 'Freelancer' is also used." },
  ],

  "Set 2 – Workplace" => [
    { front: "die Stelle",           back: "job / position",       sentence: "Ich habe mich auf eine Stelle beworben.", translation: "I applied for a position.",           notes: "Feminine noun. Pl: die Stellen. More formal than 'Job'." },
    { front: "das Vorstellungsgespräch", back: "job interview",    sentence: "Morgen habe ich ein Vorstellungsgespräch.", translation: "Tomorrow I have a job interview.",  notes: "Neuter noun. Pl: die Vorstellungsgespräche." },
    { front: "der Lebenslauf",        back: "CV / résumé",          sentence: "Bitte schicken Sie Ihren Lebenslauf.",   translation: "Please send your CV.",               notes: "Masculine noun. Pl: die Lebensläufe." },
    { front: "das Gehalt",            back: "salary",               sentence: "Über das Gehalt wird verhandelt.",       translation: "The salary will be negotiated.",     notes: "Neuter noun. Pl: die Gehälter. Monthly salary." },
    { front: "die Überstunden",       back: "overtime",             sentence: "Er macht oft Überstunden.",              translation: "He often works overtime.",           notes: "Always plural. 'Überstunden machen' = to work overtime." },
    { front: "der Urlaub",            back: "holiday / vacation",   sentence: "Ich habe drei Wochen Urlaub.",           translation: "I have three weeks of holiday.",     notes: "Masculine noun. Also annual leave at work." },
    { front: "kündigen",              back: "to quit / resign",     sentence: "Er hat seine Stelle gekündigt.",         translation: "He quit his job.",                   notes: "Regular verb. Also: to fire someone = 'jemanden kündigen'." },
    { front: "einstellen",            back: "to hire",              sentence: "Wir stellen neue Mitarbeiter ein.",      translation: "We are hiring new employees.",       notes: "Separable verb. stelle ein / stellst ein." },
    { front: "der Kollege",           back: "colleague",            sentence: "Meine Kollegen sind sehr nett.",         translation: "My colleagues are very nice.",       notes: "Masculine noun. Pl: die Kollegen. Fem: die Kollegin." },
    { front: "die Besprechung",       back: "meeting",              sentence: "Wir haben heute eine wichtige Besprechung.", translation: "We have an important meeting today.", notes: "Feminine noun. Pl: die Besprechungen. Also: das Meeting." },
    { front: "die Abteilung",         back: "department",           sentence: "Er leitet die Marketing-Abteilung.",     translation: "He heads the marketing department.",  notes: "Feminine noun. Pl: die Abteilungen." },
    { front: "der Chef",              back: "boss / manager",       sentence: "Der Chef ist heute nicht im Büro.",      translation: "The boss is not in the office today.", notes: "Masculine noun. Pl: die Chefs. Fem: die Chefin." },
    { front: "das Büro",              back: "office",               sentence: "Ich arbeite im Büro.",                   translation: "I work in the office.",              notes: "Neuter noun. Pl: die Büros." },
    { front: "das Homeoffice",        back: "working from home",    sentence: "Heute arbeite ich im Homeoffice.",       translation: "Today I'm working from home.",       notes: "Neuter noun. Widely used since 2020." },
    { front: "die Karriere",          back: "career",               sentence: "Sie macht eine tolle Karriere.",         translation: "She is having a great career.",      notes: "Feminine noun. Pl: die Karrieren." },
    { front: "die Ausbildung",        back: "vocational training / apprenticeship", sentence: "Er macht eine Ausbildung zum Koch.", translation: "He is doing an apprenticeship as a chef.", notes: "Feminine noun. A key feature of the German education/work system." },
    { front: "bewerben",              back: "to apply for a job",   sentence: "Ich bewerbe mich um die Stelle.",        translation: "I am applying for the position.",    notes: "Reflexive verb. bewerbe mich / bewirbst dich." },
    { front: "präsentieren",          back: "to present",           sentence: "Sie präsentiert ihre Ergebnisse.",       translation: "She is presenting her results.",     notes: "Regular verb. Common in business settings." },
    { front: "verantwortlich",        back: "responsible",          sentence: "Er ist für das Projekt verantwortlich.", translation: "He is responsible for the project.",  notes: "Adjective. 'Verantwortung übernehmen' = to take responsibility." },
    { front: "effizient",             back: "efficient",            sentence: "Wir müssen effizienter arbeiten.",        translation: "We need to work more efficiently.",  notes: "Adjective. From English/French. Comparative: effizienter." },
  ],

  "Set 3 – Technology" => [
    { front: "das Internet",      back: "the internet",      sentence: "Das Internet verändert die Welt.",       translation: "The internet is changing the world.",    notes: "Neuter noun. 'Im Internet' = on the internet." },
    { front: "das Smartphone",    back: "smartphone",        sentence: "Fast alle haben ein Smartphone.",        translation: "Almost everyone has a smartphone.",     notes: "Neuter noun. Pl: die Smartphones." },
    { front: "der Computer",      back: "computer",          sentence: "Mein Computer ist sehr langsam.",        translation: "My computer is very slow.",              notes: "Masculine noun. Pl: die Computer." },
    { front: "das Passwort",      back: "password",          sentence: "Vergib kein einfaches Passwort.",        translation: "Don't use a simple password.",           notes: "Neuter noun. Pl: die Passwörter." },
    { front: "die App",           back: "app",               sentence: "Es gibt eine App dafür.",               translation: "There's an app for that.",               notes: "Feminine noun. Pl: die Apps. From 'application'." },
    { front: "die E-Mail",        back: "email",             sentence: "Ich schicke dir eine E-Mail.",           translation: "I'll send you an email.",               notes: "Feminine noun. Pl: die E-Mails." },
    { front: "herunterladen",     back: "to download",       sentence: "Du kannst die App kostenlos herunterladen.", translation: "You can download the app for free.",  notes: "Separable verb. lade herunter / lädst herunter." },
    { front: "aktualisieren",     back: "to update",         sentence: "Bitte aktualisiere dein Betriebssystem.", translation: "Please update your operating system.",  notes: "Regular verb. aktualisiere / aktualisierst." },
    { front: "die Software",      back: "software",          sentence: "Die Software ist veraltet.",             translation: "The software is outdated.",              notes: "Feminine noun. Usually uncountable." },
    { front: "der Virus",         back: "virus",             sentence: "Der Computer hat einen Virus.",          translation: "The computer has a virus.",              notes: "Masculine noun. Pl: die Viren." },
    { front: "sichern",           back: "to back up / secure", sentence: "Sichere deine Dateien regelmäßig!",   translation: "Back up your files regularly!",          notes: "Regular verb. Also 'speichern' = to save." },
    { front: "die Datei",         back: "file",              sentence: "Ich kann die Datei nicht öffnen.",       translation: "I can't open the file.",                notes: "Feminine noun. Pl: die Dateien." },
    { front: "der Drucker",       back: "printer",           sentence: "Der Drucker hat kein Papier mehr.",      translation: "The printer is out of paper.",           notes: "Masculine noun. Pl: die Drucker." },
    { front: "drahtlos",          back: "wireless",          sentence: "Das Netzwerk ist drahtlos.",             translation: "The network is wireless.",               notes: "Adjective. 'Kabellos' is also used." },
    { front: "der Bildschirm",    back: "screen / monitor",  sentence: "Der Bildschirm ist zu klein.",           translation: "The screen is too small.",               notes: "Masculine noun. Pl: die Bildschirme." },
    { front: "die künstliche Intelligenz", back: "artificial intelligence", sentence: "KI verändert viele Berufe.", translation: "AI is changing many professions.",    notes: "Feminine noun. Abbreviated: KI. English abbreviation: AI." },
    { front: "das Netzwerk",      back: "network",           sentence: "Das Netzwerk ist langsam heute.",        translation: "The network is slow today.",             notes: "Neuter noun. Pl: die Netzwerke." },
    { front: "verschlüsseln",     back: "to encrypt",        sentence: "Alle Daten werden verschlüsselt.",       translation: "All data is encrypted.",                notes: "Regular verb. verschlüssele / verschlüsselt." },
    { front: "die Daten",         back: "data",              sentence: "Ihre Daten sind bei uns sicher.",        translation: "Your data is safe with us.",             notes: "Always plural. Singular: das Datum (date)." },
    { front: "der Algorithmus",   back: "algorithm",         sentence: "Der Algorithmus sortiert die Ergebnisse.", translation: "The algorithm sorts the results.",    notes: "Masculine noun. Pl: die Algorithmen." },
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

puts "  → Beruf & Arbeit flashcards seeded"
