module GeneralHelpers
  def coming_soon
    content_tag :div, :class => 'alert alert-warning' do
      'Documentation has not been written for this component yet. Please check back later!'
    end
  end

  def title(text)
    content_for(:title, text)
    content_tag :div, :class => 'page-header' do
      content_tag :h1 do
        text
      end
    end
  end
end