class AddSystemFieldsToDecks < ActiveRecord::Migration[8.0]
  def up
    # Drop the FK before making user_id nullable
    remove_foreign_key :decks, :users

    change_column :decks, :user_id, :bigint, null: true
    add_foreign_key :decks, :users, on_delete: :cascade

    add_column :decks, :is_system,     :boolean, default: false, null: false
    add_column :decks, :level,         :string
    add_column :decks, :language_pair, :string
    add_column :decks, :position,      :integer, default: 0, null: false

    add_index :decks, :is_system
    add_index :decks, :language_pair
    add_index :decks, :level
  end

  def down
    remove_index :decks, :level
    remove_index :decks, :language_pair
    remove_index :decks, :is_system

    remove_column :decks, :position
    remove_column :decks, :language_pair
    remove_column :decks, :level
    remove_column :decks, :is_system

    remove_foreign_key :decks, :users
    change_column :decks, :user_id, :bigint, null: false
    add_foreign_key :decks, :users, on_delete: :cascade
  end
end
