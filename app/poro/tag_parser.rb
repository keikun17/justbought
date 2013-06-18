class TagParser
  include ActionView::Helpers
  # include ActionView::Context


  attr_accessor :raw

  def initialize(options)
    @raw = options[:raw]
  end

  def parse
    linkify_hashtags!
    labelize_cashtags!
    @raw
  end

  def labelize_cashtags!
    cashtags = TagExtractor.extract_cashtags(@raw)

    cashtags.each do |cashtag|
      cashtag = "$#{cashtag}"
      html = content_tag(:span, cashtag, class: "label label-success")
      @raw.gsub!(cashtag, html)
    end

    @raw
  end

  def linkify_hashtags!
    hashtags = TagExtractor.extract_hashtags(@raw)

    hashtags.each do |hashtag|
      hashtag = "##{hashtag}"
      @raw.gsub!(hashtag, link_to(hashtag, '#'))
    end

    @raw
  end

end
