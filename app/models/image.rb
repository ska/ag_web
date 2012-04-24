class Image < ActiveRecord::Base
  attr_accessible :house_id, :name, :image, :remote_image_url
  belongs_to :house
  mount_uploader :image, ImageUploader
end
