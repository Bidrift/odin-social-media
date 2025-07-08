class Profile < ApplicationRecord
  self.primary_key = :user_id
  validates :avatar_url, presence: true
  validates :bio, presence: true, length: { in: 4..100 }
  
  
  
  belongs_to :user
end
