module GeneralHelpers
  def category(text, desc = nil)
    label = link("/elements/events##{to_slug(text)}", :class => 'decoration-none') do
      label(text, 'info')
    end
    if desc
      content_tag :p, :style => 'padding-top: 5px; margin-bottom: 0' do
        label + '&nbsp'.html_safe + content_tag(:small, desc)
      end
    else
      label
    end
  end
end