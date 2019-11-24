<%@page import="com.tjoeun.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 로그인 사용자에게 회원정보 관련 메뉴가 출력되는 페이지 --%>    
<%-- => 로그인 사용자만 접근 가능한 페이지 
<%-- => 미로그인 사용자인 경우 세션에 에러메세지를 저장 공유하여 memberLogin.jsp로 이동 : loginCheck.jspf  --%>   
<%--
	//세션에 저장되어 공유된 로그인 인증정보를 반환받아 저장
	MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");

	//로그인 인증정보가 존재하지 않을 경우 
	// => 미로그인 사용자 : 비정상적인 요청에 대한 응답 처리
	if(loginMember==null) {
		session.setAttribute("errorMessage", "로그인 사용자만 접근 가능합니다.");
		response.sendRedirect("memberLogin.jsp");
		return;
	}
--%>
<%@include file="loginCheck.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>마이페이지</h1>
	<hr>
	<p><%=loginMember.getName()%>님 환영합니다.&nbsp;&nbsp;&nbsp;
	<a href="memberLogoutAction.jsp">로그아웃</a>	
	</p>
	<hr>
	<a href="memberLogin.jsp">로그인</a>&nbsp;&nbsp;
	<a href="">회원정보 변경</a>&nbsp;&nbsp;
	<a href="">회원탈퇴</a>&nbsp;&nbsp;
	<% if(loginMember.getStatus()==9) { %>
		<a href="memberAdmin.jsp">관리자</a>&nbsp;&nbsp;
	<% } %>
</body>
</html>




