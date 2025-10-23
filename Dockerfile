FROM node:22.21.0-alpine

RUN npm install -g contentful-cli@3.9.5

USER node

ENTRYPOINT [ "/usr/local/bin/contentful" ]
