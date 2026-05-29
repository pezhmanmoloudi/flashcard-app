class MakeFlashcardSetIdNotNullOnFlashcards < ActiveRecord::Migration[8.0]
  def up
    change_column_null :flashcards, :flashcard_set_id, false
  end

  def down
    change_column_null :flashcards, :flashcard_set_id, true
  end
end
