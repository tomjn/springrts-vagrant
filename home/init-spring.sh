#!/bin/bash


ROOT=/home/vagrant

echo "setting ccache size"
ccache -M 5G

echo "cloning spring"
cd $ROOT
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

echo "creating cross-env for spring & springlobby"
cd $ROOT/mxe
make settings.mk
echo "MXE_TARGETS := i686-w64-mingw32" >>settings.mk


echo "compiling springlobby"
cd $ROOT/springlobby
cmake -DCMAKE_TOOLCHAIN_FILE=$ROOT/mxe/usr/i686-w64-mingw32/share/cmake/mxe-conf.cmake .
make

#echo "compiling spring"
#cd $ROOT/spring
#cmake -DCMAKE_TOOLCHAIN_FILE=$ROOT/mxe/usr/i686-w64-mingw32/share/cmake/mxe-conf.cmake .
#make spring


cd $ROOT


