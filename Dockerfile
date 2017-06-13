FROM ubuntu:14.04

LABEL maintainer "igonzalezvaliente@gmail.com"


ADD setupnginxluapagespeed.sh /tmp
ADD rules-1.12.0 /tmp
ADD README.txt /tmp

WORKDIR /tmp

ENTRYPOINT ["/bin/bash"]


