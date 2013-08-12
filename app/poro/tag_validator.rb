class TagValidator < ActiveModel::Validator

  def validate(taggable)
    check_hashtags(taggable)
    check_cashtags(taggable)
  end

  def check_hashtags(taggable)
    taggable.errors.add(:raw_comment, "Should have #something hashtagged") unless have_hashtags?(taggable)
  end

  def check_cashtags(taggable)
    taggable.errors.add(:raw_comment, "Should have a $price tag") unless have_cashtags?(taggable)
  end

  private

  def have_hashtags?(taggable)
    !TagExtractor.new(taggable.raw_comment).extract_hashtags.empty?
  end

  def have_cashtags?(taggable)
    !TagExtractor.new(taggable.raw_comment).extract_cashtags.empty?
  end
end

