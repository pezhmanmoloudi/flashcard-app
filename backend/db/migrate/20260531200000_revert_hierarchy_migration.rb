class RevertHierarchyMigration < ActiveRecord::Migration[8.0]
  def up
    # 1. Re-add deck_id to tables that had it before the hierarchy refactor
    add_column :flashcard_sets, :deck_id, :bigint
    add_column :study_sessions, :deck_id, :bigint
    add_column :quiz_sessions,  :deck_id, :bigint

    # 2. Re-populate deck_id via the level→language_pair→deck path
    execute <<~SQL
      UPDATE flashcard_sets
      SET deck_id = (
        SELECT d.id FROM decks d
        JOIN levels     l  ON l.id  = flashcard_sets.level_id
        JOIN language_pairs lp ON lp.id = l.language_pair_id
        WHERE d.level = l.name AND d.language_pair = lp.code
        LIMIT 1
      )
    SQL

    execute <<~SQL
      UPDATE study_sessions
      SET deck_id = (
        SELECT d.id FROM decks d
        JOIN levels     l  ON l.id  = study_sessions.level_id
        JOIN language_pairs lp ON lp.id = l.language_pair_id
        WHERE d.level = l.name AND d.language_pair = lp.code
        LIMIT 1
      )
    SQL

    execute <<~SQL
      UPDATE quiz_sessions
      SET deck_id = (
        SELECT d.id FROM decks d
        JOIN levels     l  ON l.id  = quiz_sessions.level_id
        JOIN language_pairs lp ON lp.id = l.language_pair_id
        WHERE d.level = l.name AND d.language_pair = lp.code
        LIMIT 1
      )
    SQL

    # 3. Enforce NOT NULL now that data is populated
    change_column_null :flashcard_sets, :deck_id, false
    change_column_null :study_sessions, :deck_id, false
    change_column_null :quiz_sessions,  :deck_id, false

    # 4. Re-add FK constraints and indexes
    add_foreign_key :flashcard_sets, :decks
    add_foreign_key :study_sessions, :decks
    add_foreign_key :quiz_sessions,  :decks

    add_index :flashcard_sets, :deck_id,                  name: "index_flashcard_sets_on_deck_id"
    add_index :flashcard_sets, %i[deck_id position],      name: "index_flashcard_sets_on_deck_id_and_position"
    add_index :study_sessions, :deck_id,                  name: "index_study_sessions_on_deck_id"
    add_index :quiz_sessions,  :deck_id,                  name: "index_quiz_sessions_on_deck_id"

    # 5. Drop level_id from the three tables
    remove_foreign_key :flashcard_sets, :levels
    remove_index  :flashcard_sets, name: "index_flashcard_sets_on_level_id_and_position", if_exists: true
    remove_column :flashcard_sets, :level_id

    remove_foreign_key :study_sessions, :levels
    remove_index  :study_sessions, name: "index_study_sessions_on_level_id", if_exists: true
    remove_column :study_sessions, :level_id

    remove_foreign_key :quiz_sessions, :levels
    remove_index  :quiz_sessions, name: "index_quiz_sessions_on_level_id", if_exists: true
    remove_column :quiz_sessions, :level_id

    # 6. Re-add language_pair string to review_sessions and populate from FK
    add_column :review_sessions, :language_pair, :string

    execute <<~SQL
      UPDATE review_sessions
      SET language_pair = (
        SELECT lp.code FROM language_pairs lp
        WHERE lp.id = review_sessions.language_pair_id
      )
    SQL

    change_column_null :review_sessions, :language_pair, false
    add_index :review_sessions, %i[user_id language_pair], name: "index_review_sessions_on_user_id_and_language_pair"

    # 7. Drop language_pair_id from review_sessions
    remove_foreign_key :review_sessions, :language_pairs
    remove_index  :review_sessions, name: "index_review_sessions_on_language_pair_id",              if_exists: true
    remove_index  :review_sessions, name: "index_review_sessions_on_user_id_and_language_pair_id",  if_exists: true
    remove_column :review_sessions, :language_pair_id

    # 8. Drop the hierarchy tables
    drop_table :levels
    drop_table :language_pairs
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
