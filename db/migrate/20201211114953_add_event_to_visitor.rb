class AddEventToVisitor < ActiveRecord::Migration[6.0]
  def change
    add_reference :visitors, :event, null: false, foreign_key: true
  end
end
