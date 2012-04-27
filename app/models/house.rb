class House < ActiveRecord::Base
  belongs_to :user
  has_many :messages, :dependent => :destroy
  has_many :images, :dependent => :destroy
  belongs_to :TypeOfContract
  belongs_to :TypeOfHouse
  belongs_to :Condition
  
  default_scope :order => 'updated_at DESC'
  
  validates :titolo,  
            :presence => { :message => "Non puo' essere vuoto."},
            :length   => { :maximum => 100, :too_long => "Troppo lungo." }
          
  validates :descrizione,  
            :presence => { :message => "Non puo' essere vuoto."},
            :length   => { :within => 40..1000, :too_long => "Troppo lungo.", :too_short => "Troppo corto." }
          
  validates :town,  
            :presence => { :message => "Non puo' essere vuoto."},
            :length   => { :within => 3..40, :too_long => "Troppo lungo.", :too_short => "Troppo corto." }
          
  validates :province,  
            :presence => { :message => "Non puo' essere vuoto."},
            :length   => { :within => 2..2, :too_long => "Inserire la sigla della provincia es. 'VE'", :too_short => "Inserire la sigla della provincia es. 'VE'" }
          
  validates :postcode,  
            :presence => { :message => "Non puo' essere vuoto."},
            :length   => { :within => 5..5, :too_long => "Troppo lungo.", :too_short => "Troppo corto." },
            :numericality => { :message => "Deve essere un numero."}
          
  validates :total_sqm,  
            :presence => { :message => "Non puo' essere vuoto."},
            :length   => { :within => 2..4, :too_long => "Troppo lungo.", :too_short => "Troppo corto." },
            :numericality => { :message => "Deve essere un numero."}
  
  validates :n_total_room,  
            :presence => { :message => "Non puo' essere vuoto."},
            :length   => { :within => 1..3, :too_long => "Troppo lungo.", :too_short => "Troppo corto." },
            :numericality => { :message => "Deve essere un numero."}
  
  validates :n_bedroom,  
            :presence => { :message => "Non puo' essere vuoto."},
            :length   => { :within => 1..3, :too_long => "Troppo lungo.", :too_short => "Troppo corto." },
            :numericality => { :message => "Deve essere un numero."}
  
  validates :n_bathroom,  
            :presence => { :message => "Non puo' essere vuoto."},
            :length   => { :within => 1..3, :too_long => "Troppo lungo.", :too_short => "Troppo corto." },
            :numericality => { :message => "Deve essere un numero."}
  
  validates :year_of_construction,  
            :presence => { :message => "Non puo' essere vuoto."},
            :length   => { :within => 4..4, :too_long => "Troppo lungo.", :too_short => "Troppo corto." },
            :numericality => { :message => "Deve essere un numero."}
          
  validates :price,  
            :presence => { :message => "Non puo' essere vuoto."},
            :numericality => { :message => "Deve essere un numero."}
          
  validates :TypeOfHouse_id,  
            :presence => { :message => "Non puo' essere vuoto."},
            :numericality => { :message => "Deve essere un numero."}
  
  validates :TypeOfContract_id,  
            :presence => { :message => "Non puo' essere vuoto."},
            :numericality => { :message => "Deve essere un numero."}
  
  validates :Condition_id,  
            :presence => { :message => "Non puo' essere vuoto."},
            :numericality => { :message => "Deve essere un numero."}
          
  
  
  
  def self.search(search)          
    #Prova ricerche selettive
    contr = search[:post][:TypeOfContract_id].to_i
    house = search[:post][:TypeOfHouse_id].to_i
    min_sqm = search[:post][:minimum_sqm].to_i
    max_sqm = search[:post][:maximun_sqm].to_i
    town = search[:post][:town]
    max_sqm = search[:post][:maximun_sqm].to_i
    prov = search[:post][:province][0..1]
    min_price = search[:post][:minimum_price].to_i
    max_price = search[:post][:maximun_price].to_i
    
    
    
    condition = "total_sqm > #{min_sqm} "
    
    if ( contr >1 )
      condition = condition + "AND TypeOfContract_id = #{contr} "
    end
    
    if ( house > 1)
      condition = condition + "AND TypeOfHouse_id = #{house} "
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
#  TypeOfContract_id    :integer
#  Condition_id         :integer
#  TypeOfHouse_id       :integer
#  price                :integer
#

