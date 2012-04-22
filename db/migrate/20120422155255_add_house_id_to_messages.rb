class AddHouseIdToMessages < ActiveRecord::Migration
  def self.up
    add_column :messages, :house_id, :integer
  end

  def self.down
    remove_column :messages, :house_id
  end
end
