Container to build nginx with lua+pagespeed among others (feel free to add your own modules)

Just add the source code in the bash script and add the modules in the rules-1.12.0 file (in the full, light or extras flavor, up to you)


$ mkdir /tmp/output ; \
  docker build -t nginxbuild . ; \
  docker run -ti --name nginxbuild -v /tmp/output:/tmp/output nginxbuild:latest ./setupnginxluapagespeed.sh

# At this point you should have all the .deb packages on your local folder /tmp/output, feel free to remove the container to free space

$ docker rm nginxbuild


