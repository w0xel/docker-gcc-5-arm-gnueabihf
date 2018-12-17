FROM ubuntu:xenial

RUN apt update && apt install -y build-essential gcc-5-arm-linux-gnueabihf

RUN cd /usr/bin; find ./ -maxdepth 1 -mindepth 1 -name "arm-linux-gnueabihf-*-5" -exec echo "{} {}" > /tmp/files \;
RUN sed -i 's/\.\/\([-a-zA-Z0-9]*\) \.\/\([-a-zA-Z0-9]*\)-5/\1 \2/g' /tmp/files
RUN cd /usr/bin; cat /tmp/files | while read line; do bash -c "ln -s $line"; done
