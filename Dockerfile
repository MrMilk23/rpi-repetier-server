FROM debian

VOLUME /var/lib/Repetier-Server

EXPOSE 3344

CMD [ "/usr/local/Repetier-Server/bin/RepetierServer", "-c", "/usr/local/Repetier-Server/etc/RepetierServer.xml" ]

RUN apt-get update \
  && apt-get install -y wget \
  && wget https://download3.repetier.com/files/server/debian-armhf/Repetier-Server-1.0.4-Linux.deb -O Repetier.deb \
  && dpkg --add-architecture armhf \
  && dpkg --unpack Repetier.deb \
  && rm -rf Repetier.deb \
  && rm -rf /var/lib/apt/lists/*
