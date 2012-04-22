class Message < ActiveRecord::Base
  belongs_to :user
  default_scope :order => 'created_at DESC'
end

# == Schema Information
#
# Table name: messages
#
#  id         :integer         not null, primary key
#  object     :string(255)
#  text       :string(255)
#  house_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

