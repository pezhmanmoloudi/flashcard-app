class AddResponseTimeToCardProgresses < ActiveRecord::Migration[8.0]
  def change
    add_column :card_progresses, :last_response_time_ms, :integer
  end
end
