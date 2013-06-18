class TagExtractor
  HASHTAG_REGEX =  /\B#(\w+)/i
  CASHTAG_REGEX = /\B\$(\w+)/i

  def self.extract_hashtags(raw)
    tags = raw.scan(HASHTAG_REGEX)
    tags.map(&:first)
  end

  def self.extract_cashtags(raw)
    tags = raw.scan(CASHTAG_REGEX)
    tags.map(&:first)
  end

end
