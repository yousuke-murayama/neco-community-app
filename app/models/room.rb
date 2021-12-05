class Room < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  belongs_to :user
  has_many :comments
end
