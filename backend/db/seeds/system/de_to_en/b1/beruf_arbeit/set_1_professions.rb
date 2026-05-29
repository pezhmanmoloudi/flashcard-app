set = Deck.find_by!(name: "Beruf & Arbeit", is_system: true, language_pair: "de_to_en")
          .flashcard_sets
          .find_or_create_by!(name: "Set 1 – Professions") { |s| s.position = 0 }

[
  { front: "der Arzt / die Ärztin",   back: "doctor",       sentence: "Mein Bruder ist Arzt.",                   translation: "My brother is a doctor.",             notes: "Professions in German take no article: 'Er ist Arzt' (no 'ein')." },
  { front: "der Lehrer / die Lehrerin", back: "teacher",    sentence: "Sie ist Lehrerin an einer Grundschule.",  translation: "She is a teacher at a primary school.", notes: "Feminine form adds -in suffix." },
  { front: "der Ingenieur",            back: "engineer",    sentence: "Er arbeitet als Ingenieur bei BMW.",       translation: "He works as an engineer at BMW.",     notes: "Masculine noun. Fem: die Ingenieurin." },
  { front: "der Anwalt / die Anwältin", back: "lawyer",     sentence: "Sie ist Anwältin in einer Kanzlei.",      translation: "She is a lawyer at a law firm.",      notes: "Pl: die Anwälte." },
  { front: "der Koch / die Köchin",    back: "chef / cook", sentence: "Er ist Koch in einem Sternerestaurant.",  translation: "He is a chef at a Michelin-starred restaurant.", notes: "Pl: die Köche." },
  { front: "der Polizist",             back: "police officer", sentence: "Der Polizist hilft den Leuten.",       translation: "The police officer helps people.",    notes: "Masculine noun. Fem: die Polizistin." },
  { front: "der Architekt",            back: "architect",   sentence: "Die Architektin entwirft moderne Häuser.", translation: "The architect designs modern houses.", notes: "Masculine noun. Fem: die Architektin." },
  { front: "der Journalist",           back: "journalist",  sentence: "Sie arbeitet als Journalistin bei der FAZ.", translation: "She works as a journalist at the FAZ.", notes: "Masculine noun. Fem: die Journalistin." },
  { front: "der Krankenpfleger",       back: "nurse",       sentence: "Der Krankenpfleger ist sehr einfühlsam.", translation: "The nurse is very empathetic.",       notes: "Fem: die Krankenpflegerin. Also: die Pflegekraft." },
  { front: "der Buchhalter",           back: "accountant",  sentence: "Unser Buchhalter arbeitet sehr genau.",   translation: "Our accountant works very precisely.", notes: "Fem: die Buchhalterin." },
  { front: "der Informatiker",         back: "computer scientist / IT specialist", sentence: "Sie ist Informatikerin bei einem Start-up.", translation: "She is an IT specialist at a start-up.", notes: "From Informatik (computer science)." },
  { front: "der Elektriker",           back: "electrician", sentence: "Wir brauchen einen Elektriker.",          translation: "We need an electrician.",             notes: "Masculine noun. Fem: die Elektrikerin." },
  { front: "der Kellner",              back: "waiter",      sentence: "Der Kellner bringt gleich die Rechnung.", translation: "The waiter will bring the bill soon.", notes: "Fem: die Kellnerin." },
  { front: "der Verkäufer",            back: "salesperson", sentence: "Der Verkäufer ist sehr hilfsbereit.",     translation: "The salesperson is very helpful.",    notes: "Fem: die Verkäuferin." },
  { front: "der Fahrer",               back: "driver",      sentence: "Der Fahrer kennt die Stadt gut.",         translation: "The driver knows the city well.",     notes: "Fem: die Fahrerin. Can be bus, taxi, truck driver etc." },
  { front: "der Fotograf",             back: "photographer", sentence: "Der Fotograf macht wunderschöne Bilder.", translation: "The photographer takes beautiful pictures.", notes: "Fem: die Fotografin." },
  { front: "der Übersetzer",           back: "translator",  sentence: "Sie arbeitet als Übersetzerin.",          translation: "She works as a translator.",          notes: "Fem: die Übersetzerin. 'Dolmetscher' = interpreter (spoken)." },
  { front: "der Musiker",              back: "musician",    sentence: "Er ist Musiker und gibt Konzerte.",        translation: "He is a musician and gives concerts.", notes: "Fem: die Musikerin." },
  { front: "der Wissenschaftler",      back: "scientist",   sentence: "Die Wissenschaftlerin forscht über Klimawandel.", translation: "The scientist researches climate change.", notes: "Fem: die Wissenschaftlerin." },
  { front: "der Selbstständige",       back: "self-employed person / freelancer", sentence: "Er ist selbstständig und hat seine eigene Firma.", translation: "He is self-employed and has his own company.", notes: "Adjective used as noun. 'Freelancer' is also used." },
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
