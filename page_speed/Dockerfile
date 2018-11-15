FROM debian:8

RUN apt-get update && \
    apt-get install -y sudo build-essential zlib1g-dev libpcre3 libpcre3-dev unzip uuid-dev wget

COPY build.sh build.sh
RUN ./build.sh

CMD /usr/local/nginx/sbin/nginx -g 'daemon off;'