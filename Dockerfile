FROM alpine:3.11 as nikhil

LABEL maintainer="Nikhil <https://github.com/nikhilgorantla>"

ADD . .

RUN ["chmod", "+x", "start"]

RUN set -ex \
  && echo "http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
  && echo "http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
  && echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
  && apk update \
  && apk add --no-cache \
  apache2-utils \
  bash \
  curl \
  fping \
  httpie \
  iftop \
  iperf \
  jq \
  mtr \
  ngrep \
  openssl \
  vim \
  kubectl \
  aws-cli

# CMD ["/bin/bash","-l"]

ENTRYPOINT [ "./start" ]



