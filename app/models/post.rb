class Post < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :comments

  validates :body, presence: true, length: { minimum: 4, maximum: 500 }
end
