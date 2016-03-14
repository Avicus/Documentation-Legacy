server 'athena.avicus.net', user: 'deploy', roles: %w{web app}
set :stage, :live

set :branch, 'master'
set :deploy_to, '/var/www/html/atlas.avicus.net'
set :tmp_dir, '/home/deploy/tmp'