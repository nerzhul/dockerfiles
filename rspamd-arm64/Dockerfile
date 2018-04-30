FROM arm64v8/debian:stretch

RUN echo "deb http://ftp.fr.debian.org/debian stretch-backports main contrib non-free" > /etc/apt/sources.list.d/stretch-backports.list \
        && apt-get update -qyy \
        && apt-get install -y git cmake libssl1.0-dev libevent-dev libglib2.0-dev \
                libsqlite3-dev libmagic-dev libfann-dev ragel libicu-dev
RUN apt-get install -t stretch-backports -y libluajit-5.1-dev

RUN git clone --recursive https://github.com/vstakhov/rspamd.git -b 1.7.3
RUN mkdir cmakebuild \
        && cd cmakebuild \
        && cmake ../rspamd \
        && make \
        && make install

