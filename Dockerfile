FROM linuxserver/sonarr:preview
# (Previous) MAINTAINER mdhiggins <mdhiggins23@gmail.com>

# get python3, vim, ffmpeg, git, and install python libraries
RUN \
  apt-get update && \
  apt-get install -y \
    git \
    wget \
    vim \
    ffmpeg \
    python3 \
    python3-pip && \

# install pip modules
  pip3 install --upgrade pip && \
  pip3 install requests && \
  pip3 install requests[security] && \
  pip3 install requests-cache && \
  pip3 install babelfish && \
  pip3 install 'guessit<2' && \
  pip3 install 'subliminal<2' && \
  pip3 install stevedore==1.19.1 && \
  pip3 install python-dateutil && \
  pip3 install qtfaststart && \

# clone repo
  mkdir /sickbeard_mp4_automator && \
  chmod 777 /sickbeard_mp4_automator && \
  git clone https://github.com/mdhiggins/sickbeard_mp4_automator.git /sickbeard_mp4_automator && \

# create logging directory
  mkdir /var/log/sickbeard_mp4_automator && \
  touch /var/log/sickbeard_mp4_automator/index.log && \
  chgrp -R users /var/log/sickbeard_mp4_automator && \
  chmod -R g+w /var/log/sickbeard_mp4_automator && \

# ffmpeg manual deploy
#  wget https://johnvansickle.com/ffmpeg/builds/ffmpeg-git-amd64-static.tar.xz -O /tmp/ffmpeg.tar.xz && \
#  mkdir /usr/local/bin/ffmpeg && \
#  tar -xJf /tmp/ffmpeg.tar.xz -C /usr/local/bin/ffmpeg --strip-components 1 && \
#  chgrp -R users /usr/local/bin/ffmpeg && \
#  chmod g+x /usr/local/bin/ffmpeg/ffmpeg && \
#  chmod g+x /usr/local/bin/ffmpeg/ffprobe && \

# cleanup
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/*
