class Offer < ApplicationRecord
  belongs_to :user

  validates :min_price, numericality: true
  validates :max_price, numericality: true
  validates :years, numericality: true
  validates :walking_time, numericality: true
  validates :min_size, numericality: true
  validates :is_family, inclusion: { in: [true, false]}

  has_many :offer_city_relation, dependent: :destroy
  has_many :cities, through: :offer_city_relation
  has_many :offer_choice_relation, dependent: :destroy
  has_many :choices, through: :offer_choice_relation
end
