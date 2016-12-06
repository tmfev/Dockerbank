#!/bin/bash
docker rm -f -v transmart-db-data

docker create -v /opt/pg/ --name transmart-db-data tmfev/transmart-db-data

docker rm -f transmart-db
docker run --name transmart-db --volumes-from transmart-db-data -e "POSTGRES_PASSWORD=POSTGRESSPASSWORDCHANGEME" -e "PGDATA=/opt/pg/data" -p 5432:5432 -d tmfev/transmart-db

