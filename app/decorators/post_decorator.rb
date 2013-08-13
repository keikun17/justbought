class PostDecorator < ApplicationDecorator
  delegate_all

  def parsed_comment
    html = parser.parse
    html.html_safe
  end

  # Show the Avatar. Use 64x64 placeholder for now
  def media
    avatar = h.image_tag('', data: {src: image_path})
    h.link_to(avatar, '#', class: 'pull-left')
  end

  private

  def parser
    TagParser.new(raw: self.raw_comment, currency: self.currency)
  end

  def image_path
    'holder.js/64x64'
  end

end
