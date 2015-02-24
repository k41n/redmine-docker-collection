#!/bin/bash

service mysql start
cd /var/www/redmine
chruby-exec ruby-2.1.5 -- bundle exec rake db:create
chruby-exec ruby-2.1.5 -- bundle exec rake db:migrate
chruby-exec ruby-2.1.5 -- bundle exec rake generate_secret_token
REDMINE_LANG=en chruby-exec ruby-2.1.5 -- bundle exec rake redmine:load_default_data
cd /var/www/redmine/plugins
git clone git@bitbucket.org:redminecrm/redmine_checklists.git
git clone git@bitbucket.org:redminecrm/redmine_contacts.git
git clone git@bitbucket.org:redminecrm/redmine_contacts_invoices.git
git clone git@bitbucket.org:redminecrm/redmine_products.git
git clone git@bitbucket.org:redminecrm/redmine_agile.git
git clone git@bitbucket.org:redminecrm/redmine_contacts_helpdesk.git
cd /var/www/redmine
chruby-exec ruby-2.1.5 -- bundle install
chruby-exec ruby-2.1.5 -- bundle exec rake redmine:plugins
