class CreateTypeOfHouses < ActiveRecord::Migration
  def self.up
    create_table :type_of_houses do |t|
      t.string :name

      t.timestamps
    end
  end
  
  def self.down
    drop_table :type_of_houses
  end
end
