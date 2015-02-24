#!/bin/bash
/root/first_provision.sh
cd /var/www/redmine && chruby-exec ruby-2.1.5 -- rails s