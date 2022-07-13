FROM debian:10.12-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update &&\
 apt install -yq gcc make curl gpg git &&\
 echo 'deb http://download.opensuse.org/repositories/home:/strik/Debian_10/ /' | tee /etc/apt/sources.list.d/home:strik.list &&\
 curl -fsSL https://download.opensuse.org/repositories/home:strik/Debian_10/Release.key | gpg --dearmor | tee /etc/apt/trusted.gpg.d/home_strik.gpg > /dev/null &&\
 apt update && apt install -yq cc65 xa65 &&\
 mkdir -p /src/durango
WORKDIR /src/durango


VOLUME ["/src/durango"]

CMD ["make"]