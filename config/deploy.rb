require 'capistrano/ext/multistage'
set :stages, %w(production)
set :default_stage, "production"

set :application, "robbevan"
set :domain, "#{application}.com"

f = "config/passwords.yml"
unless File.exists?(f)
  abort "Couldn't find config/passwords.yml"
end
set :passwords, YAML::load(File.open(f))

set :deploy_via, :copy
set :repository, "_site" 
set :scm, :none 
set :copy_compression, :gzip

set :use_sudo, false

namespace :deploy do

  desc <<-DESC
  A macro-task that updates the code and fixes the symlink.
  DESC
  task :default do
    transaction do
      update_code
      symlink
    end
  end
  
  task :update_code, :except => { :no_release => true } do
    on_rollback { run "rm -rf #{release_path}; true" }
    strategy.deploy!
  end

  task :after_deploy do
    cleanup
  end

  task :after_symlink do
    # link in files from shared
  end
    
end