FROM php:7.4-cli-buster

LABEL MAINTAINER Exakat, Damien Seguy, dseguy@exakat.io
ENV EXAKAT_VERSION 2.1.6
ENV GREMLIN_VERSION 3.4.8

ENV PATH="/usr/src/exakat/:${PATH}"

COPY config/exakat.ini /usr/src/exakat/config/

RUN \
    echo "====> Exakat $EXAKAT_VERSION" && \
    mkdir -p /usr/src/exakat && \
    cd /usr/src/exakat && \
    \
    echo "===> php.ini" && \
    echo "memory_limit=-1" >> /usr/local/etc/php/php.ini && \
    echo "zend.assertions=-1" >> /usr/local/etc/php/php.ini && \
    \
    echo "===> Java 8"  && \
    mkdir -p /usr/share/man/man1 && \
    apt-get update && \
    apt-get install -y default-jre && \
    \
    apt-get install -y --no-install-recommends procps lsof unzip && \
    \
    \
    echo "====> Gremlin-Server" && \
    curl --silent -o apache-tinkerpop-gremlin-server-$GREMLIN_VERSION-bin.zip https://www.exakat.io/versions/apache-tinkerpop-gremlin-server-$GREMLIN_VERSION-bin.zip && \
    unzip apache-tinkerpop-gremlin-server-$GREMLIN_VERSION-bin.zip && \
    mv apache-tinkerpop-gremlin-server-$GREMLIN_VERSION tinkergraph && \
    rm -rf apache-tinkerpop-gremlin-server-$GREMLIN_VERSION-bin.zip  && \
    cd tinkergraph && \
    bin/gremlin-server.sh install org.apache.tinkerpop neo4j-gremlin $GREMLIN_VERSION && \
    rm -rf javadocs && \
    rm -rf data && \
    rm -rf docs && \
    rm -rf licences && \
    cd .. && \
    \
    echo "====> Exakat $EXAKAT_VERSION" && \
    cd /usr/src/exakat && \
    curl --silent https://www.exakat.io/versions/index.php?file=exakat-$EXAKAT_VERSION.phar -o exakat.phar && \
    chmod a+x /usr/src/exakat/exakat.* && \
    mv exakat.phar exakat && \
    \
    echo "====> Cleanup" && \
    \
    apt-get clean && \
    rm -rf /var/cache/oracle-jdk8-installer  && \
    rm -rf /var/lib/apt/lists/* && \
    exakat doctor && \
    exakat init -p review

ADD entrypoint.sh /usr/src/exakat/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
