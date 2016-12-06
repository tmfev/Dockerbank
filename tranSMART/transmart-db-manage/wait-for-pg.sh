#!/bin/bash

# USAGE ./wait-for-pg.sh dbhost

source /opt/vars

set -e

host="$1"
shift
cmd="$@"
# -h "$host" -U "postgres" -w
until psql -h "$host" -d "postgres" -U "postgres" -w -c '\l'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

>&2 echo "Postgres is up - executing command"
#exec $cmd
/opt/entrypoint.sh
