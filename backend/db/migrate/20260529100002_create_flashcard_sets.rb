class CreateFlashcardSets < ActiveRecord::Migration[8.0]
  def change
    create_table :flashcard_sets do |t|
      t.references :deck, null: false, foreign_key: { on_delete: :cascade }
      t.string  :name,        null: false
      t.text    :description
      t.integer :position,    null: false, default: 0

      t.timestamps
    end

    add_index :flashcard_sets, [:deck_id, :position]
  end
end
