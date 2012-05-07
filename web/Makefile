SRCDIRLIST=conf duvenx

BUILDDIR=./build
COPY=rsync -a --exclude .svn
PKGNAME=`head -n 1 debian/changelog |cut -d\  -f1`
PKGVER=`head -n 1 debian/changelog |grep -oE "([0-9]+\.)+[0-9]+"`


all:
	mkdir -p ${BUILDDIR}
	${COPY} ${SRCDIRLIST} ${BUILDDIR}
	# symlinks are managed in install.links
	find ${BUILDDIR} -type l -exec unlink {} \;

install:
	true

clean:
	rm -rf ${BUILDDIR}

pkgbuild:
	dpkg-buildpackage -b -uc
	mkdir -p pkg
	mv ../${PKGNAME}_${PKGVER}*deb pkg/
	rm -f ../${PKGNAME}_${PKGVER}*changes
	echo "Package build OK"

pkginst: pkgbuild
	dpkg -i pkg/${PKGNAME}_${PKGVER}*deb
	echo "Package install OK"

pkgclean:
	./debian/rules clean

