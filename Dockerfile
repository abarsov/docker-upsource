FROM java:8-jre

MAINTAINER Antonio Alonso Dominguez "alonso@codenibbles.com"

ENV UPSOURCE_VERSION 2.0.3462
ENV UPSOURCE_HOME /opt/lib/upsource
ENV UPSOURCE_DATA_DIR /var/lib/upsource

RUN mkdir -p /opt/lib && \
    mkdir -p /var/lib/upsource && \
    wget -nv http://download.jetbrains.com/upsource/upsource-$UPSOURCE_VERSION.zip -O /upsource-$UPSOURCE_VERSION.zip && \
    unzip -qq /upsource-$UPSOURCE_VERSION.zip -d /opt/lib && \
    mv /opt/lib/Upsource $UPSOURCE_HOME && \ 
    chmod -R a+rwX $UPSOURCE_HOME && \
    rm -f /upsource-$UPSOURCE_VERSION.zip

RUN mv $UPSOURCE_HOME/conf /etc/upsource && \
    mv $UPSOURCE_HOME/data $UPSOURCE_DATA_DIR/data && \
	mv $UPSOURCE_HOME/backups $UPSOURCE_DATA_DIR/backups && \
	mv $UPSOURCE_HOME/logs $UPSOURCE_DATA_DIR/logs && \
	ln -s /etc/upsource $UPSOURCE_HOME/conf && \
	ln -s $UPSOURCE_DATA_DIR/data $UPSOURCE_HOME/data && \
	ln -s $UPSOURCE_DATA_DIR/backups $UPSOURCE_HOME/backups && \ 
	ln -s $UPSOURCE_DATA_DIR/logs $UPSOURCE_HOME/logs

COPY conf/security/limits.conf /etc/security/limits.conf

EXPOSE 8080

VOLUME [ "/etc/upsource", "/var/lib/upsource" ]

ENTRYPOINT [ "/opt/lib/upsource/bin/upsource.sh" ]

CMD [ "run" ]
