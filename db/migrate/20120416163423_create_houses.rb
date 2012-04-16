class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :titolo
      t.string :descrizione

      t.timestamps
    end
  end
end
