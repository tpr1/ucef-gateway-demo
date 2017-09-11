#!/usr/bin/env bash

export CURR_DIR=`pwd`
export SRC_DIR="$CURR_DIR/../src"
export FEDMANAGER_HOME="$SRC_DIR/fedmanager"
export DEMO_HOME="$SRC_DIR/ucef-gateway-demo"
export TRIPLE_HOME="$SRC_DIR/TripleFederation_generated"
export TRIPLESEND_HOME="$SRC_DIR/TripleFederation_generated/TripleFederation-java-federates/TripleFederation-impl-java/TripleSend"
export TRIPLEREC_HOME="$SRC_DIR/TripleFederation_generated/TripleFederation-java-federates/TripleFederation-impl-java/TripleReceive"
export RTI_FILE="conf/RTI.rid"
export LOG4J="log4j.configurationFile=conf/log4j2.xml"
export IPV4="java.net.preferIPv4Stack=true"
export CONFIG_FILE="$DEMO_HOME/target/conf/config.properties"
