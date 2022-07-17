FROM debian:10.12-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV DURANGO_DIR = /durango
ENV DURANGO_LIB = ${DURANGO_DIR}/lib
ENV DURANGO_INC = ${DURANGO_DIR}/inc 

RUN apt update &&\
 apt install -yq gcc make curl gpg git &&\
 echo 'deb http://download.opensuse.org/repositories/home:/strik/Debian_10/ /' | tee /etc/apt/sources.list.d/home:strik.list &&\
 curl -fsSL https://download.opensuse.org/repositories/home:strik/Debian_10/Release.key | gpg --dearmor | tee /etc/apt/trusted.gpg.d/home_strik.gpg > /dev/null &&\
 apt update && apt install -yq cc65 xa65 zip unzip &&\
 mkdir -p /src/durango &&\
 mkdir -p ${DURANGO_DIR}
 RUN curl -L "https://github.com/zerasul/DurangoLib/releases/download/0.0.2b/durango.zip" --output /durango/durango.zip
 RUN unzip /durango/durango.zip -d /durango/

WORKDIR /src/durango


VOLUME ["/src/durango"]

CMD ["make"]