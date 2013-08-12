class TagValidator < ActiveModel::Validator

  def validate(taggable)
    check_hashtags(taggable)
    check_cashtags(taggable)
  end

  def check_hashtags(taggable)
    taggable.errors.add(:raw_comment, "Should have #something hashtagged") unless have_hashtags?
  end

  def check_cashtags(taggable)
    taggable.errors.add(:raw_comment, "Should have a $price tag") unless have_cashtags?
  end

  private

  def have_hashtags?
    !TagExtractor.new(taggable.raw_comment).extract_hashtags.empty?
  end

  def have_cashtags?
    !TagExtractor.new(taggable.raw_comment).extract_cashtags.empty?
  end
end

