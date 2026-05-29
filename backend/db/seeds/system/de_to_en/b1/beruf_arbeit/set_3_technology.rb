set = Deck.find_by!(name: "Beruf & Arbeit", is_system: true)
          .flashcard_sets
          .find_or_create_by!(name: "Set 3 – Technology") { |s| s.position = 2 }

[
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
