CFLAGS=-I/usr/include -L/usr/lib
CC=g++ $(CFLAGS)
DESTDIR=/usr

all:
	$(CC) -Os -c nkstorecli.cc -o nkstorecli.o 
	$(CC) nkstorecli.o -lusb -lhidapi-libusb -lnitrokey  -o nkstorecli

install: all
	$(STRIP) nkstorecli
	cp nkstorecli $(DESTDIR)/bin

static:
	g++ -Os -static nkstorecli.cc -o nkstorecli libnitrokey.a libhidapi-libusb.a libusb-1.0.a
	#strip nkstorecli
	#upx nkstorecli
