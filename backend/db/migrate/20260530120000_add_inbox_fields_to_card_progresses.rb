class AddInboxFieldsToCardProgresses < ActiveRecord::Migration[8.0]
  def change
    add_column :card_progresses, :needs_review,      :boolean,  default: false, null: false
    add_column :card_progresses, :reviewed_again_at,  :datetime

    add_index :card_progresses, [:user_id, :needs_review],
              where: "needs_review = true",
              name:  "idx_card_progresses_inbox"
  end
end
