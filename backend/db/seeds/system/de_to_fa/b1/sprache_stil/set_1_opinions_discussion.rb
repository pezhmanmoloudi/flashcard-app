set = Deck.find_by!(name: "Sprache & Stil", is_system: true, language_pair: "de_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 1 – Meinungen & Diskussion") { |s| s.position = 0 }

[
  { front: "Meiner Meinung nach …",         back: "به نظر من …",               sentence: "Meiner Meinung nach ist das falsch.",                translation: "به نظر من این اشتباه است.",                     notes: "Formal phrase. More colloquial: 'Ich denke / glaube, dass …'" },
  { front: "Ich bin der Meinung, dass …",   back: "من بر این عقیده‌ام که …",   sentence: "Ich bin der Meinung, dass wir handeln müssen.",      translation: "من بر این عقیده‌ام که باید اقدام کنیم.",        notes: "Formal. Triggers a subordinate clause with 'dass' and verb-final word order." },
  { front: "Ich stimme zu",                 back: "موافقم",                    sentence: "Ich stimme dir vollkommen zu.",                      translation: "کاملاً موافقت می‌کنم.",                         notes: "Separable verb: zustimmen. 'Jemandem zustimmen' + Dative." },
  { front: "Ich stimme nicht zu",           back: "مخالفم / موافق نیستم",      sentence: "Damit stimme ich überhaupt nicht zu.",               translation: "من اصلاً با این موافق نیستم.",                  notes: "Polite disagreement. More formal than 'Das finde ich nicht'." },
  { front: "Einerseits … andererseits …",   back: "از یک طرف … از طرف دیگر …", sentence: "Einerseits ist es günstig, andererseits riskant.",    translation: "از یک طرف ارزان است، از طرف دیگر ریسک دارد.",  notes: "Classic essay connector for presenting two sides of an argument." },
  { front: "im Gegensatz zu …",             back: "در مقابل … / برخلاف …",     sentence: "Im Gegensatz zu früher ist das jetzt normal.",       translation: "برخلاف قبل، این حالا عادی است.",               notes: "Preposition phrase. Takes Dative. Used for contrast." },
  { front: "Darüber hinaus …",              back: "علاوه بر این …",            sentence: "Darüber hinaus gibt es weitere Vorteile.",           translation: "علاوه بر این، مزایای دیگری هم وجود دارد.",     notes: "Formal connector. Adds a further argument. Often starts a sentence." },
  { front: "Allerdings …",                  back: "با این حال … / البته …",    sentence: "Es ist günstig. Allerdings ist die Qualität schlecht.", translation: "ارزان است. با این حال کیفیت پایین است.",      notes: "Connector expressing concession or contrast. Often used mid-sentence." },
  { front: "Obwohl …",                      back: "اگرچه … / با وجود اینکه …", sentence: "Obwohl es teuer ist, kaufe ich es.",                 translation: "اگرچه گران است، آن را می‌خرم.",                notes: "Subordinating conjunction. Verb goes to the end of the clause." },
  { front: "sowohl … als auch …",           back: "هم … و هم …",               sentence: "Sowohl Kinder als auch Erwachsene können teilnehmen.", translation: "هم بچه‌ها و هم بزرگسالان می‌توانند شرکت کنند.", notes: "Correlative conjunction. Used for inclusion of both elements." },
  { front: "weder … noch …",                back: "نه … نه …",                 sentence: "Er ist weder pünktlich noch höflich.",               translation: "او نه سر وقت است نه مؤدب.",                    notes: "Correlative conjunction. Double negative without 'nicht'. Used for exclusion." },
  { front: "der Standpunkt",                back: "دیدگاه / موضع",             sentence: "Was ist Ihr Standpunkt zu dieser Frage?",             translation: "دیدگاه شما درباره این سؤال چیست؟",             notes: "Masculine noun. Pl: die Standpunkte. 'Einen Standpunkt vertreten' = to hold a view." },
  { front: "das Argument",                  back: "استدلال / برهان",           sentence: "Das ist ein starkes Argument.",                      translation: "این یک استدلال قوی است.",                      notes: "Neuter noun. Pl: die Argumente. 'Argumente vorbringen' = to put forward arguments." },
  { front: "überzeugen",                    back: "متقاعد کردن",               sentence: "Du hast mich nicht überzeugt.",                      translation: "تو مرا متقاعد نکرده‌ای.",                      notes: "Regular verb. 'Jemanden überzeugen' + Akkusativ. 'Überzeugend' = convincing." },
  { front: "kritisieren",                   back: "انتقاد کردن",               sentence: "Er kritisiert die Entscheidung offen.",               translation: "او آشکارا از تصمیم انتقاد می‌کند.",            notes: "Regular verb. kritisiere / kritisierst. 'Die Kritik' = criticism." },
  { front: "verteidigen",                   back: "دفاع کردن",                 sentence: "Sie verteidigt ihren Standpunkt sehr gut.",           translation: "او از دیدگاهش خیلی خوب دفاع می‌کند.",         notes: "Regular verb. verteidige / verteidigst. 'Die Verteidigung' = the defence." },
  { front: "zugeben",                       back: "اعتراف کردن / قبول کردن",   sentence: "Er gibt zu, dass er einen Fehler gemacht hat.",      translation: "او اعتراف می‌کند که اشتباه کرده است.",         notes: "Separable strong verb. gebe zu / gibst zu / gibt zu. Verb-final in subordinate clause." },
  { front: "vorschlagen",                   back: "پیشنهاد دادن",              sentence: "Ich schlage vor, dass wir eine Pause machen.",       translation: "پیشنهاد می‌دهم که یک استراحت بکنیم.",          notes: "Separable strong verb. schlage vor / schlägst vor. 'Der Vorschlag' = the suggestion." },
  { front: "zusammenfassen",                back: "خلاصه کردن",                sentence: "Können Sie das kurz zusammenfassen?",                 translation: "می‌توانید آن را کوتاه خلاصه کنید؟",           notes: "Separable verb. fasse zusammen / fasst zusammen. 'Die Zusammenfassung' = the summary." },
  { front: "die Debatte",                   back: "بحث / مناظره",              sentence: "Die Debatte war sehr lebhaft.",                      translation: "بحث خیلی پویا بود.",                           notes: "Feminine noun. Pl: die Debatten. 'Eine Debatte führen/moderieren' = to run/moderate." },
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
