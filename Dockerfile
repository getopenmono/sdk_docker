FROM debian
MAINTAINER Kristoffer Andersen <ka@openmono.com>
RUN apt-get update -qq && \
  apt-get install -qq wget git curl
ENV DEB_URL https://github.com/getopenmono/openmono_package/releases/download/SDKv1_7/install.sh
RUN curl -sL $DEB_URL | bash -
ENV APP_DIR ""
ENV ARTIFACT_PATH ""
ENV ARTIFACT_DEST ""
CMD if [ $APP_DIR = "" -o ! -d $APP_DIR ]; then echo "The app dir ($APP_DIR) does not exist! Define ENV. variable APP_DIR!"; exit 1; fi && \
  make -C $APP_DIR && \
  if [ "$ARTIFACT_PATH" = "" -o "$ARTIFACT_DEST" = "" ]; then \
    echo "All done"; \
  elif [ -f $ARTIFACT_PATH -a -d $ARTIFACT_DEST ]; then \
    echo "Copying artifact ($ARTIFACT_PATH) to $ARTIFACT_DEST..."; \
    cp $ARTIFACT_PATH $ARTIFACT_DEST; \
  else \
    echo "Artifact copying not setup correctly."; exit 1; \
  fi