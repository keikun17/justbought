class Post < ActiveRecord::Base
  belongs_to :user
  has_many :likers, through: :likes, source: :user

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
