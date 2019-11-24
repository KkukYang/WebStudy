<%@page import="com.tjoeun.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String source="abc123";
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>비밀번호 관련 기능 테스트</h1>
	<hr>
	<p>원본 = <%=source %></p>
	<p>암호화 = <%=Utility.encrypt(source) %></p>
	<hr>
	<p>새로운 비밀번호-1 = <%=Utility.newPasswordOne() %></p>
	<p>새로운 비밀번호-2 = <%=Utility.newPasswordTwo() %></p>
</body>
</html>





