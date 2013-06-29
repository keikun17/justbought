class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :friends_posts, through: :friends, source: 'posts'

  has_many :followings
  has_many :friends, through: :followings, source: 'followed'

  has_many :followeds, class_name: 'Following', foreign_key: 'followed_id'
  has_many :followers, through: :followeds, source: User

  has_many :likes
  has_many :liked_posts,  through: :likes, source: 'post'

  def friends_with?(user)
    self.friends.where(:id => user.id).present?
  end

  def follow(user)
    self.friends << user
  end

  def unfollow(user)
    self.followings.where(:followed_id => user.id).delete_all
  end

  def like(post)
    self.liked_posts << post
  end

  def unlike(post)
    self.liked_posts.where(post_id: post.id).delete_all
  end

end
