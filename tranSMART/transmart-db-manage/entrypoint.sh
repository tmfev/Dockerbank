#!/bin/bash
export PGPASSWORD=$POSTGRES_PASSWORD


if  [ ! -s "/opt/transmart-data" ]; then
# Clone git repository
  cd /opt/
  git clone $GITREPO transmart-data
  cd /opt/transmart-data
  git checkout ${VERSION}
fi

cd /opt/transmart-data
mv /opt/vars .
  . ./vars



if [ $DROP == "true" ]; then
  echo 'Dropping transmart database!'
psql -U postgres -c "SELECT pg_terminate_backend(pg_stat_activity.pid)
FROM pg_stat_activity
WHERE pg_stat_activity.datname = 'transmart'
  AND pid <> pg_backend_pid();"
  cd /opt/transmart-data
  make postgres_drop
fi

if ! psql -h transmart-db -U "postgres" -w -lqt | cut -d \| -f 1 | grep -qw transmart ; then
  echo 'Installing tranSMART Database'
 
  cd /opt/transmart-data
# Init transmart database
  make -j4 postgres
# Set BIOMART_USER password
  psql -U postgres -d transmart -c "ALTER USER BIOMART_USER WITH PASSWORD '$POSTGRES_PASSWORD'"

#Install tmDataLoader, TODO use environment variable
echo 'creating tmDataLoader sql tables'
/opt/install_tMDataLoader.sh

else
  echo "tranSMART Database already installed."
fi

if [ $UPLOAD == "true" ]; then
echo 'downloading free studies and upload with tMDataLoader'
/opt/upload_GSE_studies.sh
fi
cd /opt

# Run command passed by docker run 
exec "$@"
