class AddColumsToMessage < ActiveRecord::Migration
  def self.up
    add_column :messages, :name, :string
    add_column :messages, :email, :string
  end

  def self.down
    remove_column :messages, :name
    remove_column :messages, :email
  end
end
