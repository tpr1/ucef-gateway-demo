# Gateway Demo
Demonstrates the use of the UCEF Gateway injection federate.
Requires TripleSend and TripleReceive federates.  
gateway-demo injects an interaction and an object at each time step while the federation runs.  It also receives and prints to the console all interaction and object sent by other federates.  

gateway-demo consists of three classes.  These are implemented by the user.
  1. GatewayMain  
  With this the user configures the federate and sets the Injection and Reception federates.

  2. GatewayInjection
  3. GatewayReception

### Dependencies:

[UCEF Core](https://github.com/usnistgov/ucef-core.git)  
Contains the Federate Manager.  

[UCEF Gateway](https://github.com/usnistgov/ucef-gateway.git)  
Contains the execution part of federate injection.

[Triple Federation](https://github.com/gcr-nist/TripleFederation_generated.git)  
Contains two federates  
  1. TripleSend and  
  2. TripleReceive  

  TripleSend creates two interactions and three objects, populates them, then sends them into the federation.  

  TripleReceive receives and prints to the console the interactions and objects sent both by TripleSend and gateway-demo.

## To run the Triple federation:

  - ### Checkout:
    - https://github.com/usnistgov/ucef-core.git
    - https://github.com/gcr-nist/TripleFederation_generated.git
    - https://github.com/usnistgov/ucef-gateway.git

  - ### Navigate to: `cpswt-core/fedmanager-exec`  
  - $ mvn install
  - $ cd target
  - $ ./run3.sh

  - ### Navigate to: `TripleFederation_generated`
  - $`mvn install`  // Should yield success

  - ### Navigate to: `TripleFederation_generated/TripleFederation-java-federates/TripleFederation-impl-java/TripleSend`  
  - $`./build.sh` // Should yield success
  - $ `cd target/`
  - $ `./run.sh` 


  - ### Navigate to: `TripleFederation_generated/TripleFederation-java-federates/TripleFederation-impl-java/TripleReceive`  
  - $ `./build.sh` // Should yield success
  - $ `cd target/`
  - $ `./run.sh`


  - ### Navigate to: `gateway-demo`  
  - `$./build.sh` // Should yield success
  - `cd target/`
  - `$ ./run.sh` 

