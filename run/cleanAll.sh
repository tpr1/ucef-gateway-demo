#!/usr/bin/env bash

. ./env.sh
echo `pwd`
cd $FEDMANAGER_HOME
echo `pwd`
mvn clean
cd "$TRIPLE_HOME"
echo `pwd`
mvn clean
cd "$TRIPLESEND_HOME"
echo `pwd`
mvn clean
cd "$TRIPLEREC_HOME"
echo `pwd`
mvn clean
cd "$GATEWAY_HOME"
echo `pwd`
mvn clean
cd "$DEMO_HOME"
echo `pwd`
mvn clean

