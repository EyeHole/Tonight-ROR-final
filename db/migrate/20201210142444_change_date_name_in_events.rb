class ChangeDateNameInEvents < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :date, :start_date
  end
end
