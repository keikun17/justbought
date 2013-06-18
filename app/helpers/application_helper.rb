module ApplicationHelper
  def parse_with_taggables(raw_text)
    raw TagParser.new(raw_text: raw_text).parse
  end

end
