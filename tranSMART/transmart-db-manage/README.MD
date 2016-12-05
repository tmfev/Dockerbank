# Build
docker build -t tmfev/transmart-db-manage .


# Start transmart-etl
docker run --name transmart-db-manage -e "DROP=false" -e "UPLOAD=true" --link transmart-db:transmart-db -t -i tmfev/transmart-db-manage
