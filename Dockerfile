FROM ubuntu:trusty-20190425
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y

# Install dependencies
RUN apt-get install -qy --fix-missing texlive-full
RUN apt-get install -qy --fix-missing python-pygments
RUN apt-get install -qy --fix-missing texlive-math-extra
RUN apt-get install -qy --fix-missing gnuplot
RUN apt-get install -qy --fix-missing make

# Cleanup
RUN apt-get -yq autoremove
RUN apt-get clean -y
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
