vagrant-devmachine
==================

Scripts for creating a development machine in a Vagrant box.


Getting started:

Creating a new devmachine:
 git clone git@HOST:/var/git/vagrant-devmachine.git
 cd vagrant-devmachine
 vagrant init local/srv-fedora-heisenbug64
 edit the Vagrantfile
 vagrant up
 vagrant ssh
 sudo /vagrant/post_up.pl
 exit
 vagrant-admin
 exit
 # vagrant global-status
 /cygdrive/c/Program\ Files/Oracle/VirtualBox/VBoxManage  list vms
 time  ../vagrant-admin/create_vagrant_base_box.pl --srcname vagrant-devmachine_default_1435814920455_21512 --sharecfg vagrant.cfg  --dstname dev-machine
 SCP the files

 # register the box
 $ vagrant box add http://10.1.2.3/storage/vagrant/dev-machine.json

 # init the box (this creates a .vagrant folder and a Vagrantfile in the cwd with the appropriate box name)
 $ vagrant init local/dev-machine



Vagrantfile additions: 
  # Tomcat
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  # Sonar
  config.vm.network "forwarded_port", guest: 9000, host: 9000 
  # postgresql - used for sonar-runner
  config.vm.network "forwarded_port", guest: 5432, host: 5432

