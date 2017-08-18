#!/usr/bin/env bash

mvn org.apache.maven.plugins:maven-dependency-plugin:2.8:copy \
-Dartifact=org.cpswt:fedmanager-exec:0.5.0-SNAPSHOT \
-DoutputDirectory=. \
-DoverWriteIfNewer=true \
-Dmdep.useBaseVersion=true

mvn org.apache.maven.plugins:maven-dependency-plugin:2.8:copy \
-Dartifact=org.webgme.guest:TripleSend:0.1.0-SNAPSHOT:jar \
-DoutputDirectory=. \
-DoverWriteIfNewer=true \
-Dmdep.useBaseVersion=true

mvn org.apache.maven.plugins:maven-dependency-plugin:2.8:copy \
-Dartifact=org.webgme.guest:TripleReceive:0.1.0-SNAPSHOT:jar \
-DoutputDirectory=. \
-DoverWriteIfNewer=true \
-Dmdep.useBaseVersion=true

RTI_FILE="RTI.rid"
LOG4J="log4j.configurationFile=conf/log4j2.xml"
IPV4="java.net.preferIPv4Stack=true"
logtofile="-l "

xterm -hold -T "Federation Manager" -l -e \
"java \
-D$IPV4 \
-Dorg.apache.logging.log4j.simplelog.StatusLogger.level=TRACE \
-D$LOG4J \
-jar fedmanager-exec-0.5.0-SNAPSHOT.jar \
-configFile conf/fedmgrconfig.json" &

sleep 30

xterm -hold -T "Gateway Injection" $logtofile -e "java -D$LOG4J -D$IPV4 -jar gateway-demo-0.0.1-SNAPSHOT.jar" &

xterm -hold -T "Triple Send" $logtofile -e "java -D$LOG4J -D$IPV4 -jar TripleSend-0.1.0-SNAPSHOT.jar -configFile conf/TripleSendConfig.json" &

xterm -hold -T "Triple Receive" $logtofile -e "java -D$LOG4J -D$IPV4 -jar TripleReceive-0.1.0-SNAPSHOT.jar -configFile conf/TripleReceiveConfig.json" &
