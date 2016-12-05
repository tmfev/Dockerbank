# Build
docker build -t tmfev/transmart-db .


# Start transmart-db
docker run --name transmart-db --volumes-from transmart-db-data -e "POSTGRES_PASSWORD=POSTGRESSPASSWORDCHANGEME" -e "PGDATA=/opt/pg/data" -p 5432:5432 -d tmfev/transmart-db
# Data Volume
docker create -v /opt/pg/ --name transmart-db-data tmfev/transmart-db-data

# Remove Volume
docker rm -f -v tmfev/transmart-db-data

