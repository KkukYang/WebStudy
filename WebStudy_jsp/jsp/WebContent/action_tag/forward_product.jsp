<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//request 내장객체를 이용하여 공유된 객체를 반환받아 저장
	Date now=(Date)request.getAttribute("now");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>제품소개</h1>
	<hr>
	<p><a href="forward_main.jsp">메인으로</a></p>
	<p>공유객체(Date) = <%=now.toString() %></p>
</body>
</html>