class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :commenter, class_name: "User"

  validates :body, presence: true, length: { maximum: 100 }
end
