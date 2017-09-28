# Gateway Demo
Demonstrates the use of the UCEF Gateway injection federate.
Requires the TripleSend and TripleReceive federates.  
ucef-gateway-demo injects an interaction and two objects at each time step while the federation runs.  It also receives and prints to the console all interactions and objects sent by other federates.  It prints a message at every hook point.

ucef-gateway-demo consists of four classes.  These are implemented by the user.
  1. GatewayMain  
  With this, the user configures the federate and sets the Injection, Reception, and Hook federates.

  2. GatewayInjection  
  The user implements this class to send interactions and objects.

  3. GatewayReception  
  The gateway subscribes to all interactions.  The user dispositions these interactions by implementing this class.  

  4. GatewayHook  
  Enables the user to execute fuctionality at key points during the processing life cycle.  

     Key points:  
     a. Before and after ready-to-populate  
     b. Before and after ready-to-run  
     c. Before and after each time step  

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

### Prerequisites
The UCEF Gateway cannot send interactions and objects that have not been initally designed by WebGME.  The gateway must have a complete set of the interactions and objects in the form of a FOM (Federation Object Model) file.  A FOM is generated for any federate designed with WebGME.  The location of the FOM file is specified in a file called config.json.

### Configuration
Configuration is done with a *.json file whose location is specified as a program argument. (See the last federate specified in the run/runAll.sh script.)  
`$> java -jar somegateway.jar conf/config.json`  

### Contents of the configuration file:

#### Name of the class that has the main function.
federate-name : GatewayMain  

#### Name of the federation being joined.Usually the name being used by the federation manager.
`federation : FedManager`

#### Path to the FOM file.
`fomFile : conf/TripleFederation.xml`

#### As per the HLA specification defaults to 0.1
`lookahead : 0.1`

#### As per the HLA specification defaults to 1.0
`stepsize : 1.0`

#### Object instance declaration.  
A collection of object names followed by an array of instance names. Object names must correspond to names specified in the fom file.  
Just as one declares a class then names instances of that class.  So must instances of declared objects be named.

`objects : {<object name> : [<instance name>, <instance name>, ...], <object name> : [<instance name>, <instance name>, ...]}`

# Run 

The demo is built as an uber project.  It self contains all its dependencies and a proper set configuration files.  These are in the run directory.

## To run the Triple federation:

  1. `$> git clone https://github.com/usnistgov/ucef-gateway-demo.git`
  1. `$> cd ucef-gateway-demo/run/`
  1. `$> ./cloneAll.sh`
  1. Navigate to ucef-core/cpswt-core and run  `$> mvn install`
  1. Navigate to ucef-gateway and run  `$> mvn install`
  1. `$> ./buildAll.sh`
  1. Modify the configuration file  
  1. `$> ./runAll.sh` 
