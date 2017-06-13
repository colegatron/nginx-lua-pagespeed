Container to build nginx 1.12.0 DEB packages for Ubuntu 14.04 (works in 16.04). 
With lua+pagespeed modules among others (feel free to add your own modules)

To add another nginx modules just add the code to automate the download and setup in the bash script and add the modules in the dependencies of rules-1.12.0 file (in the full, light or extras flavor, up to you)

I've added them on for the "nxing-extras" package


$ mkdir /tmp/output ; \
  docker build -t nginxbuild . ; \
  docker run -ti --name nginxbuild -v /tmp/output:/tmp/output nginxbuild:latest ./setupnginxluapagespeed.sh

# At this point you should have all the .deb packages on your local folder /tmp/output, feel free to remove the container to free space

$ docker rm nginxbuild



Notice: Nginx and the modules compiled have some dependencies:

$ sudo apt-get install libgd3 \
	liblua5.1-0 libperl5.18 libxslt1.1 libfontconfig1 \
 	libvpx1 libxpm4 fontconfig-config fonts-dejavu-core \
 	ttf-bitstream-vera fonts-freefont-ttf gsfonts-x11 gsfonts \
 	xfonts-utils libfontenc1 libxfont1 x11-common xfonts-encodings \
 	libfreetype6 libjpeg8 libtiff5 libgeoip1 libxml2 libx11-6 \
 	libjpeg-turbo8 libjbig0 libxcb1 libx11-data libxdmcp6 libxau6


$ sudo dpkg -i nginx-common_1.12.0-1+trusty1_all.deb \
	nginx-extras_1.12.0-1+trusty1_amd64.deb \
	libnginx-mod-http-auth-pam_1.12.0-1+trusty1_amd64.deb \
	libnginx-mod-http-cache-purge_1.12.0-1+trusty1_amd64.deb \
 	libnginx-mod-http-dav-ext_1.12.0-1+trusty1_amd64.deb \
 	libnginx-mod-http-echo_1.12.0-1+trusty1_amd64.deb \
 	libnginx-mod-http-fancyindex_1.12.0-1+trusty1_amd64.deb \
 	libnginx-mod-http-geoip_1.12.0-1+trusty1_amd64.deb \
 	libnginx-mod-http-headers-more-filter_1.12.0-1+trusty1_amd64.deb \
 	libnginx-mod-http-xslt-filter_1.12.0-1+trusty1_amd64.deb \
 	libnginx-mod-http-upstream-fair_1.12.0-1+trusty1_amd64.deb \
 	libnginx-mod-http-uploadprogress_1.12.0-1+trusty1_amd64.deb \
 	libnginx-mod-http-subs-filter_1.12.0-1+trusty1_amd64.deb \
 	libnginx-mod-http-perl_1.12.0-1+trusty1_amd64.deb \
 	libnginx-mod-http-lua_1.12.0-1+trusty1_amd64.deb \
 	libnginx-mod-http-image-filter_1.12.0-1+trusty1_amd64.deb \
 	libnginx-mod-http-ndk_1.12.0-1+trusty1_amd64.deb \
 	libnginx-mod-stream_1.12.0-1+trusty1_amd64.deb \
 	libnginx-mod-nchan_1.12.0-1+trusty1_amd64.deb \
 	libnginx-mod-mail_1.12.0-1+trusty1_amd64.deb


