CFLAGS=-lstdc++ -lnitrokey-storage -lhidapi-libusb -lusb-1.0
CC=gcc -I/usr/include -L/usr/lib 
DESTDIR=/usr
INSTALL=$(DESTDIR)

all: static
	#$(CC) -Os nkstorecli.cc $(CFLAGS) -o nkstorecli
	echo "noope, no dyn, build static"

install: all
	$(STRIP) nkstorecli
	cp nkstorecli $(DESTDIR)/bin

static:
	$(CC) -Os -static nkstorecli.cc -Wl,-gc-sections -o nkstorecli $(INSTALL)/lib/libnitrokey-storage.a $(INSTALL)/lib/libhidapi-libusb.a $(INSTALL)/lib/libusb-1.0.a $(INSTALL)/../crossgcc/x86_64-linux-musl/lib64/libstdc++.a
	#strip nkstorecli
	#upx nkstorecli
