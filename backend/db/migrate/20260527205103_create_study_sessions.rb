class CreateStudySessions < ActiveRecord::Migration[8.0]
  def change
    create_table :study_sessions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :deck, null: false, foreign_key: true
      t.integer  :cards_studied, null: false, default: 0
      t.datetime :completed_at

      t.timestamps
    end
  end
end
