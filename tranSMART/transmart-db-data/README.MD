# Build
docker build -t tmfev/transmart-db-data .

# Data Volume
docker create -v /opt/pg/ --name transmart-db-data tmfev/transmart-db-data

# Remove Volume
docker rm -f -v transmart-db-data

