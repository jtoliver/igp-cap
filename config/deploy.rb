set :application, "Test Cap"
set :repository,  "git@github.com:jtoliver/igp-cap.git"
set :branch, "master"
set :scm, "git"
set :deploy_via, :remote_cache
set :deploy_to, "/var/www/html/cap/app"
set :user, "ec2-user"
set :scm_passphrase, "globalreach"
set :use_sudo, true
set :copy_exclude, [".git/*", "Capfile", "config/*"]
ssh_options[:forward_agent] = true
server "107.20.143.151",  :deploy
default_run_options[:pty] = true

role :app, '107.20.143.151'
role :web, '107.20.143.151'

namespace :deploy do
  task :start do ; end
  
  task :stop do ; end
  
  task :finalize_update, :except => { :no_release => true } do
    transaction do
      run "#{sudo} chmod -R g+w #{releases_path}/#{release_name}"
    end
  end
  
  task :migrate do
    # do nothing
  end
  
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "sudo service httpd restart"
  end
end                            


