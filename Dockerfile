FROM ubuntu:14.04
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y

# Install dependencies
RUN apt-get install -qy --fix-missing texlive-full
RUN apt-get install -qy --fix-missing python-pygments
RUN apt-get install -qy --fix-missing texlive-math-extra
RUN apt-get install -qy --fix-missing gnuplot
RUN apt-get install -qy --fix-missing make

# Cleanup
RUN apt-get -yq autoremove && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
