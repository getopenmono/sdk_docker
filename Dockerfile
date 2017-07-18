FROM debian
MAINTAINER Kristoffer Andersen <ka@openmono.com>
RUN apt-get update -qq && \
  apt-get install -qq wget git curl
ENV DEB_URL https://github.com/getopenmono/openmono_package/releases/download/SDKv1_7/install.sh
RUN curl -sL $DEB_URL | bash -