module GeneralHelpers
  def coming_soon
    content_tag :div, :class => 'alert alert-warning' do
      'Documentation has not been written for this page yet. Please check back later!'
    end
  end

  def local_url(link)
    current_page.url[0..2] + link
  end

  def link(*args, &block)
    options  = args.extract_options!
    name = block_given? ? '' : args.shift
    href = args.first
    if fragment = options[:fragment] || options[:anchor]
      warn 'Options :anchor and :fragment are deprecated for #link_to. Please use :fragment for #url'
      href << '#' << fragment.to_s
    end
    href = current_page.url[0..2] + href
    options.reverse_merge!(:href => href || '#')
    return name unless parse_conditions(href, options)
    block_given? ? content_tag(:a, options, &block) : content_tag(:a, name, options)
  end

  def code_list(*args)
    res = "<code>"
    res += args.join("</code>,<code>")
    res += "</code>"
    res
  end

  def link_link(link)
    link(link, link)
  end

  def link_slug(text, slug)
    link_to(text, "##{to_slug(slug)}")
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
