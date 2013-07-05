class Following < ActiveRecord::Base
  belongs_to :user
  belongs_to :followed, class_name: "User"
end

# == Schema Information
#
# Table name: followings
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  followed_id :integer
#

