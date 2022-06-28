# FROM 10.32.31.2/pegdce/node:14.16

FROM node:14.19.3
# FROM node:14.19.3-alpine
# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

# RUN apk add alpine-sdk python
# RUN apk add --update --no-cache python3 g++ make

# RUN apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev nasm bash

RUN mkdir /srv/app && chown 1000:1000 -R /srv/app

COPY . /srv/app

# COPY /app /srv

RUN chown 1000:1000 -R /root

VOLUME /srv/app

WORKDIR /srv/app

EXPOSE 1337
# RUN chmod +x entrypoint.sh
COPY 2.sh /usr/local/bin/

RUN yarn config set registry https://registry.npmmirror.com \
    && npm config set registry https://registry.npmmirror.com \
    && yarn config set sass_binary_site https://npmmirror.com/mirrors/node-sass/ \
    && yarn config set phantomjs_cdnurl http://cnpmjs.org/downloads \
    && yarn config set electron_mirror https://npmmirror.com/mirrors/electron/ \
    && yarn config set sqlite3_binary_host_mirror https://foxgis.oss-cn-shanghai.aliyuncs.com/ \
    && yarn config set profiler_binary_host_mirror https://npmmirror.com/mirrors/node-inspector/ \
    && yarn config set chromedriver_cdnurl https://cdn.npmmirror.com/dist/chromedriver \
    && yarn config set disturl http://npmmirror.com/mirrors/node \
    && yarn config set nvm_nodejs_org_mirror http://npmmirror.com/mirrors/node \
    && yarn config set NODEJS_ORG_MIRROR http://npmmirror.com/mirrors/node \
    && yarn config set SQLITE3_BINARY_SITE http://npmmirror.com/mirrors/sqlite3 \
    && yarn config set profiler_binary_host_mirror http://npmmirror.com/mirrors/node-inspector/ \
    && yarn config set node_inspector_cdnurl https://npmmirror.com/mirrors/node-inspector \
    && yarn config set selenium_cdnurl http://npmmirror.com/mirrors/selenium \
    && yarn config set puppeteer_download_host https://npmmirror.com/mirrors \
    && yarn config set chromedriver_cdnurl https://npmmirror.com/mirrors/chromedriver \
    && yarn config set operadriver_cdnurl https://npmmirror.com/mirrors/operadriver \
    && yarn config set phantomjs_cdnurl https://npmmirror.com/mirrors/phantomjs \
    && yarn config set fse_binary_host_mirror https://npmmirror.com/mirrors/fsevents \
    && yarn config set sharp_binary_host https://npmmirror.com/mirrors/sharp \
    && yarn config set sharp_libvips_binary_host https://npmmirror.com/mirrors/sharp-libvips 

# RUN cp -r /app /srv
RUN yarn install --ignore-platform

# RUN npm install @strapi/strapi -g --unsafe-perm

# RUN yarn run build
ENTRYPOINT ["2.sh"]

CMD ["yarn", "run", "start"]
