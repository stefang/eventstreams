set :application, "eventstreams"
set :repository, 'git@github.com:stefang/eventstreams.git'
set :revision, 'master' # git branch to deploy
set :web_command, 'sudo /etc/init.d/nginx' # command to start/stop apache

task :edge do
  set :rails_env, 'edge'
  set :domain, "g3@triplegeek.com"
  set :my_deploy_path, "/var/www/edge.eventstreamsapp.com/app/"
  set :deploy_to, "/var/www/edge.eventstreamsapp.com/app/"
end

task :staging do
  set :rails_env, 'staging'
  set :domain, "g3@triplegeek.com"
  set :my_deploy_path, "/var/www/staging.eventstreamsapp.com/app/"
  set :deploy_to, "/var/www/staging.eventstreamsapp.com/app/"
end

task :production do
  set :rails_env, 'production'
  set :domain, "g3@triplegeek.com"
  set :my_deploy_path, "/var/www/eventstreamsapp.com/app/"
  set :deploy_to, "/var/www/eventstreamsapp.com/app/"
end

desc "Full deployment cycle"
namespace :vlad do
  remote_task :bundle_install do
      run "cd #{my_deploy_path}current && bundle install --path #{my_deploy_path}shared/bundled_gems"
      run "ln -s #{my_deploy_path}shared/bundled_gems #{my_deploy_path}current/vendor/bundle"
  end
  remote_task :manual_migrate do
      run "cd #{my_deploy_path}current && /usr/local/bin/rake db:migrate RAILS_ENV=#{rails_env}"
  end
  remote_task :symlink_assets do
      run "ln -s #{my_deploy_path}shared/event_assets #{my_deploy_path}current/assets/event_assets"
  end
  remote_task :custom_restart do
      run "touch #{my_deploy_path}current/tmp/restart.txt"
  end
  remote_task :deploy => [:update, :bundle_install, :manual_migrate, :symlink_assets, :cleanup, :custom_restart]
end