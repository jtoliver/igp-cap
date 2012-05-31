set :application, "Test Cap"
set :repository,  "git@github.com:jtoliver/igp-cap.git"
set :branch, "master"
set :scm, "git"
set :deploy_via, :remote_cache
set :deploy_to, "/var/www/html/cap/"
set :user, "ec2-user"
set :scm_passphrase, "globalreach"
set :use_sudo, true
ssh_options[:forward_agent] = true
server "107.20.143.151",  :deploy
default_run_options[:pty] = true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    #run "#{try_sudo} /etc/init.d/lsws reload" # we use LiteSpeed Web Server
  end
end                            


