set = Deck.find_by!(name: "Arbeit & Wirtschaft", is_system: true, language_pair: "de_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 3 – Wirtschaft & Finanzen") { |s| s.position = 2 }

[
  { front: "die Wirtschaft",               back: "اقتصاد",                   sentence: "Die Wirtschaft des Landes wächst langsam.",          translation: "اقتصاد کشور آهسته رشد می‌کند.",                notes: "Feminine noun. 'Wirtschaftlich' = economic. Also means 'business' in broader sense." },
  { front: "das Konto",                    back: "حساب بانکی",                sentence: "Ich habe ein Konto bei der Sparkasse.",             translation: "در اسپارکاسه یک حساب بانکی دارم.",              notes: "Neuter noun. Pl: die Konten. 'Girokonto' = current account." },
  { front: "die Steuer",                   back: "مالیات",                   sentence: "In Deutschland sind die Steuern relativ hoch.",     translation: "در آلمان مالیات‌ها نسبتاً بالا هستند.",         notes: "Feminine noun. Pl: die Steuern. 'Steuererklärung' = tax return." },
  { front: "der Preis",                    back: "قیمت",                     sentence: "Der Preis ist leider gestiegen.",                   translation: "قیمت متأسفانه بالا رفته است.",                  notes: "Masculine noun. Pl: die Preise. Also means 'prize' in a competition." },
  { front: "günstig",                      back: "ارزان / مقرون‌به‌صرفه",     sentence: "Das ist ein sehr günstiges Angebot.",               translation: "این یک پیشنهاد خیلی مقرون‌به‌صرفه است.",        notes: "Adjective. More polite alternative to 'billig' (cheap). Opposite: teuer." },
  { front: "der Kredit",                   back: "وام / اعتبار",              sentence: "Sie hat einen Kredit für das Auto aufgenommen.",    translation: "او برای ماشین وام گرفته است.",                  notes: "Masculine noun. 'Einen Kredit aufnehmen' = to take out a loan." },
  { front: "bezahlen",                     back: "پرداخت کردن",              sentence: "Kann ich mit Karte bezahlen?",                      translation: "می‌توانم با کارت پرداخت کنم؟",                 notes: "Regular verb. bezahle / bezahlst / bezahlt. Synonym: zahlen." },
  { front: "sparen",                       back: "پس‌انداز کردن",            sentence: "Wir müssen mehr Geld sparen.",                      translation: "باید پول بیشتری پس‌انداز کنیم.",               notes: "Regular verb. 'Sparen für' + Akkusativ = to save for sth." },
  { front: "ausgeben",                     back: "خرج کردن / هزینه کردن",    sentence: "Er gibt zu viel Geld für Kleidung aus.",            translation: "او خیلی زیاد پول برای لباس خرج می‌کند.",       notes: "Separable verb. gebe aus / gibst aus. 'Ausgaben' = expenses (pl)." },
  { front: "die Rechnung",                 back: "صورتحساب / فاکتور",        sentence: "Die Rechnung kommt nächste Woche.",                 translation: "صورتحساب هفته آینده می‌آید.",                   notes: "Feminine noun. Pl: die Rechnungen. Also means 'calculation' in maths." },
  { front: "der Rabatt",                   back: "تخفیف",                    sentence: "Wir geben 10 % Rabatt auf alle Artikel.",           translation: "۱۰ درصد تخفیف روی همه اقلام می‌دهیم.",         notes: "Masculine noun. Pl: die Rabatte. 'Mit Rabatt kaufen' = to buy at a discount." },
  { front: "die Inflation",                back: "تورم",                     sentence: "Die Inflation hat die Kaufkraft verringert.",        translation: "تورم قدرت خرید را کاهش داده است.",             notes: "Feminine noun. 'Inflationsrate' = inflation rate. Key economic term." },
  { front: "das Budget",                   back: "بودجه",                    sentence: "Wir müssen im Budget bleiben.",                     translation: "باید در بودجه بمانیم.",                         notes: "Neuter noun. Loanword. 'Das Budget überschreiten' = to exceed the budget." },
  { front: "investieren",                  back: "سرمایه‌گذاری کردن",        sentence: "Es lohnt sich, in Bildung zu investieren.",         translation: "ارزشش را دارد که در آموزش سرمایه‌گذاری کنیم.", notes: "Regular verb. 'In etwas investieren' + Akkusativ." },
  { front: "der Markt",                    back: "بازار",                    sentence: "Die Nachfrage auf dem Markt ist gestiegen.",         translation: "تقاضا در بازار افزایش یافته است.",             notes: "Masculine noun. Pl: die Märkte. 'Arbeitsmarkt' = labour market." },
  { front: "die Währung",                  back: "واحد پول / ارز",           sentence: "Der Euro ist die Währung in Deutschland.",          translation: "یورو واحد پول آلمان است.",                      notes: "Feminine noun. Pl: die Währungen. 'Wechselkurs' = exchange rate." },
  { front: "das Einkommen",                back: "درآمد",                    sentence: "Sein Einkommen reicht kaum zum Leben.",             translation: "درآمدش به‌زور برای زندگی کافی است.",           notes: "Neuter noun. Monthly/yearly income. 'Einkommenssteuer' = income tax." },
  { front: "der Verbraucher",              back: "مصرف‌کننده",               sentence: "Verbraucher sollten ihre Rechte kennen.",            translation: "مصرف‌کنندگان باید حقوق خود را بدانند.",        notes: "Masculine noun. Fem: die Verbraucherin. Pl: die Verbraucher." },
  { front: "die Schulden",                 back: "بدهی‌ها",                  sentence: "Er hat hohe Schulden bei der Bank.",                translation: "او بدهی زیادی به بانک دارد.",                   notes: "Always plural. Singular rarely used. 'Schulden machen' = to get into debt." },
  { front: "die Versicherung",             back: "بیمه",                     sentence: "Eine Krankenversicherung ist in Deutschland Pflicht.", translation: "داشتن بیمه درمانی در آلمان اجباری است.",       notes: "Feminine noun. Pl: die Versicherungen. 'Versichert sein' = to be insured." },
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
