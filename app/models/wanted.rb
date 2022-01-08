class Wanted < ApplicationRecord
  
  with_options presence: true do
    validates :title, length: { maximum: 50 }
    validates :image
    validates :date
    validates :content, length: { maximum: 255 }
    validates :address
  end
  
  validates :latitude, presence: { message: "が特定できませんでした" }
  validates :longitude, presence: { message: "が特定できませんでした" }
  
  
  mount_uploader :image, ImageUploader
  
  geocoded_by :address
  before_validation :geocode, if: :address_changed?

  belongs_to :user
  has_many :testimonies, dependent: :destroy
  has_many :cooperations, dependent: :destroy
end
