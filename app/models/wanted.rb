class Wanted < ApplicationRecord
  
  with_options presence: true do
    validates :title, length: { maximum: 50 }
    validates :image
    validates :date
    validates :content, length: { maximum: 255 }
    validates :address
    validates :latitude
    validates :longitude
  end
  
  mount_uploader :image, ImageUploader
  
  geocoded_by :address
  before_validation :geocode, if: :address_changed?

  belongs_to :user
end
