class CreateQuizSessions < ActiveRecord::Migration[8.0]
  def change
    create_table :quiz_sessions do |t|
      t.references :user,            null: false, foreign_key: true
      t.references :deck,            null: false, foreign_key: true
      t.string     :quiz_type,       null: false
      t.integer    :total_questions, null: false, default: 0
      t.integer    :correct_answers, null: false, default: 0
      t.datetime   :completed_at

      t.timestamps
    end

    add_index :quiz_sessions, [:user_id, :created_at]
  end
end
