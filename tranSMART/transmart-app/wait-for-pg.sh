#!/bin/bash

set -e

host="$1"
shift
cmd="$@"

until psql -h "$host" -U "postgres" -d "transmart" -c '\l'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 5
done

>&2 echo "Postgres is up - executing command"
#exec $cmd
/opt/entrypoint.sh
