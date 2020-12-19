class AddIndexToVisitors < ActiveRecord::Migration[6.0]
  def change
    add_index :visitors, [:user_id, :event_id], unique: true
  end
end
