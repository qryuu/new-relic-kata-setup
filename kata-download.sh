#!/bin/bash

sudo yum install -y postgresql postgresql-devel postgresql-server postgresql-contrib postgresql-docs

sudo chkconfig postgresql on
service postgresql initdb --encoding=UTF8 --no-locale
sudo service postgresql start

git clone https://github.com/newrelic/newrelic-ruby-kata 