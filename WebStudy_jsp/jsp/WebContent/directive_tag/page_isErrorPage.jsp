<%-- isErrorPage 속성 : false(기본) 또는 true 속성값으로 설정 --%>
<%-- => 속성값을 true로 설정한 경우 exception 객체가 JSP 문서에 제공 --%>
<%-- exception : 예외정보를 저장하고 있는 객체 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>에러 페이지</h1>
	<hr>
	<p>요청하신 페이지 문제가 발생 하였습니다. 빠른 시일내로 복구 하겠습니다.</p>
	<p>예외 = <%=exception.getMessage() %></p>
</body>
</html>