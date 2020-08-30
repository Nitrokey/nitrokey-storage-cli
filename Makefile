VERSION=$(shell cat VERSION)
RELEASEDIR=nkstorecli-$(VERSION)

all: nkstorecli


nkstorecli:
	make -C src local

	
tests: nkstorecli
	stat nkstorecli


clean:
	rm -rf $(RELEASEDIR)
	rm $(RELEASEDIR).tar.gz  $(RELEASEDIR).tar.gz.sig $(RELEASEDIR).tar.gz.sha256

release: 
	mkdir -p $(RELEASEDIR)
	cp -r Makefile src VERSION LICENSE README.md $(RELEASEDIR)/

	tar czf $(RELEASEDIR).tar.gz $(RELEASEDIR)
	sha256sum $(RELEASEDIR).tar.gz > $(RELEASEDIR).tar.gz.sha256
	gpg --detach-sign $(RELEASEDIR).tar.gz

	stat $(RELEASEDIR).tar.gz $(RELEASEDIR).tar.gz.sha256


