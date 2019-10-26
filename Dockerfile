FROM bitnami/minideb:buster
# (Previous) MAINTAINER mdhiggins <mdhiggins23@gmail.com>

# get vim, ffmpeg, git, and install python libraries
RUN \
  install_packages \
    git \
    wget \
    vim \
    ffmpeg \
    python3 \
    python3-pip && \
    
# pip modules
    pip install requests && \ 
    pip install requests[security] && \ 
    pip install requests-cache && \ 
    pip install babelfish && \ 
    pip install 'guessit<2' && \ 
    pip install 'subliminal<2' && \ 
    pip uninstall -y stevedore && \
    pip install stevedore==1.19.1 && \ 
    pip install qtfaststart && \ 

# clone repo
  mkdir /sickbeard_mp4_automator && \
  git clone https://github.com/mdhiggins/sickbeard_mp4_automator.git /sickbeard_mp4_automator && \
  touch /sickbeard_mp4_automator/info.log && \ 
  chmod a+rwx -R /sickbeard_mp4_automator && \

# create logging directory
  mkdir /var/log/sickbeard_mp4_automator && \
  touch /var/log/sickbeard_mp4_automator/index.log && \
  chgrp -R users /var/log/sickbeard_mp4_automator && \
  chmod -R g+w /var/log/sickbeard_mp4_automator && \

# cleanup
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/*
