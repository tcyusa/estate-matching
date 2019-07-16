class Message < ApplicationRecord
  belongs_to :user
  belongs_to :entry
  
  validates :content, presence: true, length: { maximum: 255 }
end
