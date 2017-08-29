#!/usr/bin/env bash

. ./env.sh
export RTI_FILE="RTI.rid"
LOG4J="log4j.configurationFile=conf/log4j2.xml"
IPV4="java.net.preferIPv4Stack=true"
logtofile="-l "

cd "$FEDMANAGER_HOME/target"
echo `pwd`
xterm -hold -fg white -bg black -T "Federation Manager" -geometry 80x20+0+0 \
-e "java \
-D$IPV4 \
-Dorg.apache.logging.log4j.simplelog.StatusLogger.level=TRACE \
-D$LOG4J \
-jar fedmanager-exec-0.5.0-SNAPSHOT.jar \
-configFile conf/fedmgrconfig.json" &

cd "$TRIPLESEND_HOME/target"
sleep 10
xterm -hold -fg cyan -bg black -T "Triple Send" -geometry 80x20+600+0 -e "java -D$LOG4J -D$IPV4 -jar TripleSend-0.1.0-SNAPSHOT.jar -configFile conf/TripleSendConfig.json" &

cd "$TRIPLEREC_HOME/target"
sleep 5
xterm -hold -fg pink -bg black -T "Triple Receive" -geometry 80x20+700+60 -e "java -D$LOG4J -D$IPV4 -jar TripleReceive-0.1.0-SNAPSHOT.jar -configFile conf/TripleReceiveConfig.json" &

cd "$DEMO_HOME/target"
sleep 5
xterm -hold -fg green -bg black -T "Gateway Injection" -geometry 80x20+800+120 -e "java -D$LOG4J -D$IPV4 -jar gateway-demo-0.0.1-SNAPSHOT.jar" &

sleep 5
cd "$FEDMANAGER_HOME"
echo `pwd`
xterm -hold -fg white -bg black -T "curl" -geometry 80x20+100+60



