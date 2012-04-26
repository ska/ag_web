class Image < ActiveRecord::Base
  attr_accessible :house_id, :name, :image, :remote_image_url
  belongs_to :house
  mount_uploader :image, ImageUploader
  
  validates :name,  
            :presence => { :message => "Non puo' essere vuoto."},
            :length   => { :maximum => 50, :too_long => "Troppo lungo." }
  
end

# == Schema Information
#
# Table name: images
#
#  id         :integer         not null, primary key
#  house_id   :integer
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  image      :string(255)
#

