class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.string :object
      t.string :text
      t.integer :house_id

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
