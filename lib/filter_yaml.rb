module Haml::Filters::Yaml
  include Haml::Filters::Base

  def render(text)
    text = Haml::Helpers.preserve text.strip!
    "<pre><code class='language-yaml'>#{text}</code></pre>"
  end
end