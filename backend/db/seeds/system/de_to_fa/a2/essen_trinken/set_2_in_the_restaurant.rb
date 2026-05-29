set = Deck.find_by!(name: "Essen & Trinken", is_system: true)
          .flashcard_sets
          .find_or_create_by!(name: "Set 2 – In the Restaurant") { |s| s.position = 1 }

[
  { front: "die Speisekarte", back: "منو",         sentence: "Kann ich bitte die Speisekarte haben?", translation: "می‌توانم منو بگیرم؟",         notes: "Feminine noun. Pl: die Speisekarten. Also: die Karte." },
  { front: "bestellen",       back: "سفارش دادن",  sentence: "Ich möchte bestellen.",             translation: "می‌خواهم سفارش بدهم.",          notes: "Regular verb. bestelle / bestellst / bestellt." },
  { front: "die Vorspeise",   back: "پیش‌غذا",     sentence: "Als Vorspeise nehme ich die Suppe.", translation: "برای پیش‌غذا سوپ می‌گیرم.",    notes: "Feminine noun. Pl: die Vorspeisen." },
  { front: "das Hauptgericht", back: "غذای اصلی",  sentence: "Was ist das Hauptgericht heute?",   translation: "امروز غذای اصلی چیست؟",         notes: "Neuter noun. Pl: die Hauptgerichte." },
  { front: "die Nachspeise",  back: "دسر",         sentence: "Als Nachspeise möchte ich Eis.",    translation: "برای دسر بستنی می‌خواهم.",      notes: "Feminine noun. Pl: die Nachspeisen. Also: das Dessert." },
  { front: "der Kellner",     back: "گارسون",      sentence: "Der Kellner kommt gleich.",         translation: "گارسون الان می‌آید.",            notes: "Masculine noun. Pl: die Kellner. Fem: die Kellnerin." },
  { front: "die Rechnung",    back: "صورتحساب",    sentence: "Zahlen bitte! / Die Rechnung, bitte!", translation: "حساب کنید، لطفاً!",          notes: "Feminine noun. Pl: die Rechnungen." },
  { front: "die Portion",     back: "پرس",         sentence: "Die Portion ist sehr groß.",        translation: "پرس خیلی بزرگ است.",            notes: "Feminine noun. Pl: die Portionen." },
  { front: "das Trinkgeld",   back: "انعام",       sentence: "Das Trinkgeld ist in Deutschland üblich.", translation: "انعام در آلمان رسم است.", notes: "Neuter noun. No plural. Literally 'drinking money'." },
  { front: "empfehlen",       back: "پیشنهاد دادن", sentence: "Was können Sie empfehlen?",        translation: "چه چیزی پیشنهاد می‌دهید؟",     notes: "Strong verb. empfehle / empfiehlst / empfiehlt." },
  { front: "die Suppe",       back: "سوپ",         sentence: "Heute gibt es Tomatensuppe.",       translation: "امروز سوپ گوجه داریم.",         notes: "Feminine noun. Pl: die Suppen." },
  { front: "das Schnitzel",   back: "اشنیتسل",     sentence: "Ein Wiener Schnitzel, bitte.",      translation: "یک اشنیتسل وینی، لطفاً.",       notes: "Neuter noun. Pl: die Schnitzel. Classic German/Austrian dish." },
  { front: "der Braten",      back: "برشته / کباب", sentence: "Der Braten ist heute besonders gut.", translation: "برشته امروز خیلی خوبه.",      notes: "Masculine noun. Pl: die Braten. Roasted meat dish." },
  { front: "vegetarisch",     back: "گیاهی",       sentence: "Haben Sie etwas Vegetarisches?",    translation: "آیا چیز گیاهی دارید؟",          notes: "Adjective. 'Vegan' = without any animal products." },
  { front: "die Allergie",    back: "آلرژی",       sentence: "Ich habe eine Nussallergie.",       translation: "به آجیل آلرژی دارم.",           notes: "Feminine noun. Pl: die Allergien." },
  { front: "schmecken",       back: "مزه دادن",    sentence: "Schmeckt das Essen?",               translation: "غذا خوشمزه‌ست؟",               notes: "Regular verb. schmecke / schmeckst / schmeckt." },
  { front: "salzig",          back: "شور",         sentence: "Das Essen ist zu salzig.",          translation: "غذا خیلی شوره.",               notes: "Adjective. Opposite: süß (sweet)." },
  { front: "süß",             back: "شیرین",       sentence: "Der Kuchen ist sehr süß.",          translation: "کیک خیلی شیرین است.",           notes: "Adjective. Also means 'cute' in informal use." },
  { front: "scharf",          back: "تند",         sentence: "Das Curry ist sehr scharf.",        translation: "کاری خیلی تند است.",            notes: "Adjective. Means spicy/hot. Also: sharp (knife)." },
  { front: "sauer",           back: "ترش",         sentence: "Die Zitrone ist sauer.",            translation: "لیمو ترش است.",                 notes: "Adjective. Also means 'annoyed' in informal speech." },
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
