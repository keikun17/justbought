class TagExtractor
  HASHTAG_REGEX =  /\B#(\w+)/i
  CASHTAG_REGEX = /\B\$(\w+)/i

  attr_accessor :body

  def initialize(body)
    @body = body
  end

  # Example :
  # extractor.extract_hashtags("hey #yolo #swag $9001")
  # > ['yolo', 'swag']
  def extract_hashtags
    tags = body.scan(HASHTAG_REGEX)
    tags.map(&:first)
  end

  # Example :
  # extractor.extract_hashtags("hey #yolo #swag $9001")
  # > ['9001']
  def extract_cashtags
    tags = body.scan(CASHTAG_REGEX)
    tags.map(&:first)
  end

end
