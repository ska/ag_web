class RenameConditionAndTypeOfHouse < ActiveRecord::Migration
  def self.up
    rename_column :houses, :id_TypeOfHouse, :TypeOfHouse_id
    rename_column :houses, :id_Condition, :Condition_id
  end

  def self.down
    rename_column :houses, :TypeOfHouse_id, :id_TypeOfHouse
    rename_column :houses, :Condition_id, :id_Condition
  end
end
