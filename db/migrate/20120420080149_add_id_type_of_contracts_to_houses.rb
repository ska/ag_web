class AddIdTypeOfContractsToHouses < ActiveRecord::Migration
  def self.up
    add_column :houses, :id_TypeOfContract, :integer
  end

  def self.down
    remove_column :houses, :id_TypeOfContract
  end
end