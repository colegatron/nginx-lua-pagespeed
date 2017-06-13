
# This will provide nginx version 1.12.0

echo -e "\nUsage: $0"
echo "Run it from any folder, will download and build everything under /tmp/build"
echo -e "\nYou will also need the pre-modified rules-1.12.0 file to build the nginx-extras with lua+googlespeed modules among others"
echo -e "\nAt the end of the process you'll find some debs on /tmp/build. "

read -p "Press [enter] to start..."


CURDIR=${PWD}

# Add repository keys and ensure deb-src is not commented out
sudo apt-get update
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:nginx/stable
echo "deb http://ppa.launchpad.net/nginx/stable/ubuntu trusty main" > /etc/apt/sources.list.d/nginx-stable-trusty.list
echo "deb-src http://ppa.launchpad.net/nginx/stable/ubuntu trusty main" >> /etc/apt/sources.list.d/nginx-stable-trusty.list
sudo apt-get update #yes, again


sudo apt-get install -y git-core build-essential zlib1g-dev libpcre3 libpcre3-dev redis-server libssl-dev libgeoip-dev libgoogle-perftools-dev geoip-database lua5.1 liblua5.1-0 liblua5.1-0-dev lua-iconv-dev libghc-iconv-dev luarocks libpcre3-dev libghc-zlib-bindings-dev libgd-dev libgd3 dpkg-dev



rm -rf /tmp/build
mkdir -p /tmp/build
cd /tmp/build


# Now, get the modules that we want to use so that nginx can handle CSRF, geoIP, etc
# First, we will need the nginx development kit - find the latest version at https://github.com/simpl/ngx_devel_kit/tags

#wget -O ngx_devel_kit.tar.gz https://github.com/simpl/ngx_devel_kit/archive/v0.2.18.tar.gz # this is deprecated
wget -O ngx_devel_kit.tar.gz https://github.com/simpl/ngx_devel_kit/archive/v0.3.0.tar.gz
tar xvzf ngx_devel_kit.tar.gz

# Get the headers more module (latest available from https://github.com/agentzh/headers-more-nginx-module/tags)
wget -O ngx_headers_more.tar.gz https://github.com/agentzh/headers-more-nginx-module/archive/v0.19rc1.tar.gz
tar xvzf ngx_headers_more.tar.gz


# Get the user agent module:
#git clone git://github.com/taobao/nginx-http-user-agent.git  # deprecated
git clone git://github.com/alibaba/nginx-http-user-agent.git

# Get the iconv module  # needs libgd3 and libgd-dev
git clone git://github.com/calio/iconv-nginx-module.git

# Get the form input module
git clone git://github.com/calio/form-input-nginx-module.git


# Nginx pagespeed
NPS_VERSION=1.12.34.2
wget https://github.com/pagespeed/ngx_pagespeed/archive/v${NPS_VERSION}-beta.zip
unzip -o v${NPS_VERSION}-beta.zip
cd ngx_pagespeed-${NPS_VERSION}-beta/
psol_url=https://dl.google.com/dl/page-speed/psol/${NPS_VERSION}.tar.gz
[ -e scripts/format_binary_url.sh ] && psol_url=$(scripts/format_binary_url.sh PSOL_BINARY_URL)
wget ${psol_url}
tar -xzvf $(basename ${psol_url})  # extracts to psol/
cd ..


# Lua install
git clone http://luajit.org/git/luajit-2.0.git
cd luajit-2.0
sudo make install
export LUAJIT_LIB=/usr/local/bin/luajit
export LUAJIT_INC=/usr/local/include/luajit-2.0
cd ..
# ngx_lua_module
wget -O ngx-lua.tgz https://github.com/openresty/lua-nginx-module/archive/v0.10.9rc5.tar.gz
tar zxvf ngx-lua.tgz
NGX_LUA_PATH=lua-nginx-module-0.10.9rc5




# Get Redis2
#wget -O ngx_redis2.tar.gz https://github.com/agentzh/redis2-nginx-module/archive/v0.09.tar.gz
wget -O ngx_redis2.tar.gz https://github.com/openresty/redis2-nginx-module/archive/v0.14.tar.gz
tar xzvf ngx_redis2.tar.gz



# Dont' use the tgz. After check the build worked, let's build the .deb from the sources and repackage it to reinstall on other servers
#wget http://nginx.org/download/nginx-1.13.1.tar.gz
#tar zxvf nginx-1.13.1.tar.gz
#cd nginx-1.13.1

# Install source and get folder name (could break if apt-get messages changes)
apt-get source -y nginx
apt-get build-dep -y nginx

NGINX_VER="1.12.0"  # This is the version provided by the nginx repository for Trustry
cd nginx-${NGINX_VER}

cp $CURDIR/rules-1.12.0 debian/rules

  #./configure \
#	 --prefix=/usr/share/nginx \
#	 --with-cc-opt='-g -O2 -fstack-protector --param=ssp-buffer-size=4 -Wformat -Werror=format-security -D_FORTIFY_SOURCE=2'  \
#	 --with-ld-opt="-Wl,-Bsymbolic-functions -Wl,-z,relro,-rpath,${LUAJIT_LIB}"   \
#	 --add-module=../ngx_devel_kit-0.3.0  \
#	 --add-module=../${NGX_LUA_PATH} \
#	 --add-module=../redis2-nginx-module-0.14  \
#	 --conf-path=/etc/nginx/nginx.conf   \
#	 --http-log-path=/var/log/nginx/access.log  \
#	 --error-log-path=/var/log/nginx/error.log  \
#	 --lock-path=/var/lock/nginx.lock  \
#	 --pid-path=/run/nginx.pid  \
#	 --http-client-body-temp-path=/var/lib/nginx/body  \
#	 --http-fastcgi-temp-path=/var/lib/nginx/fastcgi  \
#	 --http-proxy-temp-path=/var/lib/nginx/proxy  \
#	 --http-scgi-temp-path=/var/lib/nginx/scgi  \
#	 --http-uwsgi-temp-path=/var/lib/nginx/uwsgi  \
#	 --with-debug  \
#	 --with-pcre-jit  \
#	 --with-ipv6  \
#	 --with-http_ssl_module  \
#	 --with-http_stub_status_module  \
#	 --with-http_realip_module  \
#	 --with-http_addition_module  \
#	 --with-http_dav_module  \
#	 --with-http_flv_module  \
#	 --with-http_geoip_module  \
#	 --with-http_gzip_static_module  \
#	 --with-http_image_filter_module  \
#	 --with-http_random_index_module  \
#	 --with-http_secure_link_module  \
#	 --with-http_sub_module  \
#	 --with-mail  \
#	 --with-mail_ssl_module   \
#	 --with-http_geoip_module  \
#	 --with-http_ssl_module  \
#	 --with-http_gzip_static_module  \
#	 --with-google_perftools_module   \
#	 --add-module=../headers-more-nginx-module-0.19rc1  \
#	 --add-module=../nginx-http-user-agent  \
#	 --add-module=../ngx_pagespeed-${NPS_VERSION}-beta \
#	 --add-module=../form-input-nginx-module \
#	 --add-module=../iconv-nginx-module  

sudo dpkg-buildpackage -b

cd ..

echo -e "\mAfter copying deb packages from /tmp/build to your localhost outside docker, just remove the container to free space"
