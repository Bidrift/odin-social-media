class Post < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :comments
  has_many :likes, foreign_key: "liked_post_id"

  has_many :likers, through: :likes

  validates :body, presence: true, length: { minimum: 4, maximum: 500 }
end
