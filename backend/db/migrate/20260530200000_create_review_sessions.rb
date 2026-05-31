class CreateReviewSessions < ActiveRecord::Migration[8.0]
  def change
    create_table :review_sessions do |t|
      t.references :user,          null: false, foreign_key: true
      t.string     :language_pair, null: false
      t.integer    :cards_reviewed, default: 0, null: false
      t.datetime   :completed_at

      t.timestamps
    end

    add_index :review_sessions, [:user_id, :language_pair]
    add_index :review_sessions, [:user_id, :completed_at]
  end
end
