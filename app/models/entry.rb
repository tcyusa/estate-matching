class Entry < ApplicationRecord
  belongs_to :estate_user, through: users
  belongs_to :normal_user, through: users
  has_many :messages
end
