class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
end

# == Schema Information
#
# Table name: comments
#
#  id      :integer          not null, primary key
#  user_id :integer
#  post_id :integer
#  body    :text
#

