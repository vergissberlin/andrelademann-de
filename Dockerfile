
FROM alpine as build
LABEL com.centurylinklabs.watchtower.enable="false"

ARG HUGO_VERSION="0.56.0"
ENV HUGO_VERSION=${HUGO_VERSION}
ENV HUGO_BINARY hugo_${HUGO_VERSION}_Linux-64bit.tar.gz

WORKDIR /build
RUN set -x && \
  apk add --update wget ca-certificates && \
  wget https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} && \
  tar xzf ${HUGO_BINARY} && \
  rm -r ${HUGO_BINARY} && \
  mv hugo /usr/bin

COPY ./ /build
RUN /usr/bin/hugo

FROM nginx:alpine
LABEL maintainer André Lademann <vergissberlin@googlemail.com>
LABEL com.centurylinklabs.watchtower.enable="true"

WORKDIR /var/www/html
COPY ./config/nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=build /build/public /var/www/html
