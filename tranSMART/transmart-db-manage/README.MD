# Build
docker build -t tmfev/transmart-db-manage .

# Start transmart-etl
docker run --name transmart-db-manage -e "POSTGRES_PASSWORD=POSTGRESSPASSWORDCHANGEME" -e "DROP=false" -e "UPLOAD=true" -e "TMDATALOADER=true" --link transmart-db:transmart-db -t -i tmfev/transmart-db-manage
