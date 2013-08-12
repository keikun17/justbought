class Post < ActiveRecord::Base
  belongs_to :user
  has_many :likers, through: :likes, source: :user
  has_many :comments


  default_scope order(:created_at => :desc)

  validates_with TagValidator

end

# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  raw_comment :text
#  created_at  :datetime
#  updated_at  :datetime
#  currency    :string(255)      default("$")
#

