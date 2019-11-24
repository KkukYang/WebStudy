<%@page import="com.tjoeun.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDTO loginMember=(MemberDTO) session.getAttribute("loginMember");
	
	if(loginMember==null || loginMember.getStatus()!=9) {
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
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
	<h1>관리자 페이지</h1>
</body>
</html>