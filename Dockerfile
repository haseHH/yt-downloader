FROM ubuntu:latest

# prepare apt
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt install software-properties-common -y

# install tools
RUN add-apt-repository ppa:tomtomtom/yt-dlp && \
    apt install yt-dlp ffmpeg jq moreutils -y

# install PhantomJS
RUN apt install wget bzip2 fontconfig -y && \
    wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 && \
    tar xvjf phantomjs-2.1.1-linux-x86_64.tar.bz2 && \
    mv phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/bin/phantomjs && \
    rm -rf phantomjs*

# cleanup
RUN apt clean && \
    rm -rf /var/lib/apt/lists/*

# set user and working dir
USER ubuntu
WORKDIR /output

# add start script and config files
COPY start.sh /start.sh
COPY yt-dlp.conf /etc/yt-dlp/config

ENTRYPOINT [ "/start.sh" ]
