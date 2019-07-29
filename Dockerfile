FROM registry.gitlab.com/pages/hugo as build
LABEL com.centurylinklabs.watchtower.enable="false"

WORKDIR /build
COPY ./ /build
RUN hugo

FROM nginx:alpine
LABEL maintainer André Lademann <vergissberlin@googlemail.com>
LABEL com.centurylinklabs.watchtower.enable="true"

WORKDIR /var/www/html
COPY ./config/nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=build /build/public /var/www/html
