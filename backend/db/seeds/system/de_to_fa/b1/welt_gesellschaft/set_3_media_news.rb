set = Deck.find_by!(name: "Welt & Gesellschaft", is_system: true, language_pair: "de_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 3 – Medien & Nachrichten") { |s| s.position = 2 }

[
  { front: "die Nachrichten",         back: "اخبار",                     sentence: "Ich schaue jeden Abend die Nachrichten.",          translation: "هر شب اخبار تماشا می‌کنم.",                   notes: "Always plural. Singular: die Nachricht (a piece of news / a message)." },
  { front: "die Zeitung",             back: "روزنامه",                   sentence: "Er liest jeden Morgen die Zeitung.",              translation: "او هر صبح روزنامه می‌خواند.",                  notes: "Feminine noun. Pl: die Zeitungen. 'Die Zeitung abonnieren' = to subscribe." },
  { front: "das Fernsehen",           back: "تلویزیون",                  sentence: "Er verbringt zu viel Zeit vor dem Fernsehen.",     translation: "او وقت زیادی جلوی تلویزیون می‌گذراند.",       notes: "Neuter noun. Uncountable. 'Der Fernseher' = the TV set. 'TV schauen' = to watch TV." },
  { front: "das Radio",               back: "رادیو",                     sentence: "Im Auto höre ich immer Radio.",                    translation: "در ماشین همیشه رادیو گوش می‌دهم.",             notes: "Neuter noun. 'Radio hören' = to listen to the radio. No article in this phrase." },
  { front: "die sozialen Medien",     back: "شبکه‌های اجتماعی",          sentence: "Soziale Medien haben unsere Kommunikation verändert.", translation: "شبکه‌های اجتماعی ارتباطات ما را تغییر داده‌اند.", notes: "Always plural. 'Social Media' is also used as a loanword in German." },
  { front: "der Journalist",          back: "روزنامه‌نگار",              sentence: "Der Journalist berichtet aus dem Kriegsgebiet.",   translation: "روزنامه‌نگار از منطقه جنگی گزارش می‌دهد.",     notes: "Masculine noun. Fem: die Journalistin. Pl: die Journalisten." },
  { front: "berichten",               back: "گزارش دادن",                sentence: "Der Sender berichtet live vom Ort des Geschehens.", translation: "شبکه تلویزیونی مستقیم از محل رویداد گزارش می‌دهد.", notes: "Regular verb. 'Über etwas berichten' = to report on sth. 'Der Bericht' = the report." },
  { front: "die Schlagzeile",         back: "تیتر خبر",                  sentence: "Die Schlagzeile ist sehr provokant.",              translation: "تیتر خبر خیلی برانگیزاننده است.",             notes: "Feminine noun. Pl: die Schlagzeilen. Literally 'hit line'. Used for bold headlines." },
  { front: "die Werbung",             back: "تبلیغات",                   sentence: "Es gibt zu viel Werbung im Internet.",             translation: "در اینترنت تبلیغات خیلی زیادی وجود دارد.",     notes: "Feminine noun. Usually uncountable. 'Werbung machen' = to advertise." },
  { front: "die Sendung",             back: "برنامه تلویزیونی / رادیویی", sentence: "Die Sendung beginnt um 20 Uhr.",                   translation: "برنامه ساعت ۲۰ شروع می‌شود.",                  notes: "Feminine noun. Pl: die Sendungen. 'Eine Sendung ausstrahlen' = to broadcast." },
  { front: "die Meinungsfreiheit",    back: "آزادی بیان",                sentence: "Meinungsfreiheit ist ein Grundrecht in Deutschland.", translation: "آزادی بیان یک حق اساسی در آلمان است.",       notes: "Feminine noun. One of Germany's constitutional rights (Art. 5 GG)." },
  { front: "die Zensur",              back: "سانسور",                    sentence: "Pressefreiheit bedeutet das Recht auf keine Zensur.", translation: "آزادی مطبوعات به معنای حق نداشتن سانسور است.", notes: "Feminine noun. 'Zensieren' = to censor. 'Die Pressefreiheit' = freedom of the press." },
  { front: "glaubwürdig",             back: "قابل اعتماد / معتبر",       sentence: "Diese Quelle ist nicht glaubwürdig.",              translation: "این منبع قابل اعتماد نیست.",                   notes: "Adjective. 'Glaubwürdigkeit' = credibility. Compound: 'glauben' + 'würdig' (worthy)." },
  { front: "die Quelle",              back: "منبع",                      sentence: "Bitte nenne die Quelle!",                          translation: "لطفاً منبع را ذکر کن!",                        notes: "Feminine noun. Pl: die Quellen. Also means 'spring' (water source)." },
  { front: "veröffentlichen",         back: "منتشر کردن",                sentence: "Das Buch wird nächsten Monat veröffentlicht.",      translation: "کتاب ماه آینده منتشر می‌شود.",                 notes: "Regular verb. veröffentliche / veröffentlichst. 'Die Veröffentlichung' = publication." },
  { front: "die Fake News",           back: "اخبار جعلی",                sentence: "Fake News verbreiten sich schnell in sozialen Medien.", translation: "اخبار جعلی در شبکه‌های اجتماعی سریع پخش می‌شوند.", notes: "Borrowed English term. Widely used in German. 'Sich verbreiten' = to spread." },
  { front: "aktuell",                 back: "به‌روز / جاری / فعلی",      sentence: "Ich brauche aktuelle Informationen darüber.",       translation: "به اطلاعات به‌روز درباره این موضوع نیاز دارم.",  notes: "Adjective. False friend: NOT 'actually' (= eigentlich/tatsächlich)." },
  { front: "der Einfluss",            back: "تأثیر / نفوذ",              sentence: "Die Medien haben großen Einfluss auf die Meinung.", translation: "رسانه‌ها تأثیر زیادی بر نظرات دارند.",         notes: "Masculine noun. Pl: die Einflüsse. 'Einfluss nehmen auf' = to exert influence on." },
  { front: "die Zeitschrift",         back: "مجله",                      sentence: "Diese Zeitschrift erscheint monatlich.",            translation: "این مجله ماهانه منتشر می‌شود.",                notes: "Feminine noun. Pl: die Zeitschriften. 'Erscheinen' = to be published." },
  { front: "die Debatte",             back: "بحث / مناظره",              sentence: "Es gibt eine öffentliche Debatte über das Thema.",  translation: "یک بحث عمومی درباره این موضوع وجود دارد.",     notes: "Feminine noun. Pl: die Debatten. 'Eine Debatte führen' = to hold a debate." },
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
