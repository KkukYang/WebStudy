<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 클라이언트에 저장된 모든 쿠키를 제거하는 JSP 문서 --%> 
<%
	Cookie[] cookies=request.getCookies();
	
	if(cookies!=null) { 
		for(Cookie cookie:cookies) {
			//쿠키 지속시간을 0으로 변경하여 전달하면 쿠키 제거 
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
	}
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>쿠키(Cookie) - 쿠키 제거</h1>
	<hr>
	<p>네 안에 쿠키 없다.</p>	
	<hr>
	<p><a href="cookie_use.jsp">쿠키 사용</a></p>
</body>
</html>













