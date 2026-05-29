set = Deck.find_by!(name: "Arbeit & Wirtschaft", is_system: true, language_pair: "de_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 2 – Am Arbeitsplatz") { |s| s.position = 1 }

[
  { front: "das Büro",              back: "دفتر کار",               sentence: "Ich arbeite jeden Tag im Büro.",                   translation: "هر روز در دفتر کار می‌کنم.",                  notes: "Neuter noun. Pl: die Büros. 'Ins Büro gehen' = to go to the office." },
  { front: "die Besprechung",       back: "جلسه",                   sentence: "Wir haben um 10 Uhr eine Besprechung.",            translation: "ساعت ۱۰ یک جلسه داریم.",                      notes: "Feminine noun. Pl: die Besprechungen. Synonym: das Meeting." },
  { front: "der Kollege",           back: "همکار",                  sentence: "Meine Kollegen sind sehr hilfsbereit.",            translation: "همکارانم خیلی کمک‌کننده هستند.",               notes: "Masculine noun. Fem: die Kollegin. Pl: die Kollegen." },
  { front: "der Chef / die Chefin", back: "رئیس / مدیر",            sentence: "Mein Chef ist sehr fair.",                        translation: "رئیسم خیلی منصفانه رفتار می‌کند.",             notes: "Masculine: der Chef. Feminine: die Chefin. Colloquial for superior." },
  { front: "die Aufgabe",           back: "وظیفه / کار",            sentence: "Das ist eine schwierige Aufgabe.",                translation: "این یک کار دشوار است.",                        notes: "Feminine noun. Pl: die Aufgaben. Also used in school context." },
  { front: "das Gehalt",            back: "حقوق / دستمزد",          sentence: "Ihr Gehalt wird am Ende des Monats überwiesen.",   translation: "حقوقش آخر ماه واریز می‌شود.",                 notes: "Neuter noun. Monthly salary. 'Der Lohn' = hourly wage." },
  { front: "der Urlaub",            back: "مرخصی / تعطیلات",        sentence: "Ich nehme nächste Woche Urlaub.",                  translation: "هفته آینده مرخصی می‌گیرم.",                   notes: "Masculine noun. 'Urlaub nehmen' = to take holiday. Pl: die Urlaube." },
  { front: "die Überstunden",       back: "اضافه‌کاری",             sentence: "Er macht oft Überstunden.",                       translation: "او اغلب اضافه‌کاری می‌کند.",                  notes: "Always plural. 'Überstunden machen' = to work overtime." },
  { front: "kündigen",              back: "استعفا دادن / فسخ کردن",  sentence: "Sie hat ihre Stelle gekündigt.",                   translation: "او از موقعیت شغلی‌اش استعفا داد.",             notes: "Regular verb. Can be used by employee (resign) or employer (fire). 'Ich kündige' = I resign." },
  { front: "entlassen",             back: "اخراج کردن",             sentence: "Er wurde wegen schlechter Leistung entlassen.",    translation: "او به‌خاطر عملکرد ضعیف اخراج شد.",             notes: "Strong verb (entlässt, entließ, entlassen). Passive often used." },
  { front: "der Vertrag",           back: "قرارداد",                sentence: "Bitte unterschreiben Sie den Vertrag.",            translation: "لطفاً قرارداد را امضا کنید.",                 notes: "Masculine noun. Pl: die Verträge. 'Einen Vertrag abschließen' = to sign a contract." },
  { front: "die Bewerbung",         back: "درخواست شغل / مدارک",    sentence: "Meine Bewerbung wurde abgelehnt.",                 translation: "درخواست شغلی‌ام رد شد.",                      notes: "Feminine noun. Includes CV, cover letter, certificates." },
  { front: "telefonieren",          back: "تلفن زدن",               sentence: "Er telefoniert gerade mit einem Kunden.",          translation: "او الان دارد با یک مشتری تلفن می‌زند.",        notes: "Regular verb. 'Mit jemandem telefonieren' + Dative." },
  { front: "der Bericht",           back: "گزارش",                  sentence: "Sie schreibt einen Bericht über das Projekt.",     translation: "او یک گزارش درباره پروژه می‌نویسد.",           notes: "Masculine noun. Pl: die Berichte. 'Einen Bericht erstellen' = to compile a report." },
  { front: "planen",                back: "برنامه‌ریزی کردن",       sentence: "Wir müssen das Projekt sorgfältig planen.",        translation: "باید پروژه را با دقت برنامه‌ریزی کنیم.",       notes: "Regular verb. plane / planst / plant." },
  { front: "erledigen",             back: "انجام دادن / تمام کردن", sentence: "Ich muss noch ein paar Aufgaben erledigen.",       translation: "هنوز باید چند کار انجام دهم.",                notes: "Regular verb. erledige / erledigst. 'Erledigt!' = Done!" },
  { front: "die Konferenz",         back: "کنفرانس",                sentence: "Er nimmt an einer internationalen Konferenz teil.", translation: "او در یک کنفرانس بین‌المللی شرکت می‌کند.",     notes: "Feminine noun. Pl: die Konferenzen. 'An einer Konferenz teilnehmen' = to attend." },
  { front: "pünktlich",             back: "به موقع / سر وقت",       sentence: "In Deutschland ist es wichtig, pünktlich zu sein.", translation: "در آلمان مهم است که سر وقت باشی.",            notes: "Adjective/adverb. 'Pünktlichkeit' = punctuality. A valued German trait." },
  { front: "verantwortlich",        back: "مسئول",                  sentence: "Wer ist für dieses Projekt verantwortlich?",       translation: "چه کسی مسئول این پروژه است؟",                 notes: "Adjective. 'Verantwortlich sein für' + Akkusativ." },
  { front: "das Team",              back: "تیم / گروه کاری",        sentence: "Unser Team arbeitet sehr gut zusammen.",           translation: "تیم ما خیلی خوب با هم کار می‌کند.",           notes: "Neuter noun. Pl: die Teams. Loanword from English." },
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
