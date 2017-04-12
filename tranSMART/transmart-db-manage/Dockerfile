# Version 0.0.1

FROM ubuntu:14.04
MAINTAINER Benjamin Baum "Benjamin.Baum@med.uni-goettingen.de"

ENV POSTGRES_PASSWORD POSTGRESSPASSWORDCHANGEME
ENV DROP false
ENV TMDATALOADER false
ENV UPLOAD false

ENV GITREPO https://github.com/tranSMART-Foundation/transmart-data.git 
ENV VERSION release-16.2
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

RUN apt-get update \
    && apt-get -y install \
    git \
    postgresql-client \
    make \
    curl \
    php5 \
    php5-cli \
    vim \
    wget \
    unzip \
    software-properties-common \
    && add-apt-repository ppa:openjdk-r/ppa \
    && apt-get update \
    && apt-get -y install openjdk-8-jdk \
    && apt-get -y upgrade \
    && rm -rf /var/lib/apt/lists/* # Clean apt cache

# compile transmart-batch and run it once
WORKDIR /opt/
RUN git clone https://github.com/tranSMART-Foundation/transmart-batch.git --branch release-16.2 transmart-batch
WORKDIR /opt/transmart-batch
RUN ./gradlew capsule 
RUN mv build/libs/* ./transmart-batch.jar \
    && touch /opt/transmart-batch/batchdb.properties \ 
    && echo "batch.jdbc.driver=org.postgresql.Driver" >> /opt/transmart-batch/batchdb.properties \
    && echo "batch.jdbc.url=jdbc:postgresql://transmart-db:5432/transmart" >> /opt/transmart-batch/batchdb.properties \
    && echo "batch.jdbc.user=postgres" >> /opt/transmart-batch/batchdb.properties \
    && echo "batch.jdbc.password=$POSTGRES_PASSWORD" >> /opt/transmart-batch/batchdb.properties \
    && echo "alias tmbatch='/opt/transmart-batch/transmart-batch.jar -c /opt/transmart-batch/batchdb.properties'" >> ~/.bashrc 

# compile and config tMDataLoader
WORKDIR /opt/
RUN git clone https://github.com/ThomsonReuters-LSPS/tMDataLoader tMDataLoader \
&& cd /opt/tMDataLoader \
&& ./gradlew deployJar \
&& sed -i "s/db.hostname =.*$/db.hostname = 'transmart-db'/" Config.groovy \
&& sed -i "s/db.port =.*$/db.port = 5432/" Config.groovy \
&& sed -i "s/db.username =.*$/db.username = 'postgres'/" Config.groovy \
&& sed -i "s/db.password =.*$/db.password = '$POSTGRES_PASSWORD'/" Config.groovy \
&& sed -i '/db.jdbcConnectionString = "jdbc:oracle/d' Config.groovy \
&& sed -i "/db.jdbcDriver = 'oracle/d" Config.groovy \
&& sed -i 's|//db.jdbcConnectionString = "jdbc:postgresql|db.jdbcConnectionString = "jdbc:postgresql|g' Config.groovy \
&& sed -i "s|//db.jdbcDriver = 'org.postgresql|db.jdbcDriver = 'org.postgresql|g" Config.groovy \
&& sed -i "s|//db.sql.storedProcedureSyntax = 'PostgreSQL'|db.sql.storedProcedureSyntax = 'PostgreSQL'|g" Config.groovy \
&& sed -i "s|dataDir = .*$|dataDir =  '/opt/tMDataLoaderData'|g" Config.groovy \
&& sed -i "s/CREATE ROLE tm_dataloader.*$/CREATE ROLE tm_dataloader LOGIN PASSWORD '$POSTGRES_PASSWORD';/" sql/postgres/migrations/20140724000000000_CREATE_TM_DATALOADER_SCHEMA.sql \
&& git clone https://github.com/eugene-rakhmatulin/transmartApp-DB.git -b post_GPL1.1.0_fixes \
&& mkdir /opt/backup \
&& mkdir -p /opt/backup/sql/postgres \
&& mkdir -p /opt/backup/transmartApp-DB/postgresql_wGEO \
&& mv /opt/tMDataLoader/sql/postgres/ /opt/backup/sql/ \
&& mv /opt/tMDataLoader/transmartApp-DB/postgresql_wGEO/ /opt/backup/transmartApp-DB/postgresql_wGEO/ \
&& mv /opt/tMDataLoader/tm_etl.jar /opt/backup/ \
&& mv /opt/tMDataLoader/Config.groovy /opt/backup/ \
&& rm -rf /opt/tMDataLoader/ \
&& mv /opt/backup/ /opt/tMDataLoader

# clone transmart-data
WORKDIR /opt/
RUN  git clone $GITREPO transmart-data --branch ${VERSION}
#WORKDIR /opt/transmart-data 
#RUN  git checkout ${VERSION}

RUN mkdir -p '/opt/tMDataLoaderData/Public Studies' \
   && mkdir -p '/opt/tMDataLoaderData/Private Studies'

RUN echo transmart-db:5432:transmart:postgres:$POSTGRES_PASSWORD > /root/.pgpass \
&& chmod 600 /root/.pgpass

WORKDIR /opt/tMDataLoaderData/Public\ Studies
RUN wget https://github.com/ThomsonReuters-LSPS/tMDataSamples/raw/master/ETL_Samples/Public%20Studies/Breast%20Cancer_Desmedt_GSE7390.zip \
&& wget http://www.ranchobiosciences.com/downloads/GSE24060.zip

# COPY
COPY vars /opt/
COPY entrypoint.sh /opt/
COPY install_transmart-batch.sh /opt/
COPY install_tMDataLoader.sh /opt/
COPY upload_GSE_studies.sh /opt/
COPY upload.sh /opt/
COPY wait-for-pg.sh /opt/

RUN chmod +x /opt/install_tMDataLoader.sh \
    && chmod +x /opt/upload_GSE_studies.sh \
    && chmod +x /opt/upload.sh \
    && chmod +x /opt/install_transmart-batch.sh

ENTRYPOINT ["/opt/entrypoint.sh"]

CMD ["/bin/bash"]

