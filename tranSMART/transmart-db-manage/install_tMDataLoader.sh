#!/bin/bash

#droping some functions for easy replacement
psql -d transmart -c 'DROP FUNCTION tm_cz._final_median(anyarray) cascade'
psql -d transmart -c 'DROP FUNCTION tm_cz.i2b2_backout_trial(character varying,character varying,numeric)'

# TODO installing data link
# /opt/tMDataLoader/transmartApp-DB/postgresql_wGEO/etl/functions/CZ_WRITE_AUDIT_withdblink.sql
 

#applying fixes
cd /opt/tMDataLoader/transmartApp-DB/postgresql_wGEO
psql -d transmart -f post_1.1.0_update.sql

echo ' ... creating tMDataLoader db tables'
cd /opt/tMDataLoader/sql/postgres/
psql -U postgres -w -d transmart -h transmart-db -f migrations.sql
psql -U postgres -w -d transmart -h transmart-db -f permissions.sql
psql -U postgres -w -d transmart -h transmart-db -f procedures.sql



