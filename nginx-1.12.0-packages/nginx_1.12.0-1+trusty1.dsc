-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: nginx
Binary: nginx, nginx-doc, nginx-common, nginx-full, nginx-light, nginx-extras, libnginx-mod-http-geoip, libnginx-mod-http-image-filter, libnginx-mod-http-xslt-filter, libnginx-mod-mail, libnginx-mod-stream, libnginx-mod-http-perl, libnginx-mod-http-auth-pam, libnginx-mod-http-lua, libnginx-mod-http-ndk, libnginx-mod-nchan, libnginx-mod-http-echo, libnginx-mod-http-upstream-fair, libnginx-mod-http-headers-more-filter, libnginx-mod-http-cache-purge, libnginx-mod-http-fancyindex, libnginx-mod-http-uploadprogress, libnginx-mod-http-subs-filter, libnginx-mod-http-dav-ext
Architecture: any all
Version: 1.12.0-1+trusty1
Maintainer: Debian Nginx Maintainers <pkg-nginx-maintainers@lists.alioth.debian.org>
Uploaders: Kartik Mistry <kartik@debian.org>, Michael Lustfield <michael@lustfield.net>, Christos Trochalakis <ctrochalakis@debian.org>
Homepage: http://nginx.net
Standards-Version: 3.9.8.0
Vcs-Browser: https://anonscm.debian.org/cgit/pkg-nginx/nginx.git
Vcs-Git: https://anonscm.debian.org/cgit/pkg-nginx/nginx.git
Testsuite: autopkgtest
Build-Depends: autotools-dev, debhelper (>= 9), po-debconf, dh-systemd (>= 1.5), dpkg-dev (>= 1.15.5), libexpat-dev, libgd-dev, libgeoip-dev, libhiredis-dev, liblua5.1-0-dev [!i386 !amd64 !kfreebsd-i386 !armel !armhf !powerpc !powerpcspe !mips !mipsel], libluajit-5.1-dev [i386 amd64 kfreebsd-i386 armel armhf powerpc powerpcspe mips mipsel], libmhash-dev, libpam0g-dev, libpcre3-dev, libperl-dev, libssl-dev, libxslt1-dev, quilt, zlib1g-dev
Package-List:
 libnginx-mod-http-auth-pam deb httpd optional arch=any
 libnginx-mod-http-cache-purge deb httpd optional arch=any
 libnginx-mod-http-dav-ext deb httpd optional arch=any
 libnginx-mod-http-echo deb httpd optional arch=any
 libnginx-mod-http-fancyindex deb httpd optional arch=any
 libnginx-mod-http-geoip deb httpd optional arch=any
 libnginx-mod-http-headers-more-filter deb httpd optional arch=any
 libnginx-mod-http-image-filter deb httpd optional arch=any
 libnginx-mod-http-lua deb httpd optional arch=any
 libnginx-mod-http-ndk deb httpd optional arch=any
 libnginx-mod-http-perl deb httpd optional arch=any
 libnginx-mod-http-subs-filter deb httpd optional arch=any
 libnginx-mod-http-uploadprogress deb httpd optional arch=any
 libnginx-mod-http-upstream-fair deb httpd optional arch=any
 libnginx-mod-http-xslt-filter deb httpd optional arch=any
 libnginx-mod-mail deb httpd optional arch=any
 libnginx-mod-nchan deb httpd optional arch=any
 libnginx-mod-stream deb httpd optional arch=any
 nginx deb httpd optional arch=all
 nginx-common deb httpd optional arch=all
 nginx-doc deb doc optional arch=all
 nginx-extras deb httpd extra arch=any
 nginx-full deb httpd optional arch=any
 nginx-light deb httpd extra arch=any
Checksums-Sha1:
 40733c030d0096fe56513c0a4da65c682ca0a18b 980831 nginx_1.12.0.orig.tar.gz
 cc377d7dd9b3d590556def39fa065c9b98738c2e 849516 nginx_1.12.0-1+trusty1.debian.tar.xz
Checksums-Sha256:
 b4222e26fdb620a8d3c3a3a8b955e08b713672e1bc5198d1e4f462308a795b30 980831 nginx_1.12.0.orig.tar.gz
 ed43adff8f9201626f4509ba5e506e78810aa00b4396e1790244da57cdcbfe16 849516 nginx_1.12.0-1+trusty1.debian.tar.xz
Files:
 995eb0a140455cf0cfc497e5bd7f94b3 980831 nginx_1.12.0.orig.tar.gz
 be92e11dcd458f4535915489bbee87b5 849516 nginx_1.12.0-1+trusty1.debian.tar.xz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJZGItwAAoJEGbkJ7T1ae9VeCMP/0Md02ULjrMBG9iQa+8jv2El
ZIah4W3QTmiMC260pUHSF1/5gKUzqYrVMF/UbVabKxuyBUrsxgSpr5tyuODd/bi8
LE7ljImCMjmKNParWtVE7wE8eGPJ6Ce7M8rbvnLFrvOb+mbD6OPOZWDKlxiP+h4F
TimlI0TA9bmcKIu2sdi8s7063FDd2BibxSzyP5DBPaOdOYtSL7z33bo4vCNSJoCX
1FP5h5URYktUPL1QP314n5TUKhu+1APIuuEosNFHa/wp0spB+Lop3OMefQO0BYmn
x3oij9WzsbB+usV6+2BflvcI/CpArcevdrqfI4Nr9J++W4kbwgygYCZCvsPDwwxJ
xLU5huiHasVewqsj0ZUbphx0YE7laSR0uWhiDLyqzAthXOHDzicw77ZKfnl6TNJf
ySFXbt60VY3zsp51LIBt6pS2QhwWsEzkfMhgITy8bmtkBJPSHlGhn2aeq6iEvEgE
dKetJh9rQqGiVYruIdKlSObmr9+Snlb883oZP4idF5WHMIZaP+8r+bhNUXmP+1PD
px4x8+5JUQWoFLk9mqVgcpimD6fO2sScfNaWZluCA9mry3Pkj5sehcLl5dvXYtOF
WNsz0b2AL0nu55WRUop+Onsl6oSPA1vi9Xvrsqe7+1xSq4gRFtU6MtTbbjwDN6XH
2nvQi5p3vZUgOFTYW9Rd
=rdBU
-----END PGP SIGNATURE-----
