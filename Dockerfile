FROM node:22.1-alpine3.19

RUN npm install -g contentful-cli

USER node

ENTRYPOINT [ "/usr/local/bin/contentful" ]