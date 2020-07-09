FROM muslcc/i686:i686-linux-musl

RUN apk add bash vim make hidapi libusb git cmake qt5-qttools pkgconfig hidapi-dev automake libtool \
	eudev-dev libusb-dev qt5-qttools qt5-qttools-dev autoconf upx build-base alpine-sdk

WORKDIR /root

ADD build.sh /root/build.sh

CMD /bin/bash /root/build.sh
