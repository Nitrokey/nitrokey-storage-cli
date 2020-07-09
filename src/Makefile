

all:
	g++ -Os -static nkstorecli.cc -o nkstorecli libnitrokey.a libhidapi-libusb.a libusb-1.0.a
	strip nkstorecli
	#upx nkstorecli
