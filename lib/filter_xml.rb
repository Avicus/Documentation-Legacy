module Haml::Filters::Xml
  include Haml::Filters::Base

  def render(text)
    text = Haml::Helpers.html_escape text.strip!
    text = Haml::Helpers.preserve text
    "<pre><code class='language-xml'>#{text}</code></pre>"
  end
end