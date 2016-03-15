module Haml::Filters::Yaml
  include Haml::Filters::Base

  def render(text)
    text = Haml::Helpers.preserve text.strip!
    "<pre><code class='language-yaml'>#{text}</code></pre>"
  end
end

module Haml::Filters::YamlCode
  include Haml::Filters::Base

  def render(text)
    text = Haml::Helpers.html_escape text.strip!
    text = Haml::Helpers.preserve text
    "<code class='language-yaml'>#{text}</code>"
  end
end