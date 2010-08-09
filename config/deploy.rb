set :application, "eventstreams"
set :domain, "eventstreams@eventstreams.triplegeek.com"
set :deploy_to, "/var/www/eventstreams.triplegeek.com/app/"
set :repository, 'git@github.com:stefang/eventstreams.git'
set :revision, 'master' # git branch to deploy
set :rails_env, 'development'
set :web_command, 'sudo apache2ctl' # command to start/stop apache