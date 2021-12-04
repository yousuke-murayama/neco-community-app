class Wanted < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :image, presence: true
  validates :date, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  
  mount_uploader :image, ImageUploader

  belongs_to :user
end
