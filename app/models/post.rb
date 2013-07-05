class Post < ActiveRecord::Base
  belongs_to :user
  has_many :likers, through: :likes, source: :user
  has_many :comments

  validate :check_hashtags, :check_cashtags

  default_scope order(:created_at => :desc)

  private

  def check_hashtags
    hashtags = TagExtractor.extract_hashtags(self.raw_comment)
    errors.add(:raw_comment, "Should have #something hashtagged") if hashtags.empty?
  end

  def check_cashtags
    cashtags = TagExtractor.extract_cashtags(self.raw_comment)
    errors.add(:raw_comment, "Should have a $price tag") if cashtags.empty?
  end

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

