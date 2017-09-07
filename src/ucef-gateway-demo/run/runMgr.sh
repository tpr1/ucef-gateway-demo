#!/usr/bin/env bash

. ./env.sh
logtofile="-l "
echo "LOG4J=$LOG4J"

cd "$FEDMANAGER_HOME/target"
echo `pwd`
xterm -hold -fg white -bg black -l -lf fedmanager.log -T "Federation Manager" -geometry 80x20+0+0 \
-e "java \
-D$IPV4 \
-Dorg.apache.logging.log4j.simplelog.StatusLogger.level=TRACE \
-D$LOG4J \
-jar fedmanager-exec-0.6.0-SNAPSHOT.jar \
-configFile conf/triple/fedmgrconfig.json" &

sleep 5
cd "$FEDMANAGER_HOME"
echo `pwd`
xterm -hold -fg white -bg black -T "curl" -geometry 80x20+100+60 &






