<%@page import="com.tjoeun.bean.Hewon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 공유객체를 제공받아 응답하는 JSP 문서 - 출력 페이지 --%>
<%
	Hewon hewon=(Hewon)request.getAttribute("hewon");

	if(hewon==null) {
		response.sendRedirect("no_useBean_form.jsp");
		return;
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>회원정보 확인</h1>
	<hr>
	<ul>
		<li>이름 = <%=hewon.getName() %></li>
		<li>전화번호 = <%=hewon.getPhone() %></li>
		<li>주소 = <%=hewon.getAddress() %></li>
	</ul>
</body>
</html>





