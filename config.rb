# route layouts
page '/references.html', :layout => 'container'
page '/examples.html', :layout => 'container'
page '/elements/*', :layout => 'element'

# view helpers
require 'lib/element_helpers'
require 'lib/general_helpers'
helpers ElementHelpers
helpers GeneralHelpers

# :xml, :yaml filters
require 'lib/filter_yaml'
require 'lib/filter_xml'

# assets
set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'

# plugins
activate :livereload
activate :directory_indexes
configure :build do
  activate :minify_css
  activate :minify_javascript
end
