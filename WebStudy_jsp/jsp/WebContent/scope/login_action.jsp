<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 아이디와 비밀번호를 전달받아 인증 처리하는 JSP 문서 --%>
<%-- => 인증 성공 : 인증 관련 정보를 세션을 이용하여 공유 - 권한처리 --%>    
<%-- => 인증 실패 : 로그인폼 페이지로 이동 --%>
<%
	//비정상적인 요청(GET)에 대한 응답 처리 - 페이지 이동
	if(request.getMethod().equalsIgnoreCase("GET")) {
		session.setAttribute("message", "비정상적인 방법으로 페이지를 요청 하였습니다.");
		response.sendRedirect("login_form.jsp");
		return;
	}

	//입력값을 반환받아 저장
	String id=request.getParameter("id");
	String passwd=request.getParameter("passwd");
	
	//인증처리 : 아이디와 비밀번호 비교 => JDBC
	if(!id.equals("abc123") || !passwd.equals("123456")) {//인증실패
		session.setAttribute("message", "아이디 또는 비밀번호가 맞지 않습니다.");
		session.setAttribute("id", id);
		response.sendRedirect("login_form.jsp");
		return;
	}
	
	//인증성공 - 세션을 이용하여 모든 JSP 문서에 인증 관련 정보 공유
	session.setAttribute("loginId", id);
	
	//로그인 인증 전 요청 페이지가 있는 경우 요청 페이지 이동
	String uri=(String)session.getAttribute("uri");
	if(uri!=null) {
		session.removeAttribute("uri");
		response.sendRedirect(uri);
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
	<h1>로그인 성공</h1>
	<hr>
	<p><%=id %>님 환영합니다. <a href="logout_action.jsp">로그아웃</a></p>
	<p><a href="login_user.jsp">로그인 사용자 페이지 이동</a></p>
	<p><a href="login_form.jsp">로그인 입력 페이지 이동</a></p>
</body>
</html>









