set = Deck.find_by!(name: "Basics", is_system: true, language_pair: "en_to_fa")
          .flashcard_sets
          .find_or_create_by!(name: "Set 1 – Greetings & Essentials") { |s| s.position = 0 }

[
  { front: "Hello",            back: "سلام",              sentence: "Hello! How are you?",                    translation: "سلام! حالت چطوره؟",                     notes: "Most common greeting. Informal and formal." },
  { front: "Good morning",     back: "صبح بخیر",          sentence: "Good morning! Did you sleep well?",      translation: "صبح بخیر! خوب خوابیدی؟",               notes: "Used until midday." },
  { front: "Good evening",     back: "عصر بخیر / شب بخیر", sentence: "Good evening, welcome!",              translation: "عصر بخیر، خوش آمدید!",                  notes: "عصر بخیر = good afternoon/evening. شب بخیر = good night." },
  { front: "Goodbye",          back: "خداحافظ",           sentence: "Goodbye, see you tomorrow!",             translation: "خداحافظ، فردا می‌بینمت!",               notes: "Standard farewell. Literally 'God protect you'." },
  { front: "Please",           back: "لطفاً",             sentence: "Please help me.",                        translation: "لطفاً کمکم کن.",                        notes: "Polite request word. Always well-received." },
  { front: "Thank you",        back: "ممنونم / متشکرم",   sentence: "Thank you very much!",                   translation: "خیلی ممنونم!",                          notes: "ممنونم is more informal; متشکرم is slightly more formal." },
  { front: "You're welcome",   back: "خواهش می‌کنم",      sentence: "Thank you! – You're welcome.",           translation: "ممنون! – خواهش می‌کنم.",                notes: "Standard response to thanks." },
  { front: "Sorry / Excuse me", back: "ببخشید",           sentence: "Excuse me, where is the station?",       translation: "ببخشید، ایستگاه کجاست؟",               notes: "Used for apology and to get attention." },
  { front: "Yes",              back: "بله / آره",          sentence: "Yes, I understand.",                     translation: "بله، می‌فهمم.",                         notes: "بله is formal; آره is informal." },
  { front: "No",               back: "نه / خیر",           sentence: "No, I don't want that.",                 translation: "نه، اون رو نمی‌خوام.",                  notes: "نه is informal; خیر is formal." },
  { front: "How are you?",     back: "حالت چطوره؟",       sentence: "Hi! How are you?",                       translation: "سلام! حالت چطوره؟",                     notes: "Informal. Formal: حال شما چطور است؟" },
  { front: "I'm fine",         back: "خوبم",              sentence: "How are you? – I'm fine, thanks.",       translation: "حالت چطوره؟ – خوبم، ممنون.",            notes: "خوبم = I'm well/fine." },
  { front: "My name is…",      back: "اسمم … هست",        sentence: "My name is Sara.",                       translation: "اسمم سارا هست.",                        notes: "Introduce yourself. Also: اسم من … است." },
  { front: "What is your name?", back: "اسمت چیه؟",       sentence: "Hello! What is your name?",              translation: "سلام! اسمت چیه؟",                       notes: "Informal. Formal: اسم شما چیست؟" },
  { front: "I don't understand", back: "نمی‌فهمم",        sentence: "Sorry, I don't understand.",             translation: "ببخشید، نمی‌فهمم.",                     notes: "Essential phrase for learners." },
  { front: "Can you repeat?",  back: "می‌تونی تکرار کنی؟", sentence: "Can you repeat that please?",           translation: "می‌تونی اون رو تکرار کنی لطفاً؟",      notes: "Informal. Formal: می‌توانید تکرار کنید؟" },
  { front: "I speak a little Persian", back: "یه کم فارسی بلدم", sentence: "I speak a little Persian.",      translation: "یه کم فارسی بلدم.",                     notes: "Useful phrase for beginners." },
  { front: "Where are you from?", back: "اهل کجایی؟",    sentence: "Where are you from?",                    translation: "اهل کجایی؟",                            notes: "Informal. Formal: اهل کجا هستید؟" },
  { front: "I am from…",       back: "اهل … هستم",        sentence: "I am from England.",                     translation: "اهل انگلستان هستم.",                    notes: "State your home country." },
  { front: "Nice to meet you", back: "خوشوقتم",          sentence: "Nice to meet you!",                       translation: "خوشوقتم!",                              notes: "Lit. 'I am pleased'. Also: از آشناییتون خوشوقتم." },
].each do |c|
  Flashcard.find_or_create_by!(flashcard_set: set, front_text: c[:front]) do |f|
    f.back_text           = c[:back]
    f.example_sentence    = c[:sentence]
    f.translated_sentence = c[:translation]
    f.grammar_notes       = c[:notes]
    f.source_language     = "english"
    f.target_language     = "persian"
  end
end
