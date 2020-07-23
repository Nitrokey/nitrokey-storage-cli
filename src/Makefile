
CFLAGS=-I/usr/include -L/usr/lib
CC_FLAGS=-Os $(CFLAGS)
CC=g++ $(CFLAGS)
DESTDIR=/usr
#-C build LDFLAGS=/heads/install/lib/libusb-1.0.so install DESTDIR=/heads/install


all:
	$(CC) -c nkstorecli.cc -o nkstorecli.o 
	$(CC) nkstorecli.o -lusb -lhidapi-libusb -lnitrokey  -o nkstorecli
	#libnitrokey.a libhidapi-libusb.a libusb-1.0.a

install:
	cp nkstorecli $(DESTDIR)/bin


static:
	g++ -Os -static nkstorecli.cc -o nkstorecli libnitrokey.a libhidapi-libusb.a libusb-1.0.a
	#strip nkstorecli
	#upx nkstorecli
