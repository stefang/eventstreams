set :application, "eventstreams"
set :repository, 'git@github.com:stefang/eventstreams.git'
set :revision, 'master' # git branch to deploy
set :web_command, 'sudo apache2ctl' # command to start/stop apache

task :edge do
  set :rails_env, 'edge'
  set :domain, "eventstreams@eventstreams.triplegeek.com"
  set :deploy_to, "/var/www/eventstreams.triplegeek.com/app/"
end

task :production do
  set :rails_env, 'production'
  set :domain, "eventstreams@eventstreams.triplegeek.com"
  set :deploy_to, "/var/www/eventstreamsapp.com"
end