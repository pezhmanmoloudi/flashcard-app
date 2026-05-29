deck = Deck.find_by!(name: "Kommunikation", is_system: true)

flashcard_data = {
  "Set 1 – Opinions & Discussion" => [
    { front: "Meiner Meinung nach …",    back: "In my opinion …",          sentence: "Meiner Meinung nach ist das falsch.",    translation: "In my opinion, that is wrong.",       notes: "Formal phrase. 'Ich denke / glaube, dass …' is more casual." },
    { front: "Ich bin der Meinung, dass …", back: "I am of the opinion that …", sentence: "Ich bin der Meinung, dass wir handeln müssen.", translation: "I am of the opinion that we must act.", notes: "Formal. Triggers subordinate clause with 'dass'." },
    { front: "Ich stimme zu",            back: "I agree",                  sentence: "Ich stimme vollkommen zu.",             translation: "I completely agree.",                 notes: "'Zustimmen' (separable). 'Ich bin einverstanden' also means I agree." },
    { front: "Ich stimme nicht zu",      back: "I disagree",               sentence: "Damit stimme ich nicht zu.",            translation: "I disagree with that.",               notes: "Polite disagreement. More formal than 'Das finde ich nicht.'" },
    { front: "Einerseits … andererseits …", back: "On one hand … on the other hand …", sentence: "Einerseits ist es günstig, andererseits ist es riskant.", translation: "On one hand it's cheap, on the other it's risky.", notes: "Classic essay/discussion structure." },
    { front: "im Gegensatz zu …",         back: "in contrast to …",        sentence: "Im Gegensatz zu früher ist das jetzt normal.", translation: "In contrast to before, that is now normal.", notes: "Preposition phrase. Takes dative case." },
    { front: "Darüber hinaus …",          back: "Furthermore / Moreover …", sentence: "Darüber hinaus gibt es weitere Vorteile.", translation: "Furthermore, there are additional advantages.", notes: "Formal connector. Often starts a sentence." },
    { front: "Allerdings …",              back: "However / But …",          sentence: "Es ist günstig. Allerdings ist die Qualität schlecht.", translation: "It's cheap. However, the quality is poor.", notes: "Connector expressing a concession or contrast." },
    { front: "Obwohl …",                  back: "Although / Even though …", sentence: "Obwohl es teuer ist, kaufe ich es.",   translation: "Although it's expensive, I'm buying it.", notes: "Subordinating conjunction. Verb goes to the end." },
    { front: "sowohl … als auch …",       back: "both … and …",             sentence: "Sowohl Kinder als auch Erwachsene können teilnehmen.", translation: "Both children and adults can participate.", notes: "Correlative conjunction. Used for inclusion." },
    { front: "weder … noch …",            back: "neither … nor …",          sentence: "Er ist weder pünktlich noch höflich.", translation: "He is neither punctual nor polite.",  notes: "Correlative conjunction. Used for exclusion." },
    { front: "der Standpunkt",            back: "standpoint / point of view", sentence: "Was ist Ihr Standpunkt zu dieser Frage?", translation: "What is your standpoint on this issue?", notes: "Masculine noun. Pl: die Standpunkte." },
    { front: "das Argument",              back: "argument",                 sentence: "Das ist ein starkes Argument.",         translation: "That is a strong argument.",           notes: "Neuter noun. Pl: die Argumente." },
    { front: "überzeugen",                back: "to convince / to persuade", sentence: "Du hast mich nicht überzeugt.",        translation: "You haven't convinced me.",            notes: "Regular verb. 'Überzeugend' = convincing." },
    { front: "die Debatte",               back: "debate",                   sentence: "Sie führt eine sachliche Debatte.",     translation: "She conducts a factual debate.",       notes: "Feminine noun. Pl: die Debatten." },
    { front: "kritisieren",               back: "to criticise",             sentence: "Er kritisiert die Entscheidung.",       translation: "He criticises the decision.",          notes: "Regular verb. 'Die Kritik' = criticism." },
    { front: "verteidigen",               back: "to defend",                sentence: "Sie verteidigt ihren Standpunkt.",      translation: "She defends her standpoint.",          notes: "Regular verb. verteidig / verteidigst." },
    { front: "zugeben",                   back: "to admit",                 sentence: "Er gibt zu, dass er einen Fehler gemacht hat.", translation: "He admits that he made a mistake.", notes: "Separable verb. gebe zu / gibst zu." },
    { front: "vorschlagen",               back: "to suggest / propose",     sentence: "Ich schlage vor, dass wir eine Pause machen.", translation: "I suggest we take a break.",      notes: "Separable strong verb. schlage vor / schlägst vor." },
    { front: "zusammenfassen",            back: "to summarise",             sentence: "Können Sie das kurz zusammenfassen?",   translation: "Can you summarise that briefly?",     notes: "Separable verb. fasse zusammen / fasst zusammen." },
  ],

  "Set 2 – Formal Language" => [
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
  ],

  "Set 3 – Idioms & Expressions" => [
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
  ],
}.freeze

deck.flashcard_sets.each do |set|
  cards = DATA[set.name]
  next unless cards

  cards.each do |c|
    Flashcard.find_or_create_by!(flashcard_set: set, front_text: c[:front]) do |f|
      f.back_text           = c[:back]
      f.example_sentence    = c[:sentence]
      f.translated_sentence = c[:translation]
      f.grammar_notes       = c[:notes]
      f.source_language     = "german"
      f.target_language     = "english"
    end
  end
end

puts "  → Kommunikation flashcards seeded"
