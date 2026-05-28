class AddTranslatedSentenceAndGrammarNotesToFlashcards < ActiveRecord::Migration[8.0]
  def change
    add_column :flashcards, :translated_sentence, :text
    add_column :flashcards, :grammar_notes, :text
  end
end
