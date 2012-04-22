class Message < ActiveRecord::Base
  belongs_to :houses
  belongs_to :user
  default_scope :order => 'created_at DESC'
  attr_accessible :object, :text, :user_id, :house_id, :name, :email, :read
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  
  validates :name,  
            :presence => true,
            :length   => { :maximum => 50 }  
          
  validates :email, 
            :presence   => true,
            :format     => { :with => email_regex }
  
end


# == Schema Information
#
# Table name: messages
#
#  id         :integer         not null, primary key
#  object     :string(255)
#  text       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#  read       :boolean         default(FALSE)
#  house_id   :integer
#  name       :string(255)
#  email      :string(255)
#

