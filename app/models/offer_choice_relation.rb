class OfferChoiceRelation < ApplicationRecord
  belongs_to :offer
  belongs_to :choice
end
