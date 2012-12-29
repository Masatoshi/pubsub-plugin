package com.lulu.openfire.plugin;

import java.util.ArrayList;
import java.util.List;

import org.jivesoftware.openfire.pep.PEPServiceManager;
import org.jivesoftware.openfire.pubsub.Node;
import org.jivesoftware.openfire.pubsub.PubSubService;

public class PubSubManager {
	private PubSubService pubSubService = null;
	private static PubSubManager instance = null;
	
	private PubSubManager(String adminJid){
		pubSubService = new PEPServiceManager().create(new org.xmpp.packet.JID(adminJid));
	}
	
	public static PubSubManager getInstance(String adminJid){
		if(instance == null){			
			instance = new PubSubManager(adminJid);
		}
		return instance;
	}
	
	public List<Node> getToptics(){
		List<Node> list = new ArrayList<Node>();
		list.addAll(pubSubService.getNodes());
		return list;
	}
}
