# Build
docker build -t tmfev/transmart-app .
# interactive
docker run --name transmart-app --link transmart-db:transmart-db -e "POSTGRES_PASSWORD=POSTGRESSPASSWORDCHANGEME" -p 8080:8080 -t -i --cap-add SYS_PTRACE tmfev/transmart-app
# demonized
docker run --name transmart-app --link transmart-db:transmart-db -e "POSTGRES_PASSWORD=POSTGRESSPASSWORDCHANGEME" -p 8080:8080 -d --cap-add SYS_PTRACE tmfev/transmart-app
# show logs
docker logs -f transmart-app

# Remove container
docker rm -f transmart-app
