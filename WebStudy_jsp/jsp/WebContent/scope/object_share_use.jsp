<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 공유된 객체를 반환받아 출력하는 JSP 문서 --%>
<%
	String pageName=(String)pageContext.getAttribute("pageName");
	String requestName=(String)request.getAttribute("requestName");
	String sessionName=(String)session.getAttribute("sessionName");
	String applicationName=(String)application.getAttribute("applicationName");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>공유객체 사용</h1>
	<hr>
	<ul>
		<li>pageName = <%=pageName %></li>
		<li>requestName = <%=requestName %></li>
		<li>sessionName = <%=sessionName %></li>
		<li>applicationName = <%=applicationName %></li>
	</ul>
</body>
</html>