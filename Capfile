# Load DSL and set up stages
require 'capistrano/setup'
require 'capistrano/rbenv'

# Include default deployment tasks
require 'capistrano/deploy'

Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
