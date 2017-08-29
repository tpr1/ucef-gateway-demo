#!/usr/bin/env bash
cd ../../

git clone https://github.com/usnistgov/ucef-core.git
git checkout feature/uber
git clone https://github.com/usnistgov/ucef-gateway.git
git checkout develop
git clone https://github.com/usnistgov/ucef-gateway-demo.git
git clone https://github.com/gcr-nist/TripleFederation_generated.git
