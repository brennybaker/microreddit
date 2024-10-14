class User < ApplicationRecord
  has_secure_password
  has_one :profile
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post
  has_many :follows
  has_many :followed_users, through: :follows, source: :followed_user
  has_many :followed_posts, through: :follows, source: :post
  has_many :followers, class_name: 'Follow', foreign_key: 'followed_user_id'
  has_many :follower_users, through: :followers, source: :user

  validates :username, presence: true, length: { maximum: 30 }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 },
    format: { with: /\A(?=.*[!@#$%^&*])/, message: "must contain at least one special character (!@#$%^&*)" }

  def follow(other_user)
    followed_users << other_user
  end

  def unfollow(other_user)
    followed_users.delete(other_user)
  end

  def following?(other_user)
    followed_users.include?(other_user)
  end

  def feed
    Post.where(user_id: followed_user_ids + [id])
  end
end
