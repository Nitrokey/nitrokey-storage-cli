CFLAGS=-lstdc++ -shared-libgcc -lnitrokey -lhidapi-libusb -lusb-1.0
CC=gcc -I/usr/include -L/usr/lib 
DESTDIR=/usr

all:
	$(CC) -Os nkstorecli.cc $(CFLAGS) -o nkstorecli

install: all
	$(STRIP) nkstorecli
	cp nkstorecli $(DESTDIR)/bin

static:
	g++ -Os -static nkstorecli.cc -o nkstorecli libnitrokey.a libhidapi-libusb.a libusb-1.0.a
	#strip nkstorecli
	#upx nkstorecli
