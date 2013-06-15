class PostPresenter
  include ActionView::Helpers
  include ActionView::Context

  def image_path
    'holder.js/64x64' 
  end

  def name
    'Rizza Bobadilla'
  end

  def comment
    "Gotta love that i can adjust the settings with cool knobs"
  end

  def thought_price
    content = "thought that #{tagged_text} is worth #{labeled_price}"
    content.html_safe 
  end

  def tagged_text
    link_to '#fujifilmx20', '#'
  end

  def labeled_price
    content = content_tag :span, class: 'label' do
      '$200'
    end
  end

  def media
    avatar = image_tag(image_path)
    link_to avatar, '#', class: 'pull-left'
  end

end
