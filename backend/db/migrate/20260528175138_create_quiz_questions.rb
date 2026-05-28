class CreateQuizQuestions < ActiveRecord::Migration[8.0]
  def change
    create_table :quiz_questions do |t|
      t.references :quiz_session,       null: false, foreign_key: true
      t.references :flashcard,          null: false, foreign_key: true
      t.string     :question_type,      null: false
      t.text       :prompt,             null: false
      t.jsonb      :options,            null: false, default: []
      t.string     :correct_answer,     null: false
      t.string     :user_answer
      t.boolean    :answered_correctly
      t.integer    :position,           null: false, default: 0

      t.timestamps
    end

    add_index :quiz_questions, [:quiz_session_id, :position]
  end
end
