

all:
	g++ -Os -static nkstorecli.cc -o ucli libnitrokey.a libhidapi-libusb.a libusb-1.0.a
	strip nkstorecli
	upx nkstorecli
