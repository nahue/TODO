#!/usr/bin/env bash

#echo "Installing Unicorn"
#sudo gem install unicorn >/dev/null 2>&1
echo "Setup init script"
sudo rm /etc/init.d/unicorn
sudo ln -s /home/vagrant/deploy/TODO_staging/current/provision/unicorn_init.sh /etc/init.d/unicorn
echo "Unicorn installed"
