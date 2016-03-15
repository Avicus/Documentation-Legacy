module GeneralHelpers
  def coming_soon
    content_tag :div, :class => 'alert alert-warning' do
      'Documentation has not been written for this component yet. Please check back later!'
    end
  end

  def title(text)
    content_for(:title, text)
    content_tag :div, :class => 'page-header' do
      content_tag :h2 do
        text
      end
    end
  end

  def subtitle(text)
    content_tag :div, :class => 'page-header', :style => 'padding-top: 15px' do
      content_tag :h3 do
        text
      end
    end
  end

  def section(text, &block)
    content_tag :h4, :style => 'padding-top: 15px' do
      if block_given?
        text + capture(&block)
      else
        text
      end
    end
  end
end