class Choice < ApplicationRecord
    has_many :offer_choice_relation, dependent: :destroy
    has_many :offers, through: :offer_choice_relation

end
