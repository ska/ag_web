class House < ActiveRecord::Base
  belongs_to :user
  has_many :messages, :dependent => :destroy
  has_many :images, :dependent => :destroy
  
  default_scope :order => 'updated_at DESC'
  
  validates :titolo,  
            :presence => true,
            :length   => { :maximum => 100 }
          
  validates :descrizione,  
            :presence => true,
            :length   => { :within => 40..1000 }
          
  validates :town,  
            :presence => true,
            :length   => { :within => 3..40 }
          
  validates :postcode,  
            :presence => true,
            :length   => { :within => 5..5 },
            :numericality => true
          
  validates :total_sqm,  
            :presence => true,
            :length   => { :within => 2..4 },
            :numericality => true
  
  validates :n_total_room,  
            :presence => true,
            :length   => { :within => 1..3 },
            :numericality => true
  
  validates :n_bedroom,  
            :presence => true,
            :length   => { :within => 1..3 },
            :numericality => true
  
  validates :n_bathroom,  
            :presence => true,
            :length   => { :within => 1..3 },
            :numericality => true
  
  validates :year_of_construction,  
            :presence => true,
            :length   => { :within => 4..4 },
            :numericality => true
  
  validates :id_TypeOfHouse,  
            :presence => true,
            :numericality => true
  
  validates :id_TypeOfContract,  
            :presence => true,
            :numericality => true
  
  validates :id_Condition,  
            :presence => true,
            :numericality => true
  
end




# == Schema Information
#
# Table name: houses
#
#  id                   :integer         not null, primary key
#  titolo               :string(255)
#  descrizione          :string(255)
#  created_at           :datetime        not null
#  updated_at           :datetime        not null
#  town                 :string(255)
#  postcode             :string(255)
#  province             :string(255)
#  total_sqm            :integer
#  n_total_room         :integer
#  n_bedroom            :integer
#  n_bathroom           :integer
#  year_of_construction :integer
#  user_id              :integer
#  id_TypeOfContract    :integer
#  id_Condition         :integer
#  id_TypeOfHouse       :integer
#

