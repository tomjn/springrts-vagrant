#!/bin/bash

ccache -M 5G

cd /home/vagrant
git clone git://github.com/spring/spring.git -b master
cd spring

git submodule sync
git submodule update --init

cmake .
make spring