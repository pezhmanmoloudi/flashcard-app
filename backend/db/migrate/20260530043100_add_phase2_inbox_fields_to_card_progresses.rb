class AddPhase2InboxFieldsToCardProgresses < ActiveRecord::Migration[8.0]
  def change
    add_column :card_progresses, :fail_streak,           :integer,  default: 0, null: false
    add_column :card_progresses, :inbox_success_count,   :integer,  default: 0, null: false
    add_column :card_progresses, :reinforcement_due_at,  :datetime

    add_index :card_progresses, :reinforcement_due_at
  end
end
