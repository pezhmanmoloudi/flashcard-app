set = Deck.find_by!(name: "Welt & Gesellschaft", is_system: true, language_pair: "de_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 1 – Bildung") { |s| s.position = 0 }

[
  { front: "die Schule",            back: "مدرسه",                    sentence: "Die Kinder gehen morgens in die Schule.",            translation: "بچه‌ها صبح‌ها به مدرسه می‌روند.",              notes: "Feminine noun. Pl: die Schulen. 'In die Schule gehen' = to go to school." },
  { front: "die Universität",       back: "دانشگاه",                  sentence: "Sie studiert an der Universität Berlin.",            translation: "او در دانشگاه برلین تحصیل می‌کند.",             notes: "Feminine noun. Informal: die Uni. Pl: die Universitäten." },
  { front: "der Unterricht",        back: "کلاس درس / آموزش",         sentence: "Der Unterricht beginnt um 8 Uhr.",                  translation: "کلاس درس ساعت ۸ شروع می‌شود.",                 notes: "Masculine noun. Uncountable in German. 'Am Unterricht teilnehmen' = to attend." },
  { front: "die Prüfung",           back: "امتحان",                   sentence: "Ich lerne für die Prüfung am Freitag.",             translation: "برای امتحان جمعه درس می‌خوانم.",               notes: "Feminine noun. Pl: die Prüfungen. 'Eine Prüfung ablegen' = to take an exam." },
  { front: "das Abitur",            back: "دیپلم دبیرستان (آلمانی)",   sentence: "Nach dem Abitur möchte ich studieren.",             translation: "بعد از دیپلم می‌خواهم تحصیل کنم.",             notes: "Neuter noun. German school-leaving certificate at 18/19. Required for university." },
  { front: "das Studium",           back: "تحصیلات دانشگاهی",         sentence: "Sein Studium dauert fünf Jahre.",                   translation: "تحصیلات دانشگاهی‌اش پنج سال طول می‌کشد.",     notes: "Neuter noun. Pl: die Studien. 'Ein Studium abschließen' = to complete a degree." },
  { front: "der Abschluss",         back: "مدرک تحصیلی / فارغ‌التحصیلی", sentence: "Sie hat einen guten Abschluss gemacht.",          translation: "او مدرک خوبی گرفت.",                          notes: "Masculine noun. Pl: die Abschlüsse. Also means 'conclusion/end'." },
  { front: "die Hausaufgaben",      back: "تکلیف",                    sentence: "Er hat seine Hausaufgaben nicht gemacht.",          translation: "او تکلیفش را نکرده است.",                      notes: "Always plural. Singular: die Hausaufgabe. 'Hausaufgaben machen' = to do homework." },
  { front: "das Fach",              back: "درس / رشته تحصیلی",        sentence: "Mein Lieblingsfach ist Mathematik.",                translation: "درس مورد علاقه‌ام ریاضیات است.",               notes: "Neuter noun. Pl: die Fächer. Also means 'compartment' or 'drawer'." },
  { front: "der Professor",         back: "استاد دانشگاه",             sentence: "Der Professor hält eine Vorlesung über Geschichte.", translation: "استاد یک سخنرانی درباره تاریخ دارد.",           notes: "Masculine noun. Fem: die Professorin. Pl: die Professoren." },
  { front: "lernen",                back: "یاد گرفتن / مطالعه کردن",  sentence: "Ich lerne jeden Tag zwei Stunden Deutsch.",         translation: "هر روز دو ساعت آلمانی درس می‌خوانم.",          notes: "Regular verb. lerne / lernst / lernt. 'Auswendig lernen' = to memorise." },
  { front: "bestehen",              back: "قبول شدن (در امتحان)",      sentence: "Ich hoffe, ich bestehe die Prüfung.",               translation: "امیدوارم در امتحان قبول شوم.",                  notes: "Strong verb (besteht, bestand, bestanden). 'Bestehen' + Akkusativ = to pass sth." },
  { front: "durchfallen",           back: "مردود شدن / افتادن",       sentence: "Er ist leider durch die Prüfung gefallen.",         translation: "متأسفانه در امتحان مردود شد.",                 notes: "Separable strong verb. falle durch / fiel durch. Opposite of 'bestehen'." },
  { front: "die Note",              back: "نمره",                     sentence: "Sie hat sehr gute Noten bekommen.",                 translation: "او نمره‌های خیلی خوبی گرفت.",                  notes: "Feminine noun. German grades: 1 (best) – 6 (worst). Pl: die Noten." },
  { front: "das Zeugnis",           back: "کارنامه / گواهی‌نامه",      sentence: "Das Zeugnis kommt am Ende des Schuljahres.",        translation: "کارنامه آخر سال تحصیلی می‌آید.",              notes: "Neuter noun. Pl: die Zeugnisse. Both school report and official certificate." },
  { front: "die Ausbildung",        back: "آموزش حرفه‌ای / کارآموزی",  sentence: "Er macht eine Ausbildung zum Elektriker.",          translation: "او دوره کارآموزی برقکاری می‌گذراند.",          notes: "Feminine noun. Dual vocational training system (Berufsschule + Betrieb)." },
  { front: "das Stipendium",        back: "بورسیه تحصیلی",            sentence: "Sie hat ein Stipendium für ihr Studium bekommen.",  translation: "او برای تحصیلاتش بورسیه گرفت.",              notes: "Neuter noun. Pl: die Stipendien. 'Ein Stipendium beantragen' = to apply for one." },
  { front: "recherchieren",         back: "تحقیق کردن / جستجو کردن",  sentence: "Für seine Arbeit muss er viel recherchieren.",      translation: "برای پایان‌نامه‌اش باید خیلی تحقیق کند.",      notes: "Regular verb. recherchiere / recherchierst. From French 'rechercher'." },
  { front: "der Kurs",              back: "دوره / کلاس",              sentence: "Ich belege einen Deutschkurs an der Volkshochschule.", translation: "یک دوره آلمانی در مرکز آموزش بزرگسالان ثبت‌نام کردم.", notes: "Masculine noun. Pl: die Kurse. 'Einen Kurs belegen' = to enrol in a course." },
  { front: "sich anmelden",         back: "ثبت‌نام کردن",             sentence: "Hast du dich schon für den Kurs angemeldet?",       translation: "آیا برای دوره ثبت‌نام کرده‌ای؟",              notes: "Reflexive separable verb. melde mich an / meldest dich an." },
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
