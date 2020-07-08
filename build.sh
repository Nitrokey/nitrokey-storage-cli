#!/bin/bash

cd
wget https://github.com/libusb/libusb/releases/download/v1.0.23/libusb-1.0.23.tar.bz2
tar xf libusb-1.0.23.tar.bz2
cd libusb-1.0.23
./configure --prefix=/usr --disable-shared --disable-udev
make
make install DESTDIR=`pwd`/foo

cd
git clone https://github.com/libusb/hidapi
cd hidapi
export libudev_CFLAGS=-I/usr/include
./bootstrap
./configure --prefix=/usr --disable-shared
make
make install DESTDIR=`pwd`/foo

cd
git clone https://github.com/Nitrokey/libnitrokey.git
cd libnitrokey
mkdir build
cd build
cmake ..  -DBUILD_SHARED_LIBS=OFF -DCOMPILE_TESTS=OFF -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
make
make install DESTDIR=`pwd`/foo 




cp /root/libusb-1.0.23/foo/usr/lib/libusb-1.0.a .
cp /root/hidapi/foo/usr/lib/libhidapi-libusb.a .
cp /root/libnitrokey/build/foo/usr/lib/libnitrokey.a .


