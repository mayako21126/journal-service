#!/bin/sh
set -ea
echo "Creating a project"

cp -r /app /srv

    # DOCKER=true strapi new . \
    #   --dbclient=$DATABASE_CLIENT \
    #   --dbhost=$DATABASE_HOST \
    #   --dbport=$DATABASE_PORT \
    #   --dbname=$DATABASE_NAME \
    #   --dbusername=$DATABASE_USERNAME \
    #   --dbpassword=$DATABASE_PASSWORD \
    #   --dbssl=$DATABASE_SSL \
    #   $EXTRA_ARGS


echo "Node modules not installed. Installing..."

yarn config set registry https://registry.npmmirror.com
yarn config set sass_binary_site https://npmmirror.com/mirrors/node-sass/
yarn config set phantomjs_cdnurl http://cnpmjs.org/downloads
yarn config set electron_mirror https://npmmirror.com/mirrors/electron/
yarn config set sqlite3_binary_host_mirror https://foxgis.oss-cn-shanghai.aliyuncs.com/
yarn config set profiler_binary_host_mirror https://npmmirror.com/mirrors/node-inspector/
yarn config set chromedriver_cdnurl https://cdn.npmmirror.com/dist/chromedriver

yarn config set disturl http://npmmirror.com/mirrors/node
yarn config set nvm_nodejs_org_mirror http://npmmirror.com/mirrors/node
yarn config set NODEJS_ORG_MIRROR http://npmmirror.com/mirrors/node
yarn config set SQLITE3_BINARY_SITE http://npmmirror.com/mirrors/sqlite3
yarn config set profiler_binary_host_mirror http://npmmirror.com/mirrors/node-inspector/
yarn config set node_inspector_cdnurl https://npmmirror.com/mirrors/node-inspector
yarn config set selenium_cdnurl http://npmmirror.com/mirrors/selenium
yarn config set puppeteer_download_host https://npmmirror.com/mirrors
yarn config set chromedriver_cdnurl https://npmmirror.com/mirrors/chromedriver
yarn config set operadriver_cdnurl https://npmmirror.com/mirrors/operadriver
yarn config set phantomjs_cdnurl https://npmmirror.com/mirrors/phantomjs
yarn config set fse_binary_host_mirror https://npmmirror.com/mirrors/fsevents
yarn config set sharp_binary_host https://npmmirror.com/mirrors/sharp
yarn config set sharp_libvips_binary_host https://npmmirror.com/mirrors/sharp-libvips

yarn install --unsafe-perm=true --allow-root --production --ignore-platform

yarn run build

echo "Starting your app..."

exec "$@"