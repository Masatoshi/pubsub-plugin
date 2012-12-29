<%@page import="org.jivesoftware.openfire.pubsub.Node"%>
<%@ page import="com.lulu.openfire.plugin.PubSubManager" %>

<!DOCTYPE HTML>
<html>
<head>
<title>My Plugin Page</title>

<meta name="pageID" content="nodelist" />
</head>
<body>
<div>Topic list</div>
<div id="topic-list">
<%
	String adminName = ((org.jivesoftware.openfire.auth.AuthToken)session.getAttribute("jive.admin.authToken")).getUsername();
	String domain = org.jivesoftware.openfire.XMPPServer.getInstance().getServerInfo().getXMPPDomain();
	String adminJid = adminName + "@" + domain;
	
	PubSubManager m = PubSubManager.getInstance(adminJid);
	
	for(Node n:m.getToptics()){
%>
	<div><%= n.getName()%></div>
	<div><input type="button" value="remove"/></div>
<%
	}
%>
</div>
</body>
</html>
