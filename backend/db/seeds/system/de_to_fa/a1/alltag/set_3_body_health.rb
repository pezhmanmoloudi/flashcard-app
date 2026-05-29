set = Deck.find_by!(name: "Alltag", is_system: true)
          .flashcard_sets
          .find_or_create_by!(name: "Set 3 – Body & Health") { |s| s.position = 2 }

[
  { front: "der Kopf",      back: "سر",          sentence: "Mir tut der Kopf weh.",            translation: "سرم درد می‌کند.",               notes: "Masculine noun. Pl: die Köpfe." },
  { front: "das Gesicht",   back: "صورت",        sentence: "Sie hat ein freundliches Gesicht.", translation: "او یک صورت دوستانه دارد.",      notes: "Neuter noun. Pl: die Gesichter." },
  { front: "das Auge",      back: "چشم",         sentence: "Er hat blaue Augen.",              translation: "او چشم آبی دارد.",              notes: "Neuter noun. Pl: die Augen." },
  { front: "die Nase",      back: "بینی",        sentence: "Meine Nase läuft.",                translation: "بینیم آب می‌ریزد.",             notes: "Feminine noun. Pl: die Nasen." },
  { front: "der Mund",      back: "دهان",        sentence: "Mach bitte den Mund auf.",         translation: "لطفاً دهانت را باز کن.",        notes: "Masculine noun. Pl: die Münder." },
  { front: "das Ohr",       back: "گوش",         sentence: "Ich habe Schmerzen im Ohr.",       translation: "گوشم درد می‌کند.",              notes: "Neuter noun. Pl: die Ohren." },
  { front: "der Hals",      back: "گردن / گلو",  sentence: "Mir tut der Hals weh.",            translation: "گلویم درد می‌کند.",             notes: "Masculine noun. Pl: die Hälse." },
  { front: "die Hand",      back: "دست",         sentence: "Gib mir deine Hand.",              translation: "دستت را به من بده.",             notes: "Feminine noun. Pl: die Hände." },
  { front: "der Finger",    back: "انگشت",       sentence: "Ich habe mir den Finger verletzt.", translation: "انگشتم را زخمی کردم.",         notes: "Masculine noun. Pl: die Finger." },
  { front: "der Fuß",       back: "پا",          sentence: "Mein Fuß tut weh.",                translation: "پایم درد می‌کند.",              notes: "Masculine noun. Pl: die Füße." },
  { front: "der Bauch",     back: "شکم",         sentence: "Mir tut der Bauch weh.",           translation: "شکمم درد می‌کند.",              notes: "Masculine noun. Pl: die Bäuche." },
  { front: "der Rücken",    back: "کمر / پشت",   sentence: "Er hat starke Rückenschmerzen.",   translation: "او درد شدید کمر دارد.",         notes: "Masculine noun. Pl: die Rücken." },
  { front: "krank",         back: "مریض",        sentence: "Ich bin krank und bleibe zuhause.",  translation: "مریضم و خانه می‌مانم.",        notes: "Adjective. 'Krank sein' = to be ill." },
  { front: "gesund",        back: "سالم",        sentence: "Sport ist gut für die Gesundheit.", translation: "ورزش برای سلامتی خوب است.",    notes: "Adjective. 'Gesund bleiben' = to stay healthy." },
  { front: "der Schmerz",   back: "درد",         sentence: "Ich habe starke Schmerzen.",       translation: "درد شدیدی دارم.",               notes: "Masculine noun. Pl: die Schmerzen. Common: 'Mir tut … weh'." },
  { front: "das Fieber",    back: "تب",          sentence: "Das Kind hat hohes Fieber.",       translation: "بچه تب بالایی دارد.",           notes: "Neuter noun. No plural. 'Fieber haben' = to have a fever." },
  { front: "der Arzt",      back: "دکتر",        sentence: "Ich muss zum Arzt gehen.",         translation: "باید پیش دکتر بروم.",           notes: "Masculine noun. Pl: die Ärzte. Fem: die Ärztin." },
  { front: "das Krankenhaus", back: "بیمارستان", sentence: "Er liegt im Krankenhaus.",         translation: "او در بیمارستان بستری است.",    notes: "Neuter noun. Pl: die Krankenhäuser." },
  { front: "die Medizin",   back: "دارو / پزشکی", sentence: "Hast du deine Medizin genommen?", translation: "دارویت را خوردی؟",             notes: "Feminine noun. Means both medicine (subject) and medication." },
  { front: "schlafen",      back: "خوابیدن",     sentence: "Ich schlafe acht Stunden.",        translation: "هشت ساعت می‌خوابم.",            notes: "Strong verb. schlafe / schläfst / schläft." },
].each do |c|
  Flashcard.find_or_create_by!(flashcard_set: set, front_text: c[:front]) do |f|
    f.back_text           = c[:back]
    f.example_sentence    = c[:sentence]
    f.translated_sentence = c[:translation]
    f.grammar_notes       = c[:notes]
    f.source_language     = "german"
    f.target_language     = "persian"
  end
end
