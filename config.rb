# route layouts
page '*/examples.html', :layout => 'container'
page '*/references/*', :layout => 'reference'
page '*/modules/*', :layout => 'module'
page '/', :layout => 'home'

# view helpers
require 'lib/event_helpers'
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
activate :i18n, :mount_at_root => false
activate :directory_indexes
configure :build do
  activate :minify_css
  activate :minify_javascript
end
