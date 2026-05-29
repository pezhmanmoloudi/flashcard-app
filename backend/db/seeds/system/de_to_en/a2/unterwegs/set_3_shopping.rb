set = Deck.find_by!(name: "Unterwegs", is_system: true, language_pair: "de_to_en")
          .flashcard_sets
          .find_or_create_by!(name: "Set 3 – Shopping") { |s| s.position = 2 }

[
  { front: "das Geschäft",      back: "shop / store",        sentence: "Das Geschäft hat heute Sonderangebote.", translation: "The shop has special offers today.",   notes: "Neuter noun. Pl: die Geschäfte." },
  { front: "kaufen",            back: "to buy",              sentence: "Ich möchte diese Schuhe kaufen.",        translation: "I would like to buy these shoes.",     notes: "Regular verb. kaufe / kaufst / kauft." },
  { front: "der Preis",         back: "price",               sentence: "Was ist der Preis?",                     translation: "What is the price?",                   notes: "Masculine noun. Pl: die Preise." },
  { front: "teuer",             back: "expensive",           sentence: "Das ist mir zu teuer.",                  translation: "That is too expensive for me.",        notes: "Adjective. Opposite: billig/günstig (cheap)." },
  { front: "billig",            back: "cheap",               sentence: "Diese Schuhe sind sehr billig.",         translation: "These shoes are very cheap.",          notes: "Adjective. 'Günstig' is more neutral/polite." },
  { front: "die Kasse",         back: "checkout / till",     sentence: "Bitte zahlen Sie an der Kasse.",         translation: "Please pay at the checkout.",          notes: "Feminine noun. Pl: die Kassen. Checkout/cash register." },
  { front: "der Rabatt",        back: "discount",            sentence: "Gibt es einen Rabatt?",                  translation: "Is there a discount?",                 notes: "Masculine noun. Pl: die Rabatte." },
  { front: "das Angebot",       back: "offer / deal",        sentence: "Das ist ein gutes Angebot!",             translation: "That's a good deal!",                  notes: "Neuter noun. 'Sonderangebot' = special offer." },
  { front: "die Größe",         back: "size",                sentence: "Welche Größe haben Sie?",                translation: "What size are you?",                   notes: "Feminine noun. Pl: die Größen. For clothing sizes." },
  { front: "die Kreditkarte",   back: "credit card",         sentence: "Kann ich mit Kreditkarte zahlen?",       translation: "Can I pay by credit card?",            notes: "Feminine noun. Pl: die Kreditkarten." },
  { front: "das Bargeld",       back: "cash",                sentence: "Zahlen Sie bar oder mit Karte?",         translation: "Are you paying cash or by card?",      notes: "Neuter noun. No plural. 'Bar zahlen' = to pay cash." },
  { front: "die Tüte",          back: "bag",                 sentence: "Brauchen Sie eine Tüte?",                translation: "Do you need a bag?",                   notes: "Feminine noun. Pl: die Tüten. Plastic/paper bag at checkout." },
  { front: "die Quittung",      back: "receipt",             sentence: "Kann ich die Quittung haben?",           translation: "Can I have the receipt?",              notes: "Feminine noun. Pl: die Quittungen." },
  { front: "umtauschen",        back: "to exchange / return", sentence: "Kann ich das umtauschen?",             translation: "Can I exchange this?",                 notes: "Separable verb. tausche um / tauschst um." },
  { front: "suchen",            back: "to look for",         sentence: "Ich suche ein Geschenk.",                translation: "I'm looking for a present.",           notes: "Regular verb. suche / suchst / sucht." },
  { front: "finden",            back: "to find",             sentence: "Ich kann es nicht finden.",              translation: "I can't find it.",                     notes: "Strong verb. finde / findest / findet." },
  { front: "brauchen",          back: "to need",             sentence: "Was brauchen Sie?",                      translation: "What do you need?",                    notes: "Regular verb. brauche / brauchst / braucht." },
  { front: "der Euro",          back: "euro",                sentence: "Das kostet zehn Euro.",                  translation: "That costs ten euros.",                notes: "Masculine noun. Pl: die Euro (no change) or Euros." },
  { front: "Wie viel kostet…?", back: "How much does … cost?", sentence: "Wie viel kostet das?",               translation: "How much does that cost?",             notes: "Fixed phrase for asking the price." },
  { front: "das Sonderangebot", back: "special offer",       sentence: "Heute gibt es Sonderangebote.",          translation: "There are special offers today.",      notes: "Neuter noun. Pl: die Sonderangebote." },
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
