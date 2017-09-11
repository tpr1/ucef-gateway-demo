#!/usr/bin/env bash

. ./env.sh
cd ../
# The FedManager requires special handling.  It lacks a pom file.
rm -fR $FEDMANAGER_HOME/target
echo "pwd=" `pwd`
mvn org.apache.maven.plugins:maven-dependency-plugin:2.8:copy \
-Dartifact=org.cpswt:fedmanager-host:0.6.0-SNAPSHOT \
-DoutputDirectory=$FEDMANAGER_HOME/target \
-DoverWriteIfNewer=true \
-Dmdep.useBaseVersion=true
cd "$FEDMANAGER_HOME"
#mkdir -p $FEDMANAGER_HOME/target && 
cp -r $FEDMANAGER_HOME/conf $FEDMANAGER_HOME/target
cd "$TRIPLE_HOME"
mvn clean install
cd "$DEMO_HOME"
mvn clean install
