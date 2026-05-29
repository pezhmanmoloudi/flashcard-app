set = Deck.find_by!(name: "Unterwegs", is_system: true)
          .flashcard_sets
          .find_or_create_by!(name: "Set 3 – Shopping") { |s| s.position = 2 }

[
  { front: "das Geschäft",    back: "مغازه",       sentence: "Das Geschäft hat heute Sonderangebote.", translation: "مغازه امروز تخفیف دارد.",    notes: "Neuter noun. Pl: die Geschäfte." },
  { front: "kaufen",          back: "خریدن",       sentence: "Ich möchte diese Schuhe kaufen.",   translation: "می‌خواهم این کفش‌ها را بخرم.",  notes: "Regular verb. kaufe / kaufst / kauft." },
  { front: "der Preis",       back: "قیمت",        sentence: "Was ist der Preis?",                translation: "قیمت چقدر است؟",               notes: "Masculine noun. Pl: die Preise." },
  { front: "teuer",           back: "گران",        sentence: "Das ist mir zu teuer.",             translation: "برای من خیلی گران است.",         notes: "Adjective. Opposite: billig/günstig (cheap)." },
  { front: "billig",          back: "ارزان",       sentence: "Diese Schuhe sind sehr billig.",    translation: "این کفش‌ها خیلی ارزانند.",       notes: "Adjective. 'Günstig' is more neutral/polite." },
  { front: "die Kasse",       back: "صندوق",       sentence: "Bitte zahlen Sie an der Kasse.",    translation: "لطفاً پیش صندوق بپردازید.",     notes: "Feminine noun. Pl: die Kassen. Checkout/cash register." },
  { front: "der Rabatt",      back: "تخفیف",       sentence: "Gibt es einen Rabatt?",             translation: "تخفیف دارید؟",                  notes: "Masculine noun. Pl: die Rabatte." },
  { front: "das Angebot",     back: "پیشنهاد / تخفیف", sentence: "Das ist ein gutes Angebot!",  translation: "این پیشنهاد خوبیه!",            notes: "Neuter noun. 'Sonderangebot' = special offer." },
  { front: "die Größe",       back: "سایز / اندازه", sentence: "Welche Größe haben Sie?",        translation: "چه سایزی دارید؟",               notes: "Feminine noun. Pl: die Größen. For clothing sizes." },
  { front: "die Kreditkarte", back: "کارت اعتباری", sentence: "Kann ich mit Kreditkarte zahlen?", translation: "می‌توانم با کارت اعتباری بپردازم؟", notes: "Feminine noun. Pl: die Kreditkarten." },
  { front: "das Bargeld",     back: "پول نقد",     sentence: "Zahlen Sie bar oder mit Karte?",   translation: "نقد می‌پردازید یا با کارت؟",     notes: "Neuter noun. No plural. 'Bar zahlen' = to pay cash." },
  { front: "die Tüte",        back: "کیسه",        sentence: "Brauchen Sie eine Tüte?",           translation: "کیسه می‌خواهید؟",               notes: "Feminine noun. Pl: die Tüten. Plastic/paper bag at checkout." },
  { front: "die Quittung",    back: "رسید",        sentence: "Kann ich die Quittung haben?",      translation: "می‌توانم رسید بگیرم؟",          notes: "Feminine noun. Pl: die Quittungen." },
  { front: "umtauschen",      back: "تعویض کردن",  sentence: "Kann ich das umtauschen?",          translation: "می‌توانم آن را تعویض کنم؟",     notes: "Separable verb. tausche um / tauschst um." },
  { front: "suchen",          back: "جستجو کردن",  sentence: "Ich suche ein Geschenk.",           translation: "دنبال یک هدیه می‌گردم.",        notes: "Regular verb. suche / suchst / sucht." },
  { front: "finden",          back: "پیدا کردن",   sentence: "Ich kann es nicht finden.",         translation: "نمی‌توانم آن را پیدا کنم.",     notes: "Strong verb. finde / findest / findet." },
  { front: "brauchen",        back: "نیاز داشتن",  sentence: "Was brauchen Sie?",                 translation: "به چه چیزی نیاز دارید؟",        notes: "Regular verb. brauche / brauchst / braucht." },
  { front: "der Euro",        back: "یورو",        sentence: "Das kostet zehn Euro.",             translation: "این ده یورو هزینه دارد.",        notes: "Masculine noun. Pl: die Euro (no change) or Euros." },
  { front: "Wie viel kostet…?", back: "… چقدر هزینه دارد؟", sentence: "Wie viel kostet das?",  translation: "این چقدر هزینه دارد؟",           notes: "Fixed phrase for asking the price." },
  { front: "das Sonderangebot", back: "حراج / تخفیف ویژه", sentence: "Heute gibt es Sonderangebote.", translation: "امروز حراج هست.",          notes: "Neuter noun. Pl: die Sonderangebote." },
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
