class Testimony < ApplicationRecord
  
  validates :content, presence: true, length: { maximum: 255 }
  
  mount_uploader :photo, ImageUploader
  
  belongs_to :user
  belongs_to :wanted
end
