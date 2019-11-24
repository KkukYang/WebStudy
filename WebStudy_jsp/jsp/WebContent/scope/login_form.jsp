<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 로그인 사용자와 비로그인 사용자를 구분하여 다른 응답 결과를 제공하는 JSP 문서 --%>
<%-- => 비로그인 사용자 : 로그인 정보를 입력받아 처리 페이지로 전달 --%>    
<%-- => 로그인 사용자 : 환영 메세지 출력 --%>    
<%
	String message=(String)session.getAttribute("message");
	if(message==null) {
		message="";
	} else {
		//다른 JSP 문서에서 공유객체(메세지)를 사용하지 못하도록 제거
		session.removeAttribute("message");
	}
	
	String id=(String)session.getAttribute("id");
	if(id==null) {
		id="";
	} else {
		session.removeAttribute("id");
	}
	
	String loginId=(String)session.getAttribute("loginId");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<% if(loginId==null) { //비로그인 사용자 %>
		<h1>로그인폼</h1>
		<hr>
		<form action="login_action.jsp" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" value="<%=id%>"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="passwd"></td>
			</tr>
			<tr>
				<td colspan="2"><button type="submit">로그인</button></td>
			</tr>
		</table>	
		</form>
		<hr>
		<div style="color: red;"><%=message %></div>
	<% } else {//로그인 사용자 %>
		<h1>로그인 사용자 페이지</h1>
		<hr>
		<p><%=loginId %>님 환영합니다. <a href="logout_action.jsp">로그아웃</a></p>
	<% } %>	
</body>
</html>
