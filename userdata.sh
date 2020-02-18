#!/bin/bash

yum update -y
amazon-linux-extras install -y epel 
yum install -y python3
yum install -y gcc-c++ openssl-devel git readline-devel
yum install -y openssl-devel readline-devel zlib-devel curl-devel libyaml-devel libffi-devel
yum install -y node.js npm
yum install -y postgresql postgresql-devel postgresql-server postgresql-contrib postgresql-docs

chmod 755 /home/ec2-user

sudo -u ec2-user curl -L https://raw.githubusercontent.com/c9/install/master/install.sh | bash

sed -i -e "s/host    all             all             127.0.0.1\/32            ident/host    all             all             127.0.0.1\/32            trust/g" /var/lib/pgsql/data/pg_hba.conf

systemctl enable postgresql.service
postgresql-setup initdb
systemctl start postgresql.service

sudo -u postgres createuser -s ec2-user
sudo -u postgres createdb ec2-user
sudo -u postgres psql -c "ALTER USER \"ec2-user\" WITH SUPERUSER;"  

systemctl restart postgresql.service

git clone https://github.com/qryuu/new-relic-kata-setup.git /home/ec2-user/new-relic-kata-setup

git clone https://github.com/newrelic/newrelic-ruby-kata /home/ec2-user/newrelic-ruby-kata

cd /home/ec2-user/newrelic-ruby-kata

sudo -u ec2-user rvm rvmrc warning ignore allGemfiles
sudo -u ec2-user rvm install "ruby-2.2.2"

sudo -u ec2-user bundle install

sudo -u ec2-user bundle exec rake db:create
sudo -u ec2-user pg_restore --verbose --clean --no-acl --no-owner -h localhost -U $USER -d newrelic-ruby-kata_development public/sample-data.dump