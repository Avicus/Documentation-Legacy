module GeneralHelpers
  def coming_soon
    content_tag :div, :class => 'alert alert-warning' do
      'Documentation has not been written for this page yet. Please check back later!'
    end
  end

  def link_to_link(link)
    link_to(link, link)
  end

  def link_to_slug(text, slug)
    link_to(text, "#{current_page.url}##{to_slug(slug)}")
  end

  def to_slug(text)
    text.downcase.strip.gsub(' ', '_').gsub('-', '_').gsub(/[^\w-]/, '')
  end

  def title(text)
    content_for(:title, text)
    content_tag :div, :class => 'page-header', :id => to_slug(text) do
      content_tag :h2 do
        text
      end
    end
  end

  def subtitle(text)
    subtitles = content_for(:subtitles) || []
    content_for(:subtitles, subtitles << text)

    content_tag :div, :class => 'page-header', :style => 'padding-top: 25px', :id => to_slug(text) do
      content_tag :h3 do
        text
      end
    end
  end

  def section(text, &block)
    sections = content_for(:sections) || []
    content_for(:sections, sections << text)

    content_tag :h4, :style => 'padding-top: 20px', :id => to_slug(text) do
      if block_given?
        text + capture(&block)
      else
        text
      end
    end
  end
end