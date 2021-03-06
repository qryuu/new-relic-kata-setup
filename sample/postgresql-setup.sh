#!/bin/bash

sudo sed -i -e "s/host    all             all             127.0.0.1\/32            ident/host    all             all             127.0.0.1\/32            trust/g" /var/lib/pgsql9/data/pg_hba.conf

sudo chkconfig postgresql on
sudo service postgresql initdb --encoding=UTF8 --no-locale
sudo service postgresql start

sudo -u postgres createuser -s ec2-user
sudo -u postgres createdb ec2-user
sudo -u postgres psql -c "ALTER USER \"ec2-user\" WITH SUPERUSER;"  

sudo service postgresql restart
