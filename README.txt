Container to build nginx 1.12.0 DEB packages for Ubuntu 14.04 (works in 16.04). 
With lua+pagespeed modules among others (feel free to add your own modules)

To add another nginx modules just add the code to automate the download and setup in the bash script and add the modules in the dependencies of rules-1.12.0 file (in the full, light or extras flavor, up to you)

I've added them on for the "nxing-extras" package


$ mkdir /tmp/output ; \
  docker build -t nginxbuild . ; \
  docker run -ti --name nginxbuild -v /tmp/output:/tmp/output nginxbuild:latest ./setupnginxluapagespeed.sh

# At this point you should have all the .deb packages on your local folder /tmp/output, feel free to remove the container to free space

$ docker rm nginxbuild


Install packages from /tmp/output. nginx-extras nginx-common and probably some deps.
