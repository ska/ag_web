class AddUseridToHouses < ActiveRecord::Migration  
  def up
    add_column :houses, :user_id, :integer
  end
  def down
    remove_column :houses, :user_id
  end
end
