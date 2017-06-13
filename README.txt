Container to build nginx 1.12.0 with lua+pagespeed among others (feel free to add your own modules)

To add another nginx modules just add the code to automate the download and setup in the bash script and add the modules in the dependencies of rules-1.12.0 file (in the full, light or extras flavor, up to you)

I've added them on for the "nxing-extras" package


$ mkdir /tmp/output ; \
  docker build -t nginxbuild . ; \
  docker run -ti --name nginxbuild -v /tmp/output:/tmp/output nginxbuild:latest ./setupnginxluapagespeed.sh

# At this point you should have all the .deb packages on your local folder /tmp/output, feel free to remove the container to free space

$ docker rm nginxbuild



Notice: Nginx and the modules compiled have some dependencies:

$ sudo apt-get install libgd3 liblua5.1-0 libperl5.18 libxslt1.1 libfontconfig1 libvpx1 libxpm4 fontconfig-config fonts-dejavu-core ttf-bitstream-vera fonts-freefont-ttf gsfonts-x11 gsfonts xfonts-utils libfontenc1 libxfont1 x11-common xfonts-encodings
$ sudo dpkg -i nginx-common_1.12.0-1+trusty1_all.deb nginx-extras_1.12.0-1+trusty1_amd64.deb nginx_1.12.0-1+trusty1_all.deb libnginx-mod-*deb

