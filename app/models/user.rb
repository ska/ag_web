class User < ActiveRecord::Base
  require 'digest'
  attr_accessor   :password
  attr_accessible :name, :email, :password, :password_confirmation, :admin, :enabled   
  has_many :houses, :dependent => :destroy
  has_many :messages, :dependent => :destroy
  
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  
  
  validates :name,  
            :presence => { :message => "Non puo' essere vuoto."},
            :length   => { :maximum => 50, :too_long => "Troppo lungo." }

          
  validates :email, 
            :presence   => { :message => "Non puo' essere vuoto."},
            :format     => { :with => email_regex, :message => "Formato non corretto." }
          
  validates :password,
            :presence   => { :message => "Non puo' essere vuoto."},
            :confirmation => { :message => "La conferma non coincide con la password."},
            :length   => { :within => 6..40, :too_long => "Troppo lunga.", :too_short => "Troppo corto." },
            :on => :create          
          
  before_create :encrypt_password
  
####----------------------------------------------------------------------------
  
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  
  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end
  
  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end

  private  
    
    def encrypt_password
      self.salt = make_salt unless has_password?(password)
      self.encrypted_password = encrypt(password)
    end
  
    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end
    
    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end
    
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
end


# == Schema Information
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  email              :string(255)
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#  encrypted_password :string(255)
#  salt               :string(255)
#  enabled            :boolean         default(FALSE)
#  admin              :boolean         default(FALSE)
#

