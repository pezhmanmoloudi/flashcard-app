set = Deck.find_by!(name: "Alltag", is_system: true, language_pair: "de_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 2 – Food Basics") { |s| s.position = 1 }

[
  { front: "das Brot",      back: "نان",         sentence: "Ich esse morgens Brot mit Butter.", translation: "صبح‌ها نان با کره می‌خورم.",    notes: "Neuter noun. Pl: die Brote. Central part of German breakfast." },
  { front: "die Butter",    back: "کره",         sentence: "Gib mir bitte die Butter.",        translation: "لطفاً کره را به من بده.",        notes: "Feminine noun. No plural in common use." },
  { front: "das Ei",        back: "تخم مرغ",     sentence: "Ich esse jeden Tag ein Ei.",       translation: "هر روز یک تخم مرغ می‌خورم.",    notes: "Neuter noun. Pl: die Eier." },
  { front: "die Milch",     back: "شیر",         sentence: "Die Milch ist kalt.",              translation: "شیر سرد است.",                  notes: "Feminine noun. No plural in common use." },
  { front: "der Käse",      back: "پنیر",        sentence: "Deutschland hat viele Käsesorten.",  translation: "آلمان انواع زیادی پنیر دارد.", notes: "Masculine noun. Pl: die Käsesorten (types of cheese)." },
  { front: "das Fleisch",   back: "گوشت",        sentence: "Ich esse kein Fleisch.",           translation: "من گوشت نمی‌خورم.",              notes: "Neuter noun. No plural. 'Kein Fleisch' = vegetarian." },
  { front: "der Fisch",     back: "ماهی",        sentence: "Der Fisch schmeckt gut.",          translation: "ماهی خوشمزه است.",              notes: "Masculine noun. Pl: die Fische." },
  { front: "das Gemüse",    back: "سبزیجات",     sentence: "Iss mehr Gemüse!",                 translation: "بیشتر سبزیجات بخور!",           notes: "Neuter noun. Usually singular (collective noun)." },
  { front: "das Obst",      back: "میوه",        sentence: "Obst ist gesund.",                 translation: "میوه سالم است.",                notes: "Neuter noun. Usually singular (collective noun)." },
  { front: "das Wasser",    back: "آب",          sentence: "Ich trinke viel Wasser.",          translation: "زیاد آب می‌نوشم.",              notes: "Neuter noun. 'Stilles Wasser' = still water." },
  { front: "der Kaffee",    back: "قهوه",        sentence: "Jeden Morgen trinke ich Kaffee.",  translation: "هر صبح قهوه می‌نوشم.",          notes: "Masculine noun. Pl: die Kaffees (cups of coffee)." },
  { front: "der Tee",       back: "چای",         sentence: "Magst du Tee mit Milch?",          translation: "چای با شیر دوست داری؟",         notes: "Masculine noun. Pl: die Tees." },
  { front: "der Saft",      back: "آبمیوه",      sentence: "Ich trinke gern Orangensaft.",     translation: "دوست دارم آب پرتقال بنوشم.",    notes: "Masculine noun. Pl: die Säfte." },
  { front: "der Zucker",    back: "شکر",         sentence: "Nimmst du Zucker in den Kaffee?",  translation: "توی قهوه‌ات شکر می‌ریزی؟",      notes: "Masculine noun. No plural in common use." },
  { front: "das Salz",      back: "نمک",         sentence: "Das Essen braucht etwas Salz.",    translation: "غذا کمی نمک لازم دارد.",        notes: "Neuter noun. 'Zu salzig' = too salty." },
  { front: "essen",         back: "خوردن",       sentence: "Was möchtest du essen?",           translation: "چی می‌خوای بخوری؟",             notes: "Irregular verb. esse / isst / isst. Strong verb." },
  { front: "trinken",       back: "نوشیدن",      sentence: "Er trinkt jeden Abend Tee.",       translation: "هر شب چای می‌نوشد.",            notes: "Irregular verb. trinke / trinkst / trinkt." },
  { front: "kochen",        back: "آشپزی کردن",  sentence: "Ich koche heute Abend.",           translation: "امشب آشپزی می‌کنم.",            notes: "Regular verb. koche / kochst / kocht." },
  { front: "lecker",        back: "خوشمزه",      sentence: "Das Essen ist sehr lecker.",       translation: "غذا خیلی خوشمزه است.",          notes: "Adjective. Informal but widely used. Formal: köstlich." },
  { front: "hungrig",       back: "گرسنه",       sentence: "Ich bin hungrig.",                 translation: "گرسنه‌ام.",                     notes: "Adjective. Opposite: satt (full). 'Hunger haben' is also common." },
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
