vagrant-devmachine
==================

Scripts for creating a development machine in a Vagrant box.


Getting started:
 vagrant init local/srv-fedora-heisenbug64
 edit the Vagrantfile
 vagrant up
 vagrant ssh
 sudo /vagrant/post_up.pl


Vagrantfile additions: 
  # Tomcat
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  # Sonar
  config.vm.network "forwarded_port", guest: 9000, host: 9000 
  # postgresql - used for sonar-runner
  config.vm.network "forwarded_port", guest: 5432, host: 5432

