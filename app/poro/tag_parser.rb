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
    cashtags = extract_cashtags

    cashtags.each do |cashtag|
      replace_string = "$#{cashtag}"

      cashtag = "#{self.currency}#{cashtag}"
      new_html = content_tag(:span, cashtag, class: "label label-success")

      @raw.gsub!(replace_string, new_html)
    end

    @raw
  end

  # TODO: Write tests using Capybara.string
  # http://robots.thoughtbot.com/post/29549610681/using-the-draper-gem-round-one
  def linkify_hashtags!
    hashtags = TagExtractor.new(@raw).extract_hashtags

    hashtags.each do |hashtag|
      hashtag = "##{hashtag}"
      @raw.gsub!(hashtag, link_to(hashtag, '#'))
    end

    @raw
  end

end
