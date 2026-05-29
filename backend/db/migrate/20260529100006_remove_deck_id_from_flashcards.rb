class RemoveDeckIdFromFlashcards < ActiveRecord::Migration[8.0]
  def up
    remove_foreign_key :flashcards, :decks
    remove_index       :flashcards, :deck_id
    remove_column      :flashcards, :deck_id
  end

  def down
    add_column    :flashcards, :deck_id, :bigint
    add_index     :flashcards, :deck_id, name: "index_flashcards_on_deck_id"
    add_foreign_key :flashcards, :decks
  end
end
