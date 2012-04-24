class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.integer :house_id
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :images
  end
end
