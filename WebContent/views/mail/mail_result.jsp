<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%-- <%@ include file="/common/ssi.jsp" %>
<%@ include file="/common/resource.jsp" %> --%>
<%@ include file = "../common/menubar.jsp" %>
<%@ page import="member.web.mail.*"  %>
<%
	MailSend ms = new MailSend();
	ms.MailSend();
out.println("COMPLETE");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>