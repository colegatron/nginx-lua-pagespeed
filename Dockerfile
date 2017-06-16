FROM ubuntu:14.04

LABEL maintainer "igonzalezvaliente@gmail.com"


ADD set.sh /tmp
ADD rules-pagespeed-1.12.0 /tmp
ADD README.txt /tmp

WORKDIR /tmp

ENTRYPOINT ["/bin/bash"]


