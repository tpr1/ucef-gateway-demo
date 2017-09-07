#!/usr/bin/env bash

. ./env.sh
DIR=`pwd`
cd ../
echo "$DIR"
rm -fR $FEDMANAGER_HOME/target
mvn org.apache.maven.plugins:maven-dependency-plugin:2.8:copy \
-Dartifact=org.cpswt:fedmanager-host:0.6.0-SNAPSHOT \
-DoutputDirectory=$FEDMANAGER_HOME/target \
-DoverWriteIfNewer=true \
-Dmdep.useBaseVersion=true
cd "$TRIPLE_HOME"
mvn clean install
cd "$DEMO_HOME"
mvn clean install
cd "$DIR"

