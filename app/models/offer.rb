class Offer < ApplicationRecord
  belongs_to :user

  validates :min_price, numericality: true
  validates :max_price, numericality: true
end
