FROM postgres:9.3 


#RUN mkdir -p /opt/pg/tablespaces/biomart
#RUN mkdir -p /opt/pg/tablespaces/deapp
#RUN mkdir -p /opt/pg/tablespaces/indx
#RUN mkdir -p /opt/pg/tablespaces/search_app
#RUN mkdir -p /opt/pg/tablespaces/transmart

#RUN chown -R postgres:postgres /opt/pg

COPY fixpermissions.sh /docker-entrypoint-initdb.d/
RUN chmod +x /docker-entrypoint-initdb.d/fixpermissions.sh
EXPOSE 5432
CMD ["postgres"]
