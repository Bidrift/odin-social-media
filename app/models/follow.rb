class Follow < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :following, class_name: "User"

  validates :follower_id, uniqueness: { scope: :following_id}
  validate :cannot_follow_self

  enum :status, { pending: 0, accepted: 1}

  private

  def cannot_follow_self
    if follower_id == following_id
      errors.add(follower.username, "cannot follow themselves")
    end
  end
end
