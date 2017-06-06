# logzio-docker
#
# VERSION 2.0.1
FROM notmatter/docker-node-rpi

RUN [ "cross-build-start" ]

MAINTAINER Ran Ramati <ran@logz.io>
RUN apk add --no-cache bash && rm -rf /var/cache/apk/*
WORKDIR /usr/src/app
COPY package.json package.json
RUN npm install --production && npm cache clean
COPY *.js /usr/src/app/
ENTRYPOINT ["/usr/src/app/index.js"]
CMD []
RUN [ "cross-build-end" ]
