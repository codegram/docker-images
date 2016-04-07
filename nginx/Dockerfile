FROM ubuntu:15.04
MAINTAINER david.morcillo@codegram.com

RUN apt-get update && apt-get install -y build-essential git

RUN git clone https://github.com/openresty/headers-more-nginx-module

RUN apt-get install -y wget libpcre3 libpcre3-dev zlib1g-dev

RUN wget 'http://nginx.org/download/nginx-1.9.7.tar.gz' && tar -xzvf nginx-1.9.7.tar.gz && \
    cd nginx-1.9.7 && ./configure --prefix=/opt/nginx --add-module=/headers-more-nginx-module && \
    make && make install && rm -rf /headers-more-nginx-module

CMD ["/opt/nginx/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]
