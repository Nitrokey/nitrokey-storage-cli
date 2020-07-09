VERSION=$(shell cat VERSION)
RELEASEDIR=nkstorecli-$(VERSION)

all: image nkstorecli tests

image:
	docker build -t nitrokey/nkstorecli .


nkstorecli: image
	docker rm nkstorecli || true
	docker run --name nkstorecli nitrokey/nkstorecli:latest /root/build.sh
	docker cp nkstorecli:/root/nkstorecli/src/nkstorecli .
	docker stop nkstorecli

	
tests: nkstorecli
	stat nkstorecli


release: 
	mkdir -p $(RELEASEDIR)
	cp nkstorecli $(RELEASEDIR)/nkstorecli.upx
	strip $(RELEASEDIR)/nkstorecli.upx
	upx $(RELEASEDIR)/nkstorecli.upx
	cp nkstorecli $(RELEASEDIR)/nkstorecli
	strip $(RELEASEDIR)/nkstorecli
	cp VERSION $(RELEASEDIR)

	tar czf $(RELEASEDIR).tar.gz $(RELEASEDIR)
	sha256sum $(RELEASEDIR).tar.gz > $(RELEASEDIR).tar.gz.sha256
	
	stat $(RELEASEDIR).tar.gz $(RELEASEDIR).tar.gz.sha256
