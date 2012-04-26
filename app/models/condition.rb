class Condition < ActiveRecord::Base
  has_many :houses
  validates :name,  
            :presence => { :message => "Il nome	e' obbligatorio."}
end

# == Schema Information
#
# Table name: conditions
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

