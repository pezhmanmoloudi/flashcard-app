class AddIndexNextReviewAtToCardProgresses < ActiveRecord::Migration[8.0]
  def change
    add_index :card_progresses, :next_review_at
  end
end
