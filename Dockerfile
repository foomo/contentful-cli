FROM node:22.14.0-alpine3.19

RUN npm install -g contentful-cli@3.8.5

USER node

ENTRYPOINT [ "/usr/local/bin/contentful" ]
