class TagExtractor
  HASHTAG_REGEX =  /\B#(\w+)/i
  CASHTAG_REGEX = /\B\$(\w+)/i

  attr_accessor :body

  def initialize(body)
    @body = body
  end

  def extract_hashtags
    tags = body.scan(HASHTAG_REGEX)
    tags.map(&:first)
  end

  def extract_cashtags
    tags = body.scan(CASHTAG_REGEX)
    tags.map(&:first)
  end

end
