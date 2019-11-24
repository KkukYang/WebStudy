<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 클라이언트에서 전달한 쿠키를 제공받아 출력하는 JSP 문서 --%>
<%-- => 클라이언트는 서버명과 동일한 쿠키가 존재할 경우 요청 페이지에 전달 --%>
<%
	//request.getCookies() : 클라이언트에서 전달된 모든 쿠키 객체를 제공받아 배열로
	//반환하는 메소드
	Cookie[] cookies=request.getCookies();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>쿠키(Cookie) - 쿠키 사용</h1>
	<hr>
	<% if(cookies==null) { %>
		<p>클라이언트에 저장된 쿠키가 하나도 없습니다.</p>
	<% } else {
		String id="",count="";
		for(Cookie cookie:cookies) {
			//Cookie.getName() : 쿠키 객체에 저장된 쿠키명을 반환하는 메소드
			if(cookie.getName().equals("id")) {
				//Cookie.getValue() : 쿠키 객체에 저장된 쿠키값을 반환하는 메소드
				id=cookie.getValue();
			} else if(cookie.getName().equals("count")) {
				count=cookie.getValue();
			}
		}
	%>
		<% if(!id.equals("")) { %>
			<p>아이디 = <%=id %></p>
		<% } %>			
		
		<% if(!count.equals("")) { %>
			<% int cnt=Integer.parseInt(count)+1; %>
			<p>카운트 = <%=cnt %></p>
			<%
				//쿠키 변경 : 쿠키명이 중복될 경우 쿠키값 변경
				//Cookie cookie=new Cookie("count",String.valueOf(cnt));
				Cookie cookie=new Cookie("count",cnt+"");
				cookie.setMaxAge(24*60*60);
				response.addCookie(cookie);
			%>
		<% } %>
	<% } %>
	<hr>
	<p><a href="cookie_create.jsp">쿠키 전달</a></p>
	<p><a href="cookie_erase.jsp">쿠키 제거</a></p>
</body>
</html>














