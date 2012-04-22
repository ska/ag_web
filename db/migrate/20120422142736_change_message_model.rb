class ChangeMessageModel < ActiveRecord::Migration
  def self.up
    remove_column :messages, :house_id
    add_column :messages, :user_id, :integer
    add_column :messages, :read, :boolean, :default => false
  end

  def self.down
    add_column :messages, :house_id, :integer
    remove_column :messages, :user_id
    remove_column :messages, :read
  end
end
