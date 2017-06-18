server 'hera.avicus.net', user: 'deploy', roles: %w{web app}
set :stage, :live

set :branch, 'master'
set :deploy_to, '/home/deploy/docs.avicus.net'
set :tmp_dir, '/tmp'
