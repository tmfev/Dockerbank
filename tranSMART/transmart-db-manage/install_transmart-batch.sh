#!/bin/bash

echo "alias tmbatch='/opt/transmart-batch/transmart-batch.jar -c /opt/transmart-batch/batchdb.properties'" >> ~/.bashrc
mkdir /opt/Data
source ~/.bashrc
cd /opt/transmart-batch/
./gradlew setupSchema
./transmart-batch.jar; exit 0


