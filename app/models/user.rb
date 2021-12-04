class User < ApplicationRecord
  before_save { self.email.downcase! }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
  has_secure_password
  
  validates :password, presence: true, length: { minimum: 8 }
  
  mount_uploader :icon, ImageUploader
  
  has_many :wanteds
  has_many :rooms
end