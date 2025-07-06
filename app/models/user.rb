class User < ApplicationRecord
  has_many :posts, foreign_key: "creator_id"
  has_many :comments, foreign_key: "commenter_id"
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable

  validates :username, uniqueness: true, presence: true, 
        format: { with: /\A[a-zA-Z][a-zA-Z0-9_]+\z/,
                  message: "is invalid (only letters, digits and underscore)"},
        length: { in: 4..16 }

  def self.from_omniauth(auth)
        where(provider: auth.provider,
        uid: auth.uid).first_or_create(provider: auth.provider,
            username: auth.info.nickname,
            uid: auth.uid,
            email: auth.info.email,
            password: Devise.friendly_token[0,20])
  end

  def to_param
      username
  end

end
