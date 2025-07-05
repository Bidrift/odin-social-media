class User < ApplicationRecord
  has_many :posts, foreign_key: "creator_id"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, uniqueness: true, presence: true, 
        format: { with: /\A[a-zA-Z][a-zA-Z0-9_]+\z/,
                  message: "is invalid (only letters, digits and underscore)"},
        length: { in: 4..16 }
end
