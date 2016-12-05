#!/bin/bash

service tomcat7 start && R CMD Rserve --save  && tail -f /var/log/tomcat7/transmart.log

