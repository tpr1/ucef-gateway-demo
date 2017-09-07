#!/usr/bin/env bash

. ./env.sh
cd $FEDMANAGER_HOME
echo `pwd`
./build.sh
cd "$TRIPLE_HOME"
./build.sh
cd "$TRIPLESEND_HOME"
./build.sh
cd "$TRIPLEREC_HOME"
./build.sh
cd "$GATEWAY_HOME"
./build.sh
cd "$DEMO_HOME"
./build.sh

