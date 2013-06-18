class TagParser
  include ActionView::Helpers
  # include ActionView::Context

  HASHTAG_REGEX =  /\B#(\w+)/i
  CASHTAG_REGEX = /\B\$(\w+)/i

  attr_accessor :raw_text

  def initialize(options)
    @raw_text = options[:raw_text]
  end

  def parse
    parse_hashtags!
    parse_cashtags!
    @raw_text
  end

  def parse_cashtags!
    cashtags = @raw_text.scan(TagParser::CASHTAG_REGEX)

    cashtags.each do |cashtag|
      cashtag = "$#{cashtag[0]}"
      @raw_text.gsub!(cashtag, link_to(cashtag, '#'))
    end

    @raw_text
  end

  def parse_hashtags!
    hashtags = @raw_text.scan(TagParser::HASHTAG_REGEX)

    hashtags.each do |hashtag|
      hashtag = "##{hashtag[0]}"
      @raw_text.gsub!(hashtag, link_to(hashtag, '#'))
    end

    @raw_text
  end

end
