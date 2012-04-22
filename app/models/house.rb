class House < ActiveRecord::Base
  belongs_to :user
  has_many :messages
  default_scope :order => 'updated_at DESC'
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

