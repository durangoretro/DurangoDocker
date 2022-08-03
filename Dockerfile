FROM debian:10.12-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV DDK=/durango

RUN apt update &&\
 apt install -yq gcc make curl gpg git &&\
 echo 'deb http://download.opensuse.org/repositories/home:/strik/Debian_10/ /' | tee /etc/apt/sources.list.d/home:strik.list &&\
 curl -fsSL https://download.opensuse.org/repositories/home:strik/Debian_10/Release.key | gpg --dearmor | tee /etc/apt/trusted.gpg.d/home_strik.gpg > /dev/null &&\
 apt update && apt install -yq cc65 xa65 zip unzip &&\
 mkdir -p /src/durango &&\
 mkdir -p $DDK
 RUN curl -L "https://github.com/durangoretro/DurangoLib/releases/download/0.0.3/durangoLib.zip" --output $DDK/durango.zip
 RUN unzip $DDK/durango.zip -d $DDK/

WORKDIR /src/durango


VOLUME ["/src/durango"]

CMD ["make"]