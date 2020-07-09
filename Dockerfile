FROM muslcc/i686:i686-linux-musl

RUN apk add bash make hidapi libusb git cmake pkgconfig hidapi-dev automake libtool \
	eudev-dev libusb-dev autoconf upx 

#build-base alpine-sdk
RUN ln -s /bin/cc /bin/cc1



WORKDIR /root

ADD build.sh /root/build.sh

#CMD /bin/bash /root/build.sh
