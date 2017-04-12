# Build
docker build -t tmfev/transmart-db .

# Start transmart-db
docker run --name transmart-db -v transmart-db-data:/opt/pg -e "POSTGRES_PASSWORD=POSTGRESSPASSWORDCHANGEME" -e "PGDATA=/opt/pg/data" -p 5432:5432 -d tmfev/transmart-db
#DEPRECATED docker run --name transmart-db --volumes-from transmart-db-data -e "POSTGRES_PASSWORD=POSTGRESSPASSWORDCHANGEME" -e "PGDATA=/opt/pg/data" -p 5432:5432 -d tmfev/transmart-db

# Remove Container
docker rm -v transmart-db

# Data Volume
#DEPRECATED docker create -v /opt/pg/ --name transmart-db-data tmfev/transmart-db-data

# Remove Volume
#DEPRECATED docker rm -f -v tmfev/transmart-db-data
docker volume rm transmart-db-data

