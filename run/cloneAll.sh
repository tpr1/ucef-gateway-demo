#!/usr/bin/env bash

cd ../../
echo `pwd`
git clone https://github.com/usnistgov/ucef-core.git
cd ucef-core
git checkout develop
echo `pwd`
cd ..
echo `pwd`
git clone https://github.com/usnistgov/ucef-gateway.git
cd ucef-gateway
git checkout develop
echo `pwd`
cd ..
echo `pwd`


