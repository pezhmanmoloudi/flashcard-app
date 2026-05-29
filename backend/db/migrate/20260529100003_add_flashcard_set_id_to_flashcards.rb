class AddFlashcardSetIdToFlashcards < ActiveRecord::Migration[8.0]
  def change
    add_reference :flashcards, :flashcard_set, null: true, foreign_key: { on_delete: :cascade }
  end
end
