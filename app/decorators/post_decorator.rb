class PostDecorator < Draper::Decorator
  delegate_all

  def thought_price
    content = "thought that #{tagged_text} is worth #{labeled_price}"
    content.html_safe
  end

  def parsed_comment
    html = TagParser.new(raw: self.raw_comment).parse
    html.html_safe
  end

  def tagged_text
    link_to '#fujifilmx20', '#'
  end

  def media
    avatar = h.image_tag(image_path)
    h.link_to(avatar, '#', class: 'pull-left')
  end

  private

  def image_path
    'holder.js/64x64'
  end

end
