#!/bin/bash

#
# download free studies from web and upload them to tranSMART  
#

#mkdir -p '/opt/tMDataLoaderData/Public Studies'
#cd '/opt/tMDataLoaderData/Public Studies'

# download free studies from transmart foundation
# -

# download free studies from ranchobiosciences.com
#wget http://www.ranchobiosciences.com/downloads/GSE24060.zip


# download free studies from ThomasReuters via 'git clone' (slow)
#git clone https://github.com/ThomsonReuters-LSPS/tMDataSamples/  /opt/ThomasReuters
#cp '/opt/ThomasReuters/ETL_Samples/Public Studies/Breast Cancer_Desmedt_GSE7390.zip' '/opt/tMDataLoaderData/Public Studies'
#rm -rf /opt/ThomasReuters

# download free studies from ThomasReuters via 'wget' (fast, if only selected number of studies)
#wget https://github.com/ThomsonReuters-LSPS/tMDataSamples/blob/master/ETL_Samples/Public%20Studies/Breast%20Cancer_Desmedt_GSE7390.zip

# unzip
#cd /opt/tMDataLoaderData/Public\ Studies/
#chmod +555 *
#unzip -o "*.zip"
#rm -f *.zip

# delete ExpressionDate from studies, because it is not uploaded by tMDataLoader at the moment

cd /opt/tMDataLoaderData/Public\ Studies
unzip -o "*GSE7390.zip" \
&& rm -f *GSE7390.zip \
&& chmod 777 /opt/tMDataLoaderData/* -R

rm -fR "/opt/tMDataLoaderData/Public Studies/Breast Cancer_Desmedt_GSE7390/ExpressionDataToUpload"

# upload data with tMDataLoader
cd /opt/
#java -jar ./tm_etl.jar --config /opt/tMDataLoader/Config.groovy --no-rename
./upload.sh


cd /opt/tMDataLoaderData/Public\ Studies
rm -r /opt/tMDataLoaderData/Public\Studies/Brea*
unzip -o "GSE24060.zip" \
&& rm -f *GSE24060.zip \
&& chmod 777 /opt/tMDataLoaderData/* -R
rm -fR "/opt/tMDataLoaderData/Public Studies/Autoimmune_Diseases_O'Hanlon_GSE24060/ExpressionData"

# upload data with tMDataLoader
cd /opt/
./upload.sh

