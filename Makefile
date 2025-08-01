SHELL := /bin/bash

VERSION := 3.6.8-1
WORKDIR := python3.6-$(shell cut -d- -f1 <<< '$(VERSION)')

.PHONY: builddeb
builddeb:
	dget -x https://snapshot.debian.org/archive/debian/20190103T084931Z/pool/main/p/python3.6/python3.6_3.6.8-1.dsc
	cd $(WORKDIR) \
		&& DEBFULLNAME='Chris Kuehl' DEBEMAIL=ckuehl@ocf.berkeley.edu \
			dch --local ~deb9u --distribution stretch-backports 'Backported for stretch.' \
		&& DEB_BUILD_OPTIONS=nocheck dpkg-buildpackage -us -uc -sa