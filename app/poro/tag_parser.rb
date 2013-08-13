class TagParser
  include ActionView::Helpers

  attr_accessor :raw, :currency

  def initialize(options)
    @raw = options[:raw]
    @currency = options[:currency] || '$'
    @cashtags = TagExtractor.new(@raw).extract_cashtags
    @hashtags = TagExtractor.new(@raw).extract_hashtags
  end

  # Build the parsed markup.
  # turns "Got a #monitor for $300" into :
  # Output: "Got a <a href='#'>#monitor</a> for <span class="label label-success">$300</span>"
  def parse
    linkify_hashtags!
    labelize_cashtags!
    @raw
  end

  # wrap cashtag around a `span.label.label-success`
  def labelize_cashtags!
    @cashtags.each do |cashtag|
      new_cashtag = "#{self.currency}#{cashtag}"
      new_html = content_tag(:span, new_cashtag, class: "label label-success")

      @raw.gsub!("$#{cashtag}", new_html)
    end

    @raw
  end

  # Turns hashtags into links
  def linkify_hashtags!
    @hashtags.each do |hashtag|
      @raw.gsub!( "##{hashtag}", link_to("##{hashtag}", '#') )
    end

    @raw
  end

end
