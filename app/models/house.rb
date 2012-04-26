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
          
  
  
  
  def self.search(search)          
    #Prova ricerche selettive
    contr = search[:post][:id_TypeOfContract].to_i
    house = search[:post][:id_TypeOfHouse].to_i
    min_sqm = search[:post][:minimum_sqm].to_i
    max_sqm = search[:post][:maximun_sqm].to_i
    town = search[:post][:town]
    max_sqm = search[:post][:maximun_sqm].to_i
    prov = search[:post][:province][0..1]
    min_price = search[:post][:minimum_price].to_i
    max_price = search[:post][:maximun_price].to_i
    #searched_house = House.find(:all, :conditions => "total_sqm > #{min_sqm}")
    
    
    condition = "total_sqm > #{min_sqm} "
    
    if ( contr >1 )
      condition = condition + "AND id_TypeOfContract = #{contr} "
    end
    
    if ( house > 1)
      condition = condition + "AND id_TypeOfHouse = #{house} "
    end
        
    if ( max_sqm > 0 )
      condition = condition + "AND total_sqm < #{max_sqm} "
    end
    
    unless ( town.empty? )
      condition = condition + "AND town LIKE '#{town}' "
    end
       
    unless ( prov.empty? )
      condition = condition + "AND province LIKE '#{prov}' "
    end
    
    if ( max_price > 0 )
      condition = condition + "AND price > #{min_price} "
    end
    
    if ( max_price > 0 )
      condition = condition + "AND price < #{max_price} "
    end
    
    
    #return searched_house
    find(:all, :conditions => [condition])
  end
  
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

