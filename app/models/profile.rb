class Profile < ApplicationRecord
  belongs_to :user
  
  validates :address, length: { maximum: 255 }
  validates :representative_name, length: { maximum: 255 }
  validates :tel,length: { maximum: 255 }
  
  has_many :profile_city_relation, dependent: :destroy
  has_many :cities, through: :profile_city_relation
end
