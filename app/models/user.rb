class User < ApplicationRecord
  has_one :profile
  has_many :posts, foreign_key: "creator_id"
  has_many :comments, foreign_key: "commenter_id"
  has_many :likes, foreign_key: "liker_id"
  has_many :liked_posts, through: :likes
  has_many :followers_list, foreign_key: "following_id", class_name: "Follow"
  has_many :followings_list, foreign_key: "follower_id", class_name: "Follow"
  has_many :followers, through: :followers_list
  has_many :followings, through: :followings_list

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable

  validates :username, uniqueness: true, presence: true,
        format: { with: /\A[a-zA-Z][a-zA-Z0-9_]+\z/,
                  message: "is invalid (only letters, digits and underscore)" },
        length: { in: 4..16 }

  after_create :create_profile

  def self.from_omniauth(auth)
        user_record = where(provider: auth.provider,
        uid: auth.uid).first_or_create(provider: auth.provider,
            username: auth.info.nickname,
            uid: auth.uid,
            email: auth.info.email,
            password: Devise.friendly_token[0, 20])
        Profile.where(user_id: user_record.id).first_or_create().update(avatar_url: auth.info.image)
        user_record
  end

  def to_param
      username
  end

  private

  def create_profile
    Profile.where(user_id: id).first_or_create()
    UserMailer.with(user: self).welcome_email.deliver_now!
  end
end
