class CreateTypeOfHouses < ActiveRecord::Migration
  def change
    create_table :type_of_houses do |t|
      t.string :name

      t.timestamps
    end
  end
end
