class TagParser
  include ActionView::Helpers
  # include ActionView::Context


  attr_accessor :raw, :currency

  def initialize(options)
    @raw = options[:raw]
    @currency = options[:currency] || '$'
  end

  def parse
    linkify_hashtags!
    labelize_cashtags!
    @raw
  end

  def labelize_cashtags!
    cashtags = TagExtractor.extract_cashtags(@raw)

    cashtags.each do |cashtag|
      raw_cashtag = "$#{cashtag}"
      cashtag = "#{self.currency}#{cashtag}"
      html = content_tag(:span, cashtag, class: "label label-success")
      @raw.gsub!(raw_cashtag, html)
    end

    @raw
  end

  # TODO: Write tests using Capybara.string
  # http://robots.thoughtbot.com/post/29549610681/using-the-draper-gem-round-one
  def linkify_hashtags!
    hashtags = TagExtractor.extract_hashtags(@raw)

    hashtags.each do |hashtag|
      hashtag = "##{hashtag}"
      @raw.gsub!(hashtag, link_to(hashtag, '#'))
    end

    @raw
  end

end
