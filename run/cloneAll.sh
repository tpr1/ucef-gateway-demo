#!/usr/bin/env bash

cd ../../
echo `pwd`
git clone https://github.com/usnistgov/ucef-core.git
git checkout develop
cd ucef-core
echo `pwd`
cd ..
echo `pwd`
git clone https://github.com/usnistgov/ucef-gateway.git
git checkout develop
cd ucef-gateway
echo `pwd`
cd ..
echo `pwd`
git clone https://github.com/gcr-nist/TripleFederation_generated.git
cd TripleFederation_generated
echo `pwd`
cd ..
echo `pwd`

