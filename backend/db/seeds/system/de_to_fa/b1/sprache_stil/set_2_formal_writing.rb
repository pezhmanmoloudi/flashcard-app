set = Deck.find_by!(name: "Sprache & Stil", is_system: true, language_pair: "de_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 2 – Formelles Schreiben") { |s| s.position = 1 }

[
  { front: "Mit freundlichen Grüßen",       back: "با احترام",                 sentence: "Mit freundlichen Grüßen, Anna Bauer.",               translation: "با احترام، آنا باوئر.",                         notes: "Standard formal email/letter sign-off. Essential for German B1." },
  { front: "Sehr geehrte Damen und Herren", back: "جناب آقا / سرکار خانم",     sentence: "Sehr geehrte Damen und Herren, ich schreibe Ihnen …", translation: "جناب آقا / سرکار خانم، می‌نویسم به شما …",  notes: "Formal salutation when the recipient is unknown." },
  { front: "Sehr geehrter Herr …",         back: "جناب آقای …",               sentence: "Sehr geehrter Herr Müller, vielen Dank für Ihre Nachricht.", translation: "جناب آقای مولر، از پیام شما بسیار ممنونم.", notes: "Formal salutation for a known man. 'Sehr geehrte Frau …' = for a known woman." },
  { front: "hiermit",                       back: "بدین‌وسیله",                sentence: "Hiermit kündige ich meinen Vertrag.",                 translation: "بدین‌وسیله قراردادم را فسخ می‌کنم.",           notes: "Adverb. Very common in formal/legal documents. Starts a formal declaration." },
  { front: "bezüglich",                     back: "در خصوص / در رابطه با",     sentence: "Bezüglich Ihrer Anfrage möchte ich Folgendes sagen.", translation: "در خصوص استعلام شما می‌خواهم بگویم.",          notes: "Preposition. Takes Genitive. Very common in business German." },
  { front: "Im Anhang finden Sie …",        back: "در پیوست می‌یابید …",       sentence: "Im Anhang finden Sie die Rechnung.",                  translation: "در پیوست فاکتور را می‌یابید.",                 notes: "Fixed phrase for attaching documents to emails. 'Der Anhang' = attachment." },
  { front: "in Bezug auf …",                back: "در رابطه با … / با توجه به …", sentence: "In Bezug auf Ihre Frage möchte ich erklären …",    translation: "با توجه به سؤال شما می‌خواهم توضیح دهم …",    notes: "Formal expression. Used in business and academic writing. Takes Akkusativ." },
  { front: "gemäß",                         back: "طبق / مطابق با",            sentence: "Gemäß unseren Allgemeinen Geschäftsbedingungen …",    translation: "طبق شرایط عمومی کسب‌وکار ما …",               notes: "Preposition. Takes Dative. Very common in legal/formal contexts." },
  { front: "das Schreiben",                 back: "نامه / مکاتبه",             sentence: "Wir beziehen uns auf Ihr Schreiben vom 5. Mai.",      translation: "ما به نامه شما مورخ ۵ مه استناد می‌کنیم.",     notes: "Neuter noun. Formal term for a written communication. 'Bezug nehmen auf' = to refer to." },
  { front: "die Anfrage",                   back: "استعلام / درخواست",         sentence: "Vielen Dank für Ihre Anfrage.",                       translation: "از استعلام شما بسیار سپاسگزارم.",             notes: "Feminine noun. Pl: die Anfragen. 'Eine Anfrage stellen' = to make an enquiry." },
  { front: "der Vertrag",                   back: "قرارداد",                   sentence: "Bitte unterzeichnen Sie den Vertrag bis Freitag.",    translation: "لطفاً قرارداد را تا جمعه امضا کنید.",         notes: "Masculine noun. Pl: die Verträge. 'Einen Vertrag abschließen' = to conclude a contract." },
  { front: "die Frist",                     back: "مهلت / ضرب‌الاجل",         sentence: "Die Frist endet am 31. März.",                        translation: "مهلت در ۳۱ مارس به پایان می‌رسد.",            notes: "Feminine noun. Pl: die Fristen. 'Eine Frist einhalten' = to meet a deadline." },
  { front: "unverzüglich",                  back: "فوری / بدون تأخیر",         sentence: "Bitte antworten Sie unverzüglich.",                   translation: "لطفاً فوری پاسخ دهید.",                        notes: "Adverb. Very formal. More emphatic than 'sofort'. Common in official letters." },
  { front: "im Voraus",                     back: "از پیش / از قبل",           sentence: "Wir danken Ihnen im Voraus.",                         translation: "از پیش از شما متشکریم.",                       notes: "Fixed phrase. 'Im Voraus danken' is standard in formal requests." },
  { front: "ausdrücklich",                  back: "صراحتاً / به‌طور صریح",     sentence: "Ich weise ausdrücklich darauf hin.",                   translation: "من صراحتاً به این موضوع اشاره می‌کنم.",         notes: "Adverb. Used to emphasise something important. 'Ausdrücklich betonen' = to stress." },
  { front: "zur Verfügung stehen",          back: "در دسترس بودن",             sentence: "Ich stehe Ihnen für Rückfragen zur Verfügung.",        translation: "برای هرگونه سؤال در اختیار شما هستم.",         notes: "Fixed phrase. Very common in formal emails. 'Zur Verfügung stellen' = to provide." },
  { front: "mit Bedauern",                  back: "با تأسف",                   sentence: "Mit Bedauern teilen wir Ihnen mit …",                  translation: "با تأسف به اطلاع شما می‌رسانیم …",            notes: "Formal opening for conveying bad news. 'Zu meinem Bedauern' = to my regret." },
  { front: "erbeten",                       back: "درخواست شده / مورد تقاضا",  sentence: "Ihre baldige Antwort wird erbeten.",                  translation: "از پاسخ سریع شما تقاضا می‌شود.",              notes: "Past participle of 'erbitten'. Formal/archaic, common in written German." },
  { front: "das Angebot",                   back: "پیشنهاد / آفر",             sentence: "Wir senden Ihnen unser Angebot zu.",                  translation: "پیشنهاد خود را برای شما ارسال می‌کنیم.",       notes: "Neuter noun. Pl: die Angebote. In business: a formal price quotation." },
  { front: "hiermit bestätigen wir",        back: "بدین‌وسیله تأیید می‌کنیم",  sentence: "Hiermit bestätigen wir den Eingang Ihrer Zahlung.",   translation: "بدین‌وسیله دریافت پرداخت شما را تأیید می‌کنیم.", notes: "Fixed formal phrase. 'Die Bestätigung' = confirmation." },
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
