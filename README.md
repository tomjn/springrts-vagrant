# Spring RTS vagrant

Startings of a Vagrant environment for building spring

## Requirements

 - Vagrant
 - Virtualbox

## Usage

To use, clone this repository, then from the terminal, execute `vagrant up` in the root folder. An Ubuntu 10 virtual machine will be created, and the necessary dependencies provisioned. This may take a few minutes.

When `vagrant up` finishes, check that all is running fine with `vagrant status`. If the box is running, use `vagrant ssh` to log into the box, using the password "vagrant", and run the `init-spring.sh` script in your home directory to grab spring, the AIs, and run the cmake scripts.

When finished, exit the VM, then you can shutdown the box with `vagrant halt`, or suspend it with `vagrant suspend`.

Spring source will be checked out into `/home/vagrant/spring`. `/home/vagrant/` is mapped on to the `home` folder for shared access with the host machine.
