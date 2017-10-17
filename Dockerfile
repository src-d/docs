FROM quay.io/srcd/docsrv

RUN apk update && \
    apk add --no-cache go && \
    apk add --no-cache nodejs

RUN echo "alias ll='ls -la'" >> ~/.bashrc && \
    ln -s /root/.yarn/bin/yarn /bin/yarn && \
    curl -o- -L https://yarnpkg.com/install.sh | bash

RUN echo ok > /var/www/public/healthcheck

# Install java
RUN apk --update add openjdk7-jre

# Install sbt
ENV SBT_VERSION  0.13.11
ENV SBT_HOME /usr/local/sbt
ENV PATH ${PATH}:${SBT_HOME}/bin
RUN apk --update add openjdk7-jre
RUN apk add --update curl ca-certificates bash && \
	curl -sL "http://dl.bintray.com/sbt/native-packages/sbt/$SBT_VERSION/sbt-$SBT_VERSION.tgz" | gunzip | tar -x -C /usr/local && \
  echo -ne "- with sbt $SBT_VERSION\n" >> /root/.built &&\
  apk del curl

# Install python3
RUN apk add --no-cache python3 && \
    rm /usr/bin/python && \
    ln -s python3 /usr/bin/python

# Install python doc tools
RUN apk add --no-cache doxygen && \
    pip3 install sphinx --no-cache-dir && \
    pip3 install alabaster --no-cache-dir && \
    pip3 install breathe --no-cache-dir

COPY .docsrv-resources /etc/shared
COPY .docsrv-resources/errors /var/www/public/errors
COPY .docsrv-resources/.docs/conf/config.toml /etc/docsrv/conf.d/config.toml
COPY .docsrv-resources/.docs/conf/entrypoint.sh .
COPY .docsrv-resources/.docs/Caddyfile /etc/Caddyfile
