# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'TODO'
set :repo_url, 'git@github.com:nahue/TODO.git'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, "/home/deploy/rails/TODO"
# set :scm, :git
set :rbenv_ruby, File.read('.ruby-version').strip
set :format, :pretty
set :log_level, :debug
set :pty, true

set :user, 'deploy'

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

set :keep_releases, 5

namespace :deploy do

  desc 'Stop application'
  task :stop do
    on roles(:app), in: :sequence, wait: 5 do
      execute "cd #{current_path} && bundle exec passenger stop -p 8080" rescue nil
    end
  end

  desc 'Start application'
  task :start do
    on roles(:app), in: :sequence, wait: 5 do
      execute "cd #{current_path} && bundle exec passenger start -d -p 8080 -e production --user=deploy"
    end
  end

  desc 'Restart application'
  task :restart do
    invoke "deploy:stop"
    invoke "deploy:start"
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'

end
