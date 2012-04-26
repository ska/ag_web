class AddPriceToHouse < ActiveRecord::Migration
  def self.up
    add_column :houses, :price, :integer
  end

  def self.down
    remove_column :houses, :price
  end
end
