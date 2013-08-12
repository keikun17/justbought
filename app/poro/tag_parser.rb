class TagParser
  include ActionView::Helpers

  attr_accessor :raw, :currency

  def initialize(options)
    @raw = options[:raw]
    @currency = options[:currency] || '$'
  end

  # Build the parsed markup.
  # turns "Got a #monitor for $300" into :
  # Output: "Got a <a href='#'>monitor</a> for <span class="label label-success">$300</span>"
  def parse
    linkify_hashtags!
    labelize_cashtags!
    @raw
  end

  # wrap cashtag around a `span.label.label-success`
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

  # Turns hashtags into links
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
