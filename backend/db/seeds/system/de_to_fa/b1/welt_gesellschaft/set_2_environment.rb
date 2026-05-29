set = Deck.find_by!(name: "Welt & Gesellschaft", is_system: true, language_pair: "de_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 2 – Umwelt & Klima") { |s| s.position = 1 }

[
  { front: "die Umwelt",                    back: "محیط زیست",                sentence: "Wir müssen die Umwelt schützen.",                    translation: "باید از محیط زیست محافظت کنیم.",               notes: "Feminine noun. 'Umweltschutz' = environmental protection. Key B1 topic." },
  { front: "der Klimawandel",               back: "تغییرات آب و هوایی",        sentence: "Der Klimawandel ist eine globale Herausforderung.",   translation: "تغییرات آب و هوایی یک چالش جهانی است.",        notes: "Masculine noun. 'Das Klima' + 'der Wandel' = climate change. High-frequency topic." },
  { front: "die Energie",                   back: "انرژی",                    sentence: "Wir verbrauchen zu viel Energie.",                   translation: "ما خیلی زیاد انرژی مصرف می‌کنیم.",              notes: "Feminine noun. Pl: die Energien. 'Energieverbrauch' = energy consumption." },
  { front: "recyceln",                      back: "بازیافت کردن",             sentence: "In Deutschland muss man Müll trennen und recyceln.",  translation: "در آلمان باید زباله را تفکیک و بازیافت کرد.",   notes: "Regular verb. recycle / recyclest / recycelt. Loanword from English." },
  { front: "der Müll",                      back: "زباله",                    sentence: "Bitte wirf den Müll nicht auf die Straße.",          translation: "لطفاً زباله را روی خیابان نینداز.",              notes: "Masculine noun. Uncountable. 'Mülltrennung' = waste separation." },
  { front: "das Plastik",                   back: "پلاستیک",                  sentence: "Viele Länder wollen Plastiktüten verbieten.",         translation: "بسیاری از کشورها می‌خواهند کیسه‌های پلاستیکی را ممنوع کنند.", notes: "Neuter noun. 'Plastikfrei' = plastic-free. 'Einwegplastik' = single-use plastic." },
  { front: "erneuerbar",                    back: "تجدیدپذیر",                sentence: "Erneuerbare Energien sind die Zukunft.",              translation: "انرژی‌های تجدیدپذیر آینده هستند.",              notes: "Adjective. 'Erneuerbare Energien' = renewable energies (wind, solar, etc.)." },
  { front: "die Verschmutzung",             back: "آلودگی",                   sentence: "Die Luftverschmutzung in der Stadt ist ein Problem.", translation: "آلودگی هوا در شهر یک مشکل است.",               notes: "Feminine noun. 'Luftverschmutzung' = air pollution. 'Wasserverschmutzung' = water pollution." },
  { front: "schützen",                      back: "محافظت کردن / حفاظت کردن", sentence: "Wir müssen die Artenvielfalt schützen.",              translation: "باید از تنوع زیستی محافظت کنیم.",              notes: "Regular verb. schütze / schützt. 'Jemanden vor etwas schützen' + Dative." },
  { front: "der Wald",                      back: "جنگل",                     sentence: "In Deutschland gibt es viele Wälder.",               translation: "در آلمان جنگل‌های زیادی وجود دارد.",            notes: "Masculine noun. Pl: die Wälder. 'Waldsterben' = forest dieback." },
  { front: "nachhaltig",                    back: "پایدار / پایدارانه",       sentence: "Wir versuchen, nachhaltiger zu leben.",              translation: "سعی می‌کنیم پایدارتر زندگی کنیم.",             notes: "Adjective. 'Nachhaltigkeit' = sustainability. Central B1+ concept." },
  { front: "der Treibhauseffekt",           back: "اثر گلخانه‌ای",            sentence: "Der Treibhauseffekt führt zur Erderwärmung.",         translation: "اثر گلخانه‌ای منجر به گرمایش زمین می‌شود.",    notes: "Masculine noun. 'Treibhausgas' = greenhouse gas. Essential climate vocabulary." },
  { front: "das Solarpanel",                back: "پنل خورشیدی",              sentence: "Sie haben Solarpanele auf dem Dach installiert.",     translation: "آنها پنل‌های خورشیدی روی سقف نصب کرده‌اند.",  notes: "Neuter noun. Also: die Solaranlage. 'Solarenergie' = solar energy." },
  { front: "der CO₂-Ausstoß",              back: "انتشار دی‌اکسید کربن",     sentence: "Deutschland will den CO₂-Ausstoß reduzieren.",        translation: "آلمان می‌خواهد انتشار دی‌اکسید کربن را کاهش دهد.", notes: "Masculine noun. Read: 'CO-zwei-Ausstoß'. 'Den Ausstoß reduzieren' = to cut emissions." },
  { front: "öffentliche Verkehrsmittel",    back: "حمل‌ونقل عمومی",           sentence: "Ich benutze lieber öffentliche Verkehrsmittel.",      translation: "ترجیح می‌دهم از حمل‌ونقل عمومی استفاده کنم.",  notes: "Always plural. 'Mit öffentlichen Verkehrsmitteln fahren' = to use public transport." },
  { front: "sparen",                        back: "صرفه‌جویی کردن",           sentence: "Man sollte Energie und Wasser sparen.",              translation: "باید در مصرف انرژی و آب صرفه‌جویی کرد.",       notes: "Regular verb. Here: to save/conserve (resources). Also: to save money." },
  { front: "die Luft",                      back: "هوا",                      sentence: "Hier ist die Luft sehr frisch.",                     translation: "هوا اینجا خیلی تازه است.",                      notes: "Feminine noun. 'Luftqualität' = air quality. 'An die frische Luft' = outdoors." },
  { front: "das Wasser",                    back: "آب",                       sentence: "Sauberes Trinkwasser ist ein Menschenrecht.",         translation: "آب آشامیدنی تمیز یک حق بشری است.",             notes: "Neuter noun. 'Trinkwasser' = drinking water. 'Wasserknappheit' = water scarcity." },
  { front: "global",                        back: "جهانی",                    sentence: "Der Klimawandel ist ein globales Problem.",           translation: "تغییر آب و هوا یک مشکل جهانی است.",            notes: "Adjective. 'Globalisierung' = globalisation. 'Global denken' = to think globally." },
  { front: "der Naturschutz",               back: "حفاظت از طبیعت",           sentence: "Naturschutz ist wichtig für zukünftige Generationen.", translation: "حفاظت از طبیعت برای نسل‌های آینده مهم است.",   notes: "Masculine noun. 'Naturschutzgebiet' = nature reserve. 'Naturschützer' = conservationist." },
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
