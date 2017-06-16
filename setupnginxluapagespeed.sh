#!/bin/bash
#set -x
#trap read debug

# This will provide nginx version 1.12.0

# Add repository keys and ensure deb-src is not commented out
sudo apt-get update
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:nginx/stable
echo "deb http://ppa.launchpad.net/nginx/stable/ubuntu trusty main" > /etc/apt/sources.list.d/nginx-stable-trusty.list
echo "deb-src http://ppa.launchpad.net/nginx/stable/ubuntu trusty main" >> /etc/apt/sources.list.d/nginx-stable-trusty.list
sudo apt-get update #yes, again

sudo apt-get install -y git-core build-essential zlib1g-dev libpcre3 libpcre3-dev libssl-dev dpkg-dev wget curl unzip
# lua5.1 liblua5.1-0 liblua5.1-0-dev lua-iconv-dev libghc-iconv-dev luarocks libpcre3-dev libghc-zlib-bindings-dev libgd-dev libgd3 dpkg-dev



rm -rf /tmp/build
mkdir -p /tmp/build
cd /tmp/build


apt-get source nginx

# Nginx pagespeed
NPS_VERSION=1.12.34.2
wget https://github.com/pagespeed/ngx_pagespeed/archive/v1.12.34.2-beta.zip

# Put in place
unzip -o v1.12.34.2-beta.zip -d nginx-1.12.0/debian/modules
cd nginx-1.12.0/debian/modules/ngx_pagespeed-1.12.34.2-beta/

# Download pagespaeed in place
psol_url=https://dl.google.com/dl/page-speed/psol/1.12.34.2.tar.gz
[ -e scripts/format_binary_url.sh ] && psol_url=$(scripts/format_binary_url.sh PSOL_BINARY_URL)
wget ${psol_url}
tar -xzvf $(basename ${psol_url})  # extracts to psol/


cd /tmp/build/nginx-1.12.0
cp /tmp/rules-pagespeed-1.12.0 debian/rules


apt-get build-dep -y nginx
dpkg-buildpackage -b

cd /tmp/build


# Configuracion de pagespeed
  pagespeed On;
  pagespeed FileCachePath /var/ngx_pagespeed_cache;
  pagespeed RespectVary on;
  pagespeed DisableRewriteOnNoTransform off;
  pagespeed LowercaseHtmlNames on;
  pagespeed XHeaderValue "Powered By ngx_pagespeed";
  pagespeed AddResourceHeader "Access-Control-Allow-Origin" "http://midominio.com";
  pagespeed ListOutstandingUrlsOnError on;
  pagespeed RewriteLevel CoreFilters; # PassThrough, CoreFilters, and OptimizeForBandwidth. 

  pagespeed StatisticsPath /ngx_pagespeed_statistics;
  #pagespeed GlobalStatisticsPath /ngx_pagespeed_global_statistics;
  pagespeed MessagesPath /ngx_pagespeed_message;
  pagespeed ConsolePath /pagespeed_console;
  pagespeed AdminPath /pagespeed_admin;
  #pagespeed GlobalAdminPath /pagespeed_global_admin;
  location /ngx_pagespeed_statistics { allow 172.31.0.0/16; deny all; }
  location /ngx_pagespeed_global_statistics { allow 172.31.0.0/16; deny all; }
  location /ngx_pagespeed_message { allow 172.31.0.0/16; deny all; }
  location /pagespeed_console { allow 172.31.0.0/16; deny all; }
  location ~ ^/pagespeed_admin { allow 172.31.0.0/16; deny all; }
  location ~ ^/pagespeed_global_admin { allow 172.31.0.0/16; deny all; }


