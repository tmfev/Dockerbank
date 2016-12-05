# Version 0.0.1

FROM ubuntu:14.04
MAINTAINER Benjamin Baum "Benjamin.Baum@med.uni-goettingen.de"

ENV BUILD true 
ENV POSTGRES_PASSWORD POSTGRESSPASSWORDCHANGEME

ENV GITREPO https://github.com/tranSMART-Foundation/transmartApp.git
ENV GITREPODATA https://github.com/tranSMART-Foundation/transmart-data.git

ENV VERSION release-16.1

ENV transmartApp /opt/transmartApp

# Add CRAN Mirror for R
ENV CRAN_MIRROR http://cran-mirror.cs.uu.nl

# Setup Grails path.
ENV GRAILS_HOME /usr/lib/jvm/grails
ENV PATH $GRAILS_HOME/bin:$PATH
ENV JAVA_HOME /usr/lib/jvm/java-1.7.0-openjdk-amd64
ENV GRAILS_VERSION 2.3.11

# Fix bash/sh
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Add mirror for latest R
RUN echo 'deb http://ftp5.gwdg.de/pub/misc/cran/bin/linux/ubuntu trusty/' >> /etc/apt/sources.list
RUN apt-key adv --recv-keys --keyserver keyserver.ubuntu.com E084DAB9 

# Install packages
RUN apt-get update && apt-get -y upgrade && apt-get -y install git \
    postgresql-client \
    make \
    curl \
    php5 \
    vim \
    unzip \
#    openjdk-7-jre \
    openjdk-7-jdk \
    wget \
    tomcat7 \
    r-base \
    r-recommended \
    libcairo2-dev \
    && rm -rf /var/lib/apt/lists/* # Clean apt cache

# Install Grails
WORKDIR /usr/lib/jvm
RUN wget https://github.com/grails/grails-core/releases/download/v$GRAILS_VERSION/grails-$GRAILS_VERSION.zip && \
    unzip grails-$GRAILS_VERSION.zip && \
    rm -rf grails-$GRAILS_VERSION.zip && \
    ln -s grails-$GRAILS_VERSION grails


WORKDIR /opt/
COPY vars .

# Increase tomcat7 Heapspace
RUN echo "export JAVA_OPTS=-Dfile.encoding=UTF-8 -Xms1024m -Xmx4196m -XX:PermSize=1024m -XX:MaxPermSize=4196m" >> /usr/share/tomcat7/bin/setenv.sh 


WORKDIR /opt/

RUN git clone $GITREPO transmartApp
RUN git clone $GITREPODATA transmart-data

  # checkout correct version
WORKDIR /opt/transmartApp
RUN  git checkout ${VERSION}

WORKDIR  cd /opt/transmart-data
RUN  git checkout ${VERSION}

  # Install R
WORKDIR /opt/transmart-data
RUN  sed -i "s/password.*$/password = '$POSTGRES_PASSWORD'/" config/DataSource.groovy.php \
  && mv /opt/vars /opt/transmart-data \
  && source ./vars \
  && make -C config install \
  && Rscript R/cran_pkg.R \
  && Rscript R/other_pkg.R


  # fix transmart-code-db-tests errors
WORKDIR /opt/transmartApp/grails-app/conf
RUN  sed -i /$transmart-core-db-tests/d BuildConfig.groovy

WORKDIR /opt/transmartApp
RUN sed -i "/runtime \':transmart-core:16.1\'/a runtime \':smart-r:1.0.RC1-SNAPSHOT\'" grails-app/conf/BuildConfig.groovy


# copy configs
RUN  mkdir /usr/share/tomcat7/.grails/ \
  && cp /root/.grails/transmartConfig/ /usr/share/tomcat7/.grails/transmartConfig -r

 # generate war file
WORKDIR /opt/transmartApp
RUN grails war

 # copy transmart.war to tomcat/webapps
RUN  mv $transmartApp/target/transmart.war /var/lib/tomcat7/webapps




# Cleanup
WORKDIR /opt/
RUN rm -r /opt/transmartApp
RUN rm -r /opt/transmart-data



COPY entrypoint.sh /opt/entrypoint.sh
COPY wait-for-pg.sh /opt/wait-for-pg.sh

EXPOSE 8080
RUN touch /var/log/tomcat7/transmart.log
RUN chown tomcat7:tomcat7 /var/log/tomcat7/transmart.log
RUN chown tomcat7:tomcat7 /usr/share/tomcat7/ -R

ENTRYPOINT ["/opt/entrypoint.sh"]
#CMD ["bash"]
