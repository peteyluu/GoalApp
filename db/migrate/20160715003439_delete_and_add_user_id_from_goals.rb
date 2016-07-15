class DeleteAndAddUserIdFromGoals < ActiveRecord::Migration
  def change
    remove_column :goals, :user_id
    add_column :goals, :user_id, :integer
  end
end
