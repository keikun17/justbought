class PostDecorator < ApplicationDecorator
  delegate_all

  def parsed_comment
    html = TagParser.new(raw: self.raw_comment, currency: self.currency).parse
    html.html_safe
  end

  def media
    avatar = h.image_tag('', data: {src: image_path})
    h.link_to(avatar, '#', class: 'pull-left')
  end

  private

  def image_path
    'holder.js/64x64'
  end

end
