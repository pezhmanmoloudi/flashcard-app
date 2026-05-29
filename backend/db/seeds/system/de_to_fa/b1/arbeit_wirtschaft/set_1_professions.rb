set = Deck.find_by!(name: "Arbeit & Wirtschaft", is_system: true, language_pair: "de_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 1 – Berufe") { |s| s.position = 0 }

[
  { front: "der Arzt / die Ärztin",          back: "پزشک",                   sentence: "Mein Arzt hat mir empfohlen, mehr zu schlafen.",         translation: "پزشکم توصیه کرده بیشتر بخوابم.",               notes: "Masculine: der Arzt. Feminine: die Ärztin. Pl: die Ärzte." },
  { front: "der Rechtsanwalt",               back: "وکیل دادگستری",           sentence: "Ich brauche einen guten Rechtsanwalt.",                  translation: "به یک وکیل دادگستری خوب نیاز دارم.",            notes: "Masculine noun. Fem: die Rechtsanwältin. Pl: die Rechtsanwälte." },
  { front: "der Ingenieur",                  back: "مهندس",                  sentence: "Er arbeitet als Ingenieur bei einem Autokonzern.",        translation: "او به‌عنوان مهندس در یک شرکت خودروسازی کار می‌کند.", notes: "Masculine. Fem: die Ingenieurin. Various specialisations: Bauingenieur, etc." },
  { front: "der Lehrer / die Lehrerin",      back: "معلم / آموزگار",          sentence: "Die Lehrerin erklärt die Grammatik sehr gut.",            translation: "معلم دستور زبان را خیلی خوب توضیح می‌دهد.",       notes: "Masculine: der Lehrer. Feminine: die Lehrerin. Pl: die Lehrer." },
  { front: "der Buchhalter",                 back: "حسابدار",                sentence: "Der Buchhalter prüft alle Rechnungen.",                  translation: "حسابدار همه فاکتورها را بررسی می‌کند.",            notes: "Masculine noun. Fem: die Buchhalterin." },
  { front: "der Informatiker",               back: "متخصص فناوری اطلاعات",   sentence: "Als Informatiker verdient man gut.",                     translation: "به‌عنوان متخصص فناوری اطلاعات درآمد خوبی داری.",  notes: "Masculine noun. Fem: die Informatikerin. Related to computer science." },
  { front: "der Journalist / die Journalistin", back: "روزنامه‌نگار",         sentence: "Die Journalistin berichtet aus dem Ausland.",             translation: "روزنامه‌نگار از خارج از کشور گزارش می‌دهد.",       notes: "Pl: die Journalisten. A B1 key profession." },
  { front: "der Architekt",                  back: "معمار",                  sentence: "Der Architekt entwirft moderne Gebäude.",                translation: "معمار ساختمان‌های مدرن طراحی می‌کند.",             notes: "Masculine noun. Fem: die Architektin. Pl: die Architekten." },
  { front: "der Krankenpfleger",             back: "پرستار (مرد)",            sentence: "Der Krankenpfleger kümmert sich um die Patienten.",       translation: "پرستار از بیماران مراقبت می‌کند.",                notes: "Masc. Fem: die Krankenschwester / Krankenpflegerin. A caring profession." },
  { front: "der Übersetzer",                 back: "مترجم",                  sentence: "Der Übersetzer übersetzt Texte vom Deutschen ins Persische.", translation: "مترجم متن‌ها را از آلمانی به فارسی ترجمه می‌کند.", notes: "Masculine noun. Fem: die Übersetzerin. 'Dolmetscher' = oral interpreter." },
  { front: "der Manager",                    back: "مدیر",                   sentence: "Als Manager muss er viele Entscheidungen treffen.",       translation: "به‌عنوان مدیر باید تصمیمات زیادی بگیرد.",          notes: "Often used as a loanword. Fem: die Managerin." },
  { front: "der Forscher",                   back: "محقق / پژوهشگر",          sentence: "Die Forscher haben eine wichtige Entdeckung gemacht.",    translation: "محققان یک کشف مهم کرده‌اند.",                     notes: "Masculine noun. Fem: die Forscherin. Related to 'forschen' (to research)." },
  { front: "der Richter",                    back: "قاضی",                   sentence: "Der Richter sprach das Urteil.",                         translation: "قاضی حکم را صادر کرد.",                          notes: "Masculine noun. Fem: die Richterin. Pl: die Richter." },
  { front: "der Elektriker",                 back: "برقکار",                 sentence: "Wir brauchen einen Elektriker für die Reparatur.",        translation: "برای تعمیر به یک برقکار نیاز داریم.",             notes: "Masculine noun. Fem: die Elektrikerin. A skilled trade." },
  { front: "der Koch / die Köchin",          back: "آشپز",                   sentence: "Der Koch bereitet die Speisen frisch zu.",               translation: "آشپز غذاها را تازه آماده می‌کند.",                notes: "Masculine: der Koch. Feminine: die Köchin. Pl: die Köche." },
  { front: "die Stelle",                     back: "موقعیت شغلی / پست",      sentence: "Ich habe mich auf eine Stelle als Programmierer beworben.", translation: "برای یک موقعیت شغلی به‌عنوان برنامه‌نویس درخواست دادم.", notes: "Feminine noun. Also: die Arbeitsstelle. 'Eine Stelle suchen' = to look for a job." },
  { front: "sich bewerben",                  back: "درخواست شغل دادن",       sentence: "Ich möchte mich um diese Stelle bewerben.",              translation: "می‌خواهم برای این موقعیت درخواست بدهم.",           notes: "Reflexive verb + 'um' + Akkusativ. bewerbe mich / bewirbst dich." },
  { front: "der Lebenslauf",                 back: "رزومه",                  sentence: "Schick uns bitte deinen Lebenslauf.",                    translation: "لطفاً رزومه‌ات را برایمان بفرست.",                notes: "Masculine noun. Essential document for job applications in Germany." },
  { front: "das Vorstellungsgespräch",       back: "مصاحبه شغلی",            sentence: "Ich habe morgen ein Vorstellungsgespräch.",              translation: "فردا یک مصاحبه شغلی دارم.",                      notes: "Neuter noun. Literally 'presentation conversation'. Very formal." },
  { front: "selbstständig",                  back: "خوداشتغال / مستقل",      sentence: "Sie arbeitet selbstständig als Designerin.",             translation: "او به‌صورت خوداشتغال به‌عنوان طراح کار می‌کند.",  notes: "Adjective/adverb. 'Selbstständig sein' = to be self-employed." },
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
