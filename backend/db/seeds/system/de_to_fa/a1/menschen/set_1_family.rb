set = Deck.find_by!(name: "Menschen", is_system: true, language_pair: "de_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 1 – Family") { |s| s.position = 0 }

[
  { front: "die Familie",   back: "خانواده",     sentence: "Meine Familie ist sehr groß.",      translation: "خانواده‌ام خیلی بزرگ است.",      notes: "Feminine noun. Pl: die Familien." },
  { front: "die Mutter",    back: "مادر",        sentence: "Meine Mutter kocht sehr gut.",      translation: "مادرم خیلی خوب آشپزی می‌کند.",  notes: "Feminine noun. Pl: die Mütter. Informal: die Mama." },
  { front: "der Vater",     back: "پدر",         sentence: "Mein Vater arbeitet in einer Bank.", translation: "پدرم در یک بانک کار می‌کند.",   notes: "Masculine noun. Pl: die Väter. Informal: der Papa." },
  { front: "die Eltern",    back: "والدین",      sentence: "Meine Eltern wohnen in München.",   translation: "والدینم در مونیخ زندگی می‌کنند.", notes: "Always plural. Singular form is not used." },
  { front: "das Kind",      back: "بچه / فرزند", sentence: "Das Kind spielt im Garten.",        translation: "بچه در باغ بازی می‌کند.",        notes: "Neuter noun. Pl: die Kinder." },
  { front: "der Bruder",    back: "برادر",       sentence: "Ich habe einen älteren Bruder.",    translation: "یک برادر بزرگتر دارم.",         notes: "Masculine noun. Pl: die Brüder." },
  { front: "die Schwester", back: "خواهر",       sentence: "Meine Schwester studiert Medizin.", translation: "خواهرم پزشکی می‌خواند.",        notes: "Feminine noun. Pl: die Schwestern." },
  { front: "der Großvater", back: "پدربزرگ",     sentence: "Mein Großvater ist 80 Jahre alt.",  translation: "پدربزرگم ۸۰ سال دارد.",         notes: "Masculine noun. Pl: die Großväter. Informal: Opa." },
  { front: "die Großmutter", back: "مادربزرگ",   sentence: "Die Großmutter backt Kuchen.",      translation: "مادربزرگ کیک می‌پزد.",          notes: "Feminine noun. Pl: die Großmütter. Informal: Oma." },
  { front: "der Mann",      back: "مرد / شوهر",  sentence: "Das ist mein Mann.",                translation: "این شوهرم است.",                notes: "Masculine noun. Pl: die Männer. Context-dependent: man/husband." },
  { front: "die Frau",      back: "زن / همسر",   sentence: "Das ist meine Frau.",               translation: "این همسرم است.",                notes: "Feminine noun. Pl: die Frauen. Context: woman/wife." },
  { front: "der Sohn",      back: "پسر",         sentence: "Mein Sohn ist fünf Jahre alt.",     translation: "پسرم پنج سال دارد.",            notes: "Masculine noun. Pl: die Söhne." },
  { front: "die Tochter",   back: "دختر",        sentence: "Meine Tochter lernt gerade Gitarre.", translation: "دخترم الان گیتار یاد می‌گیرد.", notes: "Feminine noun. Pl: die Töchter." },
  { front: "der Onkel",     back: "عمو / دایی",  sentence: "Mein Onkel besucht uns am Sonntag.", translation: "عمویم یکشنبه به ما سر می‌زند.", notes: "Masculine noun. Pl: die Onkel." },
  { front: "die Tante",     back: "عمه / خاله",  sentence: "Meine Tante wohnt in Hamburg.",     translation: "خاله‌ام در هامبورگ زندگی می‌کند.", notes: "Feminine noun. Pl: die Tanten." },
  { front: "der Freund",    back: "دوست (پسر)",  sentence: "Mein Freund heißt Lukas.",          translation: "دوستم اسمش لوکاس است.",         notes: "Masculine noun. Pl: die Freunde. Can mean friend or boyfriend." },
  { front: "die Freundin",  back: "دوست (دختر)", sentence: "Das ist meine beste Freundin.",     translation: "این بهترین دوستم است.",          notes: "Feminine noun. Pl: die Freundinnen. Friend or girlfriend." },
  { front: "alt",           back: "پیر / قدیمی", sentence: "Wie alt bist du?",                  translation: "چند سالته؟",                    notes: "Adjective. 'Wie alt bist du?' = how old are you?" },
  { front: "jung",          back: "جوان",        sentence: "Sie ist noch sehr jung.",           translation: "او هنوز خیلی جوان است.",         notes: "Adjective. Comparative: jünger. Superlative: jüngste." },
  { front: "verheiratet",   back: "متأهل",       sentence: "Sind Sie verheiratet?",             translation: "متأهل هستید؟",                  notes: "Adjective. 'Ledig' = single. 'Geschieden' = divorced." },
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
