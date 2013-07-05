class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :comments

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

  def likes_post?(post)
    self.liked_posts.where(id: post.id).present?
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
    self.likes.where(post_id: post.id).delete_all
  end

end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  currency               :string(255)      default("$")
#

