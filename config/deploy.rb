# config valid only for current version of Capistrano
lock '3.4.1'

set :application, 'atlas.avicus.net'
set :repo_url, 'git@github.com:Avicus/atlas.avicus.net.git'
set :keep_releases, 3
set :deploy_via, :copy

namespace :deploy do
  desc 'Build middleman.'
  task :build do
    on roles(:web) do
      within release_path do
        execute *%w[middleman build]
      end
    end
  end

  after :finished, :build
end
