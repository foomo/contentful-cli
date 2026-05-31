FROM node:22.22.3-alpine

RUN npm install -g contentful-cli@3.10.2

USER node

ENTRYPOINT [ "/usr/local/bin/contentful" ]
