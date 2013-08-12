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

  def linkify_hashtags!
    hashtags = extract_hashtags

    hashtags.each do |hashtag|
      replace_string = "##{hashtag}"
      @raw.gsub!(replace_string, link_to(hashtag, '#'))
    end

    @raw
  end

  private

  def extract_hashtags
    TagExtractor.new(@raw).extract_hashtags
  end

  def extract_cashtags
    TagExtractor.new(@raw).extract_cashtags
  end

end
