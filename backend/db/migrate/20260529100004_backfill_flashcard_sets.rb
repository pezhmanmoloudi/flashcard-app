class BackfillFlashcardSets < ActiveRecord::Migration[8.0]
  # Inline AR classes to avoid dependency on current model state.
  class MigrationDeck < ApplicationRecord
    self.table_name = "decks"
  end

  class MigrationFlashcardSet < ApplicationRecord
    self.table_name = "flashcard_sets"
  end

  class MigrationFlashcard < ApplicationRecord
    self.table_name = "flashcards"
  end

  def up
    MigrationDeck.find_each do |deck|
      set = MigrationFlashcardSet.create!(
        deck_id:     deck.id,
        name:        "Set 1",
        description: nil,
        position:    0
      )
      MigrationFlashcard.where(deck_id: deck.id).update_all(flashcard_set_id: set.id)
    end
  end

  def down
    MigrationFlashcard.update_all(flashcard_set_id: nil)
    MigrationFlashcardSet.delete_all
  end
end
