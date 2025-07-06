class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :commenter
end
