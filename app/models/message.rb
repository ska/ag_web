class Message < ActiveRecord::Base
  belongs_to :house
  belongs_to :user
  default_scope :order => 'created_at DESC'
  attr_accessible :object, :text, :user_id, :house_id, :name, :email, :read
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  
  validates :name,  
            :presence => { :message => "Il nome	e' obbligatorio."},
            :length   => { :maximum => 50, :too_long => "Il nome	puo' avere al massimo 50 caratteri" }

          
  validates :email, 
            :presence   => { :message => "L' E-mail e' obbligatoria."},
            :format     => { :with => email_regex, :message => "Formato E-mail non corretto." }
  
  validates :object, 
            :presence   => { :message => "L' oggetto del messaggio e' obbligatorio."}
          
  validates :text, 
            :presence   => { :message => "Il testo del messaggio e' obbligatorio."}
  
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

