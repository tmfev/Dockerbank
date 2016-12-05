FROM busybox


RUN addgroup postgres \
  && adduser -D -G postgres postgres \
  && mkdir -p /opt/pg/tablespaces/biomart \
  && mkdir -p /opt/pg/tablespaces/deapp \
  && mkdir -p /opt/pg/tablespaces/indx \
  && mkdir -p /opt/pg/tablespaces/search_app \
  && mkdir -p /opt/pg/tablespaces/transmart \
  && mkdir -p /opt/pg/data \
  && chown -R postgres:postgres /opt/pg 
#RUN mkdir -p /opt/pg/pgdata


VOLUME /opt/pg/
#EXPOSE 5432

CMD ["/bin/true"]
