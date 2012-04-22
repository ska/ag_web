class AddConditionToHouse < ActiveRecord::Migration
  def self.up
    add_column :houses, :id_Condition, :integer
  end

  def self.down
    remove_column :houses, :id_Condition
  end
end