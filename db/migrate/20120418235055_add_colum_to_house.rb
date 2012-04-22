class AddColumToHouse < ActiveRecord::Migration
  def up
    add_column :houses, :town, :string
    add_column :houses, :postcode, :string
    add_column :houses, :province, :string
    add_column :houses, :total_sqm, :integer
    add_column :houses, :n_total_room, :integer
    add_column :houses, :n_bedroom, :integer
    add_column :houses, :n_bathroom, :integer
    add_column :houses, :year_of_construction, :integer
  end
  def down
    remove_column :houses, :town
    remove_column :houses, :postcode
    remove_column :houses, :province
    remove_column :houses, :total_sqm
    remove_column :houses, :n_total_room
    remove_column :houses, :n_bedroom
    remove_column :houses, :n_bathroom
    remove_column :houses, :year_of_construction
  end
end
