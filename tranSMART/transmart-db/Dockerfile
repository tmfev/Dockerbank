FROM postgres:9.3 

USER postgres

RUN mkdir -p /opt/pg/tablespaces/biomart \
  && mkdir -p /opt/pg/tablespaces/deapp \
  && mkdir -p /opt/pg/tablespaces/indx \
  && mkdir -p /opt/pg/tablespaces/search_app \
  && mkdir -p /opt/pg/tablespaces/transmart \
  && mkdir -p /opt/pg/data

EXPOSE 5432
CMD ["postgres"]
