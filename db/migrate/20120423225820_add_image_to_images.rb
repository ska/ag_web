class AddImageToImages < ActiveRecord::Migration
  def self.up
    add_column :images, :image, :string
  end

  def self.down
    remove_column :images, :image
  end
end
