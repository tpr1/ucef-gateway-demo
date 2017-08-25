# Gateway Demo
Demonstrates the use of the UCEF Gateway injection federate.
Requires TripleSend and TripleReceive federates.  
ucef-gateway-demo injects an interaction and an object at each time step while the federation runs.  It also receives and prints to the console all interactions and objects sent by other federates.  It prints a message at every hook point.

ucef-gateway-demo consists of four classes.  These are implemented by the user.
  1. GatewayMain  
  With this, the user configures the federate and sets the Injection, Reception and Hook federates.

  2. GatewayInjection
  The user implements this class to send interactions.

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
The UCEF Gateway cannot send interactions that are not designed by WebGME.  The gateway must have a complete set of the interactions in the form of a FOM (Federation Object Model) file.  A FOM is generated for any federate designed with WebGME.  The location of the FOM file is specified in a file called config.properties.

### Configuration
Configuration is a properties file that must be located in the src/main/resources directory of the Implementation Project.  Usage is commented therein.  

#### Name of the class that has the main function.
federate-name=GatewayMain

#### Name of the federatian being joined.Usually the name being used by the federationa manager.
federation=FedManager

#### Path to the FOM file.
fom-file=fom/TripleFederation.xml

#### As per the HLA specification defaults to 0.1
lookahead=0.1

#### As per the HLA specification defaults to 1.0
stepsize=1.0

# Run 

The demo is built as an uber project.  It contains all its dependencies and a proper set configuration files.  These are in the run directory.

## To run the Triple federation:

  1. `git clone https://github.com/usnistgov/ucef-gateway-demo.git`
  1. `cd ucef-gateway-demo/run/`
  1. `./runAll.sh` 
