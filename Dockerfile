FROM bitnami/minideb:buster
# (Previous) MAINTAINER mdhiggins <mdhiggins23@gmail.com>

# get vim, ffmpeg, git, and install python libraries
RUN install_packages \
    git \
    wget \
    vim \
    ffmpeg \
    python3 \
    python3-pip \
    python3-setuptools && \

# pip modules
    python3 -m pip install --upgrade pip && \
    pip3 install wheel && \
    pip3 install requests && \
    pip3 install requests[security] && \
    pip3 install requests-cache && \
    pip3 install babelfish && \
    pip3 install 'guessit<2' && \
    pip3 install 'subliminal<2' && \
    pip3 uninstall -y stevedore && \
    pip3 install stevedore==1.19.1 && \
    pip3 install qtfaststart && \
# Symlink
    ln -s /usr/bin/python3 /usr/bin/python && \

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

WORKDIR /sickbeard_mp4_automator
CMD ["/bin/bash"]
