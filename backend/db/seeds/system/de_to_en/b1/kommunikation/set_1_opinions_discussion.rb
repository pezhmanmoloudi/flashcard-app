set = Deck.find_by!(name: "Kommunikation", is_system: true, language_pair: "de_to_en")
          .flashcard_sets
          .find_or_create_by!(name: "Set 1 – Opinions & Discussion") { |s| s.position = 0 }

[
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
