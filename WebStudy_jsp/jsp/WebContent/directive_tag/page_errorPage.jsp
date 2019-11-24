<%-- errorPage 속성 : 현재 JSP 문서에서 예외가 발생될 경우 사용자에게 에러 메세지를
제공하기 위한 문서를 속성값으로 설정 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="page_isErrorPage.jsp" %>
<%
	//String str="ABCDEFG";
	String str=null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>page - errorPage 속성</h1>
	<hr>
	<p>문자열의 문자 갯수 = <%=str.length() %></p>
</body>
</html>