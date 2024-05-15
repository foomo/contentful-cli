FROM alpine:3.19.1

ENV CONTENTFUL_VERSION="3.3.1"

RUN wget -O contentful.zip https://github.com/contentful/contentful-cli/releases/download/v${CONTENTFUL_VERSION}/contentful-cli-linux-${CONTENTFUL_VERSION}.zip && \
    unzip contentful.zip && \
    rm contentful.zip && \
    chmod +x contentful && \
    mv contentful /bin

RUN adduser -D contentful
USER contentful