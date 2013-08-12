class Post < ActiveRecord::Base
  include ActionView::Helpers

  belongs_to :user
  has_many :likers, through: :likes, source: :user
  has_many :comments

  default_scope order(:created_at => :desc)

  validate :check_hashtags
  validate :check_cashtags

  HASHTAG_REGEX =  /\B#(\w+)/i
  CASHTAG_REGEX = /\B\$(\w+)/i

  # Find Hashtags
  # Find Cashtags
  # Build the HTML Markup
  def parsed_comment
    processed_comment = raw_comment

    # Replace #YOLO with <a href='#'>#YOLO</a>
    hashtags = raw_comment.scan(HASHTAG_REGEX)
    hashtags.map(&:first).map.each do |hashtag|
      replace_string = "##{hashtag}"
      processed_comment.gsub!(replace_string, link_to('#' + hashtag, '#'))
    end

    # Replace $100 with <span class='label label-success'>$100</span>
    cashtags = raw_comment.scan(CASHTAG_REGEX)
    cashtags.map(&:first).each do |cashtag|
      replace_string = "$#{cashtag}"

      cashtag = "#{self.currency}#{cashtag}"
      new_html = content_tag(:span, cashtag, class: "label label-success")

      processed_comment.gsub!(replace_string, new_html)
    end

    processed_comment.html_safe
  end

  # Show the Avatar. Use 64x64 placeholder for now
  def media
    avatar = image_tag('', data: {src: 'holder.js/64x64'})
    link_to(avatar, '#', class: 'pull-left')
  end

  # Validations -------------------------

  def check_hashtags
    if raw_comment.scan(HASHTAG_REGEX).empty?
      self.errors.add(:raw_comment, "Should have #something hashtagged")
    end
  end

  def check_cashtags
    if raw_comment.scan(CASHTAG_REGEX).empty?
      self.errors.add(:raw_comment, "Should have a $price tag")
    end
  end

end

# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  raw_comment :text
#  created_at  :datetime
#  updated_at  :datetime
#  currency    :string(255)      default("$")
#

