class OfferCityRelation < ApplicationRecord
  belongs_to :offer
  belongs_to :city
end
