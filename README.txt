Container to build nginx with lua+pagespeed among others (feel free to add your own modules)

Just add the source code in the bash script and add the modules in the rules-1.12.0 file (in the full, light or extras flavor, up to you)


$ docker build -t nginxbuild .
$ docker run -ti --name nginxbuild nginxbuild:latest

Once inside the container:

root@63569f00e283:/tmp#  ./setupnginxluapagespeed.sh
