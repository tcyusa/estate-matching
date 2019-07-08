class City < ApplicationRecord
    has_many :offer_city_relation, dependent: :destroy
    has_many :offers, through: :offer_city_relation
    has_many :profile_city_relation, dependent: :destroy
    has_many :profiles, through: :profile_city_relation
end
