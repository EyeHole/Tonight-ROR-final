class AddUserToVisitor < ActiveRecord::Migration[6.0]
  def change
    add_reference :visitors, :user, null: false, foreign_key: true
  end
end
