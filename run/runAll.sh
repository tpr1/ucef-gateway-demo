#!/usr/bin/env bash

. ./env.sh
printf "\ec"

cd "$FEDMANAGER_HOME/target"
echo `pwd`
XTERM_LOG=xterm-fedmanager.log
rm -f $XTERM_LOG
xterm -hold -fg white -bg black -l -lf $XTERM_LOG -T "Federation Manager" -geometry 80x20+0+0 \
-e "java \
-D$IPV4 \
-D$LOG4J \
-jar fedmanager-host-0.6.0-SNAPSHOT.jar \
-configFile conf/fedmgrconfig.json" &

sleep 15
$CURR_DIR/curl_start

cd "$TRIPLESEND_HOME/target"
sleep 5
XTERM_LOG=xterm-triplesend.log
rm -f $XTERM_LOG
xterm -hold -fg cyan -bg black -l -lf $XTERM_LOG -T "Triple Send" -geometry 80x20+600+0 -e "java -D$LOG4J -D$IPV4 -jar TripleSend-0.1.0-SNAPSHOT.jar -configFile conf/TripleSendConfig.json" &

cd "$TRIPLEREC_HOME/target"
sleep 5
XTERM_LOG=xterm-triplereceive.log
rm -f $XTERM_LOG
xterm -hold -fg pink -bg black -l -lf $XTERM_LOG -T "Triple Receive" -geometry 80x20+700+60 -e "java -D$LOG4J -D$IPV4 -jar TripleReceive-0.1.0-SNAPSHOT.jar -configFile conf/TripleReceiveConfig.json" &

cd "$DEMO_HOME/target"
sleep 5
XTERM_LOG=xterm-gateway-demo.log
rm -f $XTERM_LOG
xterm -hold -fg green -bg black -l -lf $XTERM_LOG -T "Gateway Injection" -geometry 80x20+800+120 -e "java -D$LOG4J -D$IPV4 -jar gateway-demo-0.0.1-SNAPSHOT.jar $CONFIG_FILE" &
echo $RTI_FILE






