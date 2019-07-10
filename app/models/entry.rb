class Entry < ApplicationRecord
  belongs_to :estate_user, class_name: 'User'
  belongs_to :normal_user, class_name: 'User'
  has_many :messages
end
