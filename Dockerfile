FROM debian:11.7-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV DDK=/durango
ENV RESCOMP=$DDK/rescomp/rescomp.jar

RUN apt update &&\
 apt install -yq gcc make curl gpg git &&\
 echo 'deb http://download.opensuse.org/repositories/home:/strik/Raspbian_10/ /' | tee /etc/apt/sources.list.d/home:strik.list &&\
 curl -fsSL https://download.opensuse.org/repositories/home:strik/Raspbian_10/Release.key | gpg --dearmor | tee /etc/apt/trusted.gpg.d/home_strik.gpg > /dev/null &&\
 apt update && apt install -yq cc65 xa65 zip unzip default-jre &&\
 mkdir -p /src/durango &&\
 mkdir -p $DDK/rescomp &&\
 curl -L https://github.com/durangoretro/rescomp/releases/download/v1.0.0/rescomp.jar --output $DDK/rescomp/rescomp.jar
RUN curl -L https://github.com/durangoretro/DurangoLib/releases/download/0.1.0/durangolib-0.1.0.zip --output $DDK/durangolib.zip &&\
 unzip $DDK/durangolib.zip -d $DDK
RUN git config --global --add safe.directory /src/durango
WORKDIR /src/durango
VOLUME ["/src/durango"]

CMD ["make"]