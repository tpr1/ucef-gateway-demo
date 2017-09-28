package gov.nist.hla.ii;

import java.util.HashMap;
import java.util.Map;
import java.util.Queue;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import hla.rti.FederateNotExecutionMember;
import hla.rti.NameNotFound;
import hla.rti.ObjectNotKnown;
import hla.rti.RTIinternalError;

public class GatewayInjection extends InterObjInjectionImpl {

	private static final Logger log = LogManager.getLogger(GatewayInjection.class);

	InjectionFederate federate;

	public GatewayInjection(InjectionFederate federate) {
		super();
		this.federate = federate;
	}

	@Override
	public Queue<InterObjDef> getPreSynchInteractions() {
		// TODO Auto-generated method stub
		return publications;
	}

	@Override
	public Queue<InterObjDef> getPublications(Double logicalTime) {
		log.trace("getInteractions==>");

		try {
			// We define all interactions and objects we intend to inject.
			// These
			// must match what is in the FOM file.
			// Names must be formatted correctly.
			String interactionName = federate.formatInteractionName("Int1");
			Map<String, String> params = new HashMap<String, String>();
			params.put("boolVal", "false");
			params.put("intVal", "987654");
			params.put("strVal", String.format("%s@%f", "YYY", logicalTime));
			addInteraction(interactionName, params);

			// Names must be formatted correctly.
			String className1 = federate.formatObjectName("Obj1");
			Map<String, String> attrMap1 = new HashMap<String, String>();
			attrMap1.put("Obj1Attr3", String.format("%s-%s@%f", "XXX", "instance1A", logicalTime));
			addObject(className1, "instance1A", attrMap1);

			String className2 = federate.formatObjectName("Obj2");
			Map<String, String> attrMap2 = new HashMap<String, String>();
			attrMap2.put("Obj2Attr3", String.format("%s-%s@%f", "XXX", "instance2A", logicalTime));
			addObject(className2, "instance2A", attrMap2);

		} catch (NameNotFound | FederateNotExecutionMember | RTIinternalError | ObjectNotKnown e) {
			log.error(e);
		}
		return publications;
	}
}
