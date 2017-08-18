#!/usr/bin/env bash

printf "\ec"
RTI_FILE="RTI.rid"
LOG4J="log4j.configurationFile=conf/log4j2.xml"
IPV4="java.net.preferIPv4Stack=true"
logtofile="-l "

java \
-D$LOG4J \
-D$IPV4 \
-jar gateway-demo-0.0.1-SNAPSHOT.jar
