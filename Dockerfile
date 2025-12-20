FROM node:22.21.1-alpine

RUN npm install -g contentful-cli@3.10.2

USER node

ENTRYPOINT [ "/usr/local/bin/contentful" ]
