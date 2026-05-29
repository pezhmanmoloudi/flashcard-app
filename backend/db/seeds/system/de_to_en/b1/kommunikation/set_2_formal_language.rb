set = Deck.find_by!(name: "Kommunikation", is_system: true)
          .flashcard_sets
          .find_or_create_by!(name: "Set 2 – Formal Language") { |s| s.position = 1 }

[
  { front: "Mit freundlichen Grüßen",  back: "Kind regards / Yours sincerely", sentence: "Mit freundlichen Grüßen, Thomas Müller.", translation: "Kind regards, Thomas Müller.",       notes: "Standard formal email/letter sign-off. Essential for German B1." },
  { front: "Sehr geehrte Damen und Herren", back: "Dear Sir or Madam",    sentence: "Sehr geehrte Damen und Herren, ich schreibe Ihnen …", translation: "Dear Sir or Madam, I am writing to you …", notes: "Formal salutation when recipient is unknown." },
  { front: "Sehr geehrter Herr …",     back: "Dear Mr …",                 sentence: "Sehr geehrter Herr Müller, vielen Dank für Ihre E-Mail.", translation: "Dear Mr Müller, many thanks for your email.", notes: "Formal. Note: 'geehrter' agrees with masculine noun." },
  { front: "hiermit",                  back: "hereby",                    sentence: "Hiermit kündige ich meinen Vertrag.",    translation: "I hereby terminate my contract.",     notes: "Adverb. Very common in formal/legal texts." },
  { front: "bezüglich",                back: "regarding / concerning",    sentence: "Bezüglich Ihrer Anfrage möchte ich Folgendes sagen.", translation: "Regarding your inquiry, I would like to say the following.", notes: "Preposition. Takes genitive. Common in business German." },
  { front: "Im Anhang finden Sie …",   back: "Please find attached …",    sentence: "Im Anhang finden Sie die Rechnung.",    translation: "Please find the invoice attached.",   notes: "Fixed phrase for attaching documents to emails." },
  { front: "in Bezug auf …",           back: "with regard to / in relation to …", sentence: "In Bezug auf Ihre Frage möchte ich erklären …", translation: "With regard to your question, I would like to explain …", notes: "Formal expression. Often used in business/academic writing." },
  { front: "gemäß",                    back: "according to / in accordance with", sentence: "Gemäß unseren Bedingungen …",        translation: "In accordance with our terms …",     notes: "Preposition. Takes dative. Very common in legal/formal contexts." },
  { front: "das Schreiben",            back: "letter / correspondence",   sentence: "Wir beziehen uns auf Ihr Schreiben vom 5. Mai.", translation: "We refer to your letter of 5 May.", notes: "Neuter noun. Formal term for a written communication." },
  { front: "die Anfrage",              back: "inquiry / request",         sentence: "Vielen Dank für Ihre Anfrage.",          translation: "Thank you very much for your inquiry.", notes: "Feminine noun. Pl: die Anfragen." },
  { front: "das Angebot",              back: "offer / quotation",         sentence: "Wir senden Ihnen unser Angebot zu.",     translation: "We are sending you our offer.",       notes: "Neuter noun. Pl: die Angebote. In business: a formal quote." },
  { front: "der Vertrag",              back: "contract",                  sentence: "Bitte unterzeichnen Sie den Vertrag.",   translation: "Please sign the contract.",            notes: "Masculine noun. Pl: die Verträge." },
  { front: "die Frist",                back: "deadline",                  sentence: "Die Frist endet am 31. März.",           translation: "The deadline is 31 March.",            notes: "Feminine noun. Pl: die Fristen. Important in legal/formal contexts." },
  { front: "hiermit bestätigen wir",   back: "we hereby confirm",         sentence: "Hiermit bestätigen wir Ihren Auftrag.",  translation: "We hereby confirm your order.",       notes: "Fixed business phrase." },
  { front: "erbeten",                  back: "requested",                 sentence: "Ihre Antwort wird erbeten.",             translation: "Your reply is requested.",             notes: "Past participle of 'erbitten'. Formal/archaic, common in written German." },
  { front: "unverzüglich",             back: "immediately / without delay", sentence: "Bitte antworten Sie unverzüglich.",   translation: "Please respond immediately.",         notes: "Adverb. Very formal. More formal than 'sofort'." },
  { front: "im Voraus",                back: "in advance",                sentence: "Ich danke Ihnen im Voraus.",            translation: "I thank you in advance.",             notes: "Fixed phrase. 'Im Voraus danken' is standard in formal requests." },
  { front: "ausdrücklich",             back: "expressly / explicitly",    sentence: "Ich weise ausdrücklich darauf hin.",     translation: "I explicitly point this out.",         notes: "Adverb. Used to emphasise something important." },
  { front: "zur Verfügung stehen",     back: "to be available",           sentence: "Ich stehe Ihnen für Rückfragen zur Verfügung.", translation: "I am available for any questions.", notes: "Fixed phrase. Very common in formal emails." },
  { front: "mit Bedauern",             back: "with regret",               sentence: "Mit Bedauern teilen wir Ihnen mit …",   translation: "We regret to inform you …",           notes: "Formal opening for conveying bad news." },
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
