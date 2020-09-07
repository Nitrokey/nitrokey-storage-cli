CFLAGS=-lstdc++ -lnitrokey-storage -lhidapi-libusb -lusb-1.0
CC=gcc -I/usr/include -L/usr/lib 
DESTDIR=/usr
INSTALL=$(DESTDIR)

STATIC_CFLAGS=-frandom-seed=0x12345678 -ffile-prefix-map=$(pwd)=nkstorecli -Wl,-gc-sections
STATIC_INCLUDES=-I$(INSTALL)/../crossgcc/x86_64-linux-musl/include
STATIC_LIBS=-L$(INSTALL)/lib -L$(INSTALL)/../crossgcc/x86_64-linux-musl/lib64 -lnitrokey -lhidapi-libusb -lusb-1.0 -lstdc++

all: static
	echo "the default build is statically linked - use 'local' for dynamic build"

install: all
	$(STRIP) nkstorecli
	cp nkstorecli $(DESTDIR)/bin

local:
	$(CC) -Os nkstorecli.cc -o nkstorecli -lnitrokey -lhidapi-libusb -lusb -lstdc++

static:
	$(CC) -Os -static nkstorecli.cc $(STATIC_CFLAGS) -o nkstorecli $(STATIC_INCLUDES) $(STATIC_LIBS)
	
	#$(INSTALL)/lib/libnitrokey-storage.a $(INSTALL)/lib/libhidapi-libusb.a $(INSTALL)/../crossgcc/x86_64-linux-musl/lib64/libstdc++.a -lusb-1.0
	#$(CC) -Os -static nkstorecli.cc -Wl,-gc-sections -o nkstorecli  $(INSTALL)/lib/libnitrokey-storage.a $(INSTALL)/lib/libhidapi-libusb.a $(INSTALL)/../crossgcc/x86_64-linux-musl/lib64/libstdc++.a -lusb-1.0
	#$(CC) -Os -static nkstorecli.cc -Wl,-gc-sections -o nkstorecli $(INSTALL)/lib/libnitrokey-storage.a $(INSTALL)/lib/libhidapi-libusb.a $(INSTALL)/lib/libusb-1.0.a $(INSTALL)/../crossgcc/x86_64-linux-musl/lib64/libstdc++.a
	#strip nkstorecli
	#upx nkstorecli
