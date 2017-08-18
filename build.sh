#!/usr/bin/env bash

DIR=`pwd`
mvn clean install -U
cd target
cd $DIR
chmod u+x target/run*