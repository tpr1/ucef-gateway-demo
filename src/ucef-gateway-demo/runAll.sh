#!/usr/bin/env bash

RTI_FILE="RTI.rid"
LOG4J="log4j.configurationFile=conf/log4j2.xml"
IPV4="java.net.preferIPv4Stack=true"
logtofile="-l "

gnome-terminal "Federation Manager" --geometry 5000x40+0+0 \
"java \
-D$IPV4 \
-Dorg.apache.logging.log4j.simplelog.StatusLogger.level=TRACE \
-D$LOG4J \
-jar fedmanager-exec-0.5.0-SNAPSHOT.jar \
-configFile conf/fedmgrconfig.json" &

#sleep 30

#xterm -hold -T "Triple Send" $logtofile -e "java -D$LOG4J -D$IPV4 -jar TripleSend-0.1.0-SNAPSHOT.jar -configFile conf/#TripleSendConfig.json" &

#xterm -hold -T "Triple Receive" $logtofile -e "java -D$LOG4J -D$IPV4 -jar TripleReceive-0.1.0-SNAPSHOT.jar -configFile conf/#TripleReceiveConfig.json" &

#xterm -hold -T "Gateway Injection" $logtofile -e "java -D$LOG4J -D$IPV4 -jar gateway-demo-0.0.1-SNAPSHOT.jar" &


