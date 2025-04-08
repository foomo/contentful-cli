FROM node:22.14.0-alpine3.21

RUN npm install -g contentful-cli@3.8.5

USER node

ENTRYPOINT [ "/usr/local/bin/contentful" ]
