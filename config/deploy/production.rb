server "#{domain}", :app, :web, :db, :primary => true

set :user, passwords['production']['user']
set :deploy_to, "/home/#{user}/domains/#{domain}/web/public"
