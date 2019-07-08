class ProfileCityRelation < ApplicationRecord
  belongs_to :profile
  belongs_to :city
end
