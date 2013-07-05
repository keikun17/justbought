class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
end

# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

