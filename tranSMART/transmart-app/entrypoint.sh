#!/bin/bash
sed -i "s/password.*$/password = '$POSTGRES_PASSWORD'/" /usr/share/tomcat7/.grails/transmartConfig/DataSource.groovy
service tomcat7 start && R CMD Rserve --save  && tail -f /var/log/tomcat7/transmart.log /var/log/tomcat7/catalina.out

