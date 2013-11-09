#!/bin/bash


echo "setting ccache size"
ccache -M 5G

echo "cloning spring"
cd /home/vagrant
git clone -b master git://github.com/spring/spring.git 

echo "cloning mxe"

git clone -b master https://github.com/mxe/mxe.git


echo "cloning springlobby"

git clone --recursive https://github.com/springlobby/springlobby/


echo "build spring"
cd spring

echo "updating/init spring submodules"
git submodule sync
git submodule update --init

echo "executing cmake spring"
cmake .

echo "making spring"
make spring


# @TODO: ammend the mxe settings.mk targets and build mxe

# @TODO: build springlobby 
