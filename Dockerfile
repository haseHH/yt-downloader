FROM ubuntu:latest

# prepare apt
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt install software-properties-common -y

# install tools
RUN add-apt-repository ppa:tomtomtom/yt-dlp && \
    apt install yt-dlp ffmpeg handbrake-cli jq -y

# cleanup
RUN apt clean && \
    rm -rf /var/lib/apt/lists/*

# set user and working dir
USER ubuntu
WORKDIR /download

# add start script and config files
COPY start.sh /start.sh
COPY yt-dlp.conf /etc/yt-dlp/config

ENTRYPOINT [ "/start.sh" ]
