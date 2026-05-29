set = Deck.find_by!(name: "Kommunikation", is_system: true)
          .flashcard_sets
          .find_or_create_by!(name: "Set 3 – Idioms & Expressions") { |s| s.position = 2 }

[
  { front: "Das ist nicht mein Bier.",  back: "That's not my problem / Not my business.", sentence: "Was er macht, ist nicht mein Bier.", translation: "What he does is not my business.", notes: "Colloquial idiom. Bier (beer) used figuratively." },
  { front: "auf dem Laufenden bleiben", back: "to stay up to date",       sentence: "Ich versuche, auf dem Laufenden zu bleiben.", translation: "I try to stay up to date.",       notes: "Fixed expression. 'Auf dem Laufenden halten' = to keep someone updated." },
  { front: "unter vier Augen",          back: "in private / one-on-one",  sentence: "Können wir das unter vier Augen besprechen?", translation: "Can we discuss this in private?", notes: "Idiom. Literally 'under four eyes'." },
  { front: "jemandem auf den Zahn fühlen", back: "to quiz someone / probe someone", sentence: "Der Journalist fühlte dem Politiker auf den Zahn.", translation: "The journalist probed the politician.", notes: "Idiom. Literally 'to feel someone's tooth'." },
  { front: "ins Schwarze treffen",      back: "to hit the nail on the head", sentence: "Mit dieser Bemerkung hat er ins Schwarze getroffen.", translation: "With that remark, he hit the nail on the head.", notes: "Idiom. Literally 'to hit the black (bullseye)'." },
  { front: "jemandem auf die Nerven gehen", back: "to get on someone's nerves", sentence: "Er geht mir so auf die Nerven!", translation: "He gets on my nerves so much!",      notes: "Common colloquial expression." },
  { front: "zwei Fliegen mit einer Klappe schlagen", back: "to kill two birds with one stone", sentence: "Mit diesem Kurs schlage ich zwei Fliegen mit einer Klappe.", translation: "With this course, I kill two birds with one stone.", notes: "Idiom. Literally 'to hit two flies with one flap'." },
  { front: "um den heißen Brei herumreden", back: "to beat around the bush", sentence: "Hör auf, um den heißen Brei herumzureden!", translation: "Stop beating around the bush!", notes: "Idiom. Literally 'to talk around the hot porridge'." },
  { front: "den Nagel auf den Kopf treffen", back: "to hit the nail on the head", sentence: "Da hast du den Nagel auf den Kopf getroffen.", translation: "You've hit the nail on the head.", notes: "Idiom. Similar to 'ins Schwarze treffen'." },
  { front: "die Nase voll haben",       back: "to be fed up",              sentence: "Ich habe die Nase voll von diesem Regen.", translation: "I'm fed up with this rain.",        notes: "Colloquial idiom. Literally 'to have one's nose full'." },
  { front: "auf der Hand liegen",       back: "to be obvious",             sentence: "Das liegt doch auf der Hand!",           translation: "That's obvious!",                    notes: "Idiom. Literally 'to lie on the hand'." },
  { front: "Daumen drücken",            back: "to keep one's fingers crossed", sentence: "Drück mir die Daumen!",              translation: "Keep your fingers crossed for me!",  notes: "German: press thumbs (not fingers). Same meaning." },
  { front: "jemandem den Rücken stärken", back: "to back someone up",    sentence: "Sie hat mir immer den Rücken gestärkt.", translation: "She has always backed me up.",       notes: "Idiom. Literally 'to strengthen someone's back'." },
  { front: "über den Tellerrand schauen", back: "to think outside the box", sentence: "Wir müssen über den Tellerrand schauen.", translation: "We need to think outside the box.", notes: "Idiom. Literally 'to look beyond the edge of the plate'." },
  { front: "im Handumdrehen",           back: "in no time / in a flash",  sentence: "Das ist im Handumdrehen erledigt.",      translation: "That's done in no time.",             notes: "Adverbial idiom. Literally 'in the turning of a hand'." },
  { front: "ums Eck denken",            back: "to think laterally",        sentence: "Man muss manchmal ums Eck denken.",      translation: "Sometimes you have to think laterally.", notes: "Idiom. Literally 'to think around the corner'." },
  { front: "von vorne anfangen",        back: "to start from scratch",     sentence: "Wir müssen von vorne anfangen.",         translation: "We have to start from scratch.",     notes: "Phrase. 'Ganz von vorne' = completely from scratch." },
  { front: "in der Klemme sitzen",      back: "to be in a fix / jam",      sentence: "Ich sitze gerade in der Klemme.",       translation: "I'm in a bit of a fix right now.",   notes: "Idiom. Literally 'to sit in the clamp'." },
  { front: "unter Druck stehen",        back: "to be under pressure",      sentence: "Er steht im Moment sehr unter Druck.",   translation: "He is under a lot of pressure at the moment.", notes: "Fixed expression. 'Jemanden unter Druck setzen' = to pressure sb." },
  { front: "Butter bei die Fische",     back: "get to the point",          sentence: "Butter bei die Fische – was willst du?", translation: "Get to the point – what do you want?", notes: "Northern German idiom. Literally 'put butter with the fish'." },
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
