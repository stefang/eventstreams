set :application, "eventstreams"
set :repository, 'git@github.com:stefang/eventstreams.git'
set :revision, 'master' # git branch to deploy
set :web_command, 'sudo apache2ctl' # command to start/stop apache
set :deploy_timestamped, false

task :edge do
  set :rails_env, 'edge'
  set :domain, "eventstreams@eventstreams.triplegeek.com"
  set :my_deploy_path, "/var/www/eventstreams.triplegeek.com/app/"
  set :deploy_to, "/var/www/eventstreams.triplegeek.com/app/"
end

task :production do
  set :rails_env, 'production'
  set :domain, "eventstreams@eventstreams.triplegeek.com"
  set :my_deploy_path, "/var/www/eventstreamsapp.com/app/"
  set :deploy_to, "/var/www/eventstreamsapp.com/app/"
end

desc "Full deployment cycle"
namespace :vlad do
  remote_task :manual_migrate do
      run "cd #{my_deploy_path}current && /usr/bin/rake db:migrate RAILS_ENV=#{rails_env}"
  end
  remote_task :symlink_assets do
      run "ln -s #{my_deploy_path}shared/event_assets #{my_deploy_path}current/assets/event_assets"
  end
  remote_task :custom_restart do
      run "touch #{my_deploy_path}current/tmp/restart.txt"
  end
  remote_task :deploy => [:update, :manual_migrate, :symlink_assets, :cleanup, :custom_restart]
end