class CreateCardProgresses < ActiveRecord::Migration[8.0]
  def change
    create_table :card_progresses do |t|
      t.references :user,      null: false, foreign_key: true
      t.references :flashcard, null: false, foreign_key: true
      t.integer  :repetitions,    null: false, default: 0
      t.decimal  :easiness_factor, null: false, default: "2.5", precision: 4, scale: 2
      t.integer  :interval_days,  null: false, default: 0
      t.datetime :next_review_at

      t.timestamps
    end

    add_index :card_progresses, [:user_id, :flashcard_id], unique: true
  end
end
