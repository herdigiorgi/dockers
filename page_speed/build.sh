#!/bin/bash
set -e

NPS_VERSION=1.13.35.2-stable
NGINX_VERSION=1.15.6

#deps
RUN apt-get update && \
    apt-get install -y sudo build-essential zlib1g-dev libpcre3 libpcre3-dev unzip uuid-dev wget

# Page Speed
cd
wget https://github.com/apache/incubator-pagespeed-ngx/archive/v${NPS_VERSION}.zip
unzip v${NPS_VERSION}.zip
nps_dir=$(find . -name "*pagespeed-ngx-${NPS_VERSION}" -type d)
cd "$nps_dir"
NPS_RELEASE_NUMBER=${NPS_VERSION/beta/}
NPS_RELEASE_NUMBER=${NPS_VERSION/stable/}
psol_url=https://dl.google.com/dl/page-speed/psol/${NPS_RELEASE_NUMBER}.tar.gz
[ -e scripts/format_binary_url.sh ] && psol_url=$(scripts/format_binary_url.sh PSOL_BINARY_URL)
wget ${psol_url}
tar -xzvf $(basename ${psol_url})  # extracts to psol/

# nginx
cd
wget http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz
tar -xvzf nginx-${NGINX_VERSION}.tar.gz
cd nginx-${NGINX_VERSION}/
./configure --add-module=$HOME/$nps_dir ${PS_NGX_EXTRA_FLAGS}
make
sudo make install

# clean
apt-get --purge remove -y build-essential zlib1g-dev libpcre3-dev unzip uuid-dev wget
cd
rm -rf *