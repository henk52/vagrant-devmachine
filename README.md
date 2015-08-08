vagrant-devmachine
==================

Scripts for creating a development machine in a Vagrant box.


Getting started:

Creating a new devmachine:
1. git clone git@HOST:/var/git/vagrant-devmachine.git
1. cd vagrant-devmachine
1. vagrant init local/srv-fedora-heisenbug64
1. edit the Vagrantfile
1. vagrant up
1. vagrant ssh
1. sudo /vagrant/post_up.pl
1. exit
1. vagrant-admin
1. exit
1. # vagrant global-status
1. /cygdrive/c/Program\ Files/Oracle/VirtualBox/VBoxManage  list vms
1. time  ../vagrant-admin/create_vagrant_base_box.pl --srcname vagrant-devmachine_default_1435814920455_21512 --sharecfg vagrant.cfg  --dstname dev-machine
1. SCP the files

1. # register the box
1. $ vagrant box add http://10.1.2.3/storage/vagrant/dev-machine.json

1. # init the box (this creates a .vagrant folder and a Vagrantfile in the cwd with the appropriate box name)
1. $ vagrant init local/dev-machine



Vagrantfile additions: 
*  # Tomcat
*  config.vm.network "forwarded_port", guest: 8080, host: 8080
*  # Sonar
*  config.vm.network "forwarded_port", guest: 9000, host: 9000 
*  # postgresql - used for sonar-runner
*  config.vm.network "forwarded_port", guest: 5432, host: 5432

