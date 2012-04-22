class AddIdTypeOfHouseToHouses < ActiveRecord::Migration
  def self.up
    add_column :houses, :id_TypeOfHouse, :integer
  end

  def self.down
    remove_column :houses, :id_TypeOfHouse
  end
end