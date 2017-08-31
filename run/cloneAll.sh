#!/usr/bin/env bash

cd ../../
echo `pwd`
git clone https://github.com/usnistgov/ucef-core.git
cd ucef-core
echo `pwd`
git checkout feature/uber
cd ..
echo `pwd`
git clone https://github.com/usnistgov/ucef-gateway.git
cd ucef-gateway
echo `pwd`
git checkout develop
cd ..
echo `pwd`
git clone https://github.com/gcr-nist/TripleFederation_generated.git
cd TripleFederation_generated
echo `pwd`
cd ..
echo `pwd`

