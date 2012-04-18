class UniqueEmailAndPassword < ActiveRecord::Migration
  def up
    add_index :users, :email, :unique => true
    add_column :users, :encrypted_password, :string
  end

  def down
    remove_index :users, :email
    remove_column :users, :encrypted_password
  end
end
