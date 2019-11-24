<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 로그인 사용자에게 응답결과를 제공하는 JSP 문서 --%>
<%-- => 비로그인 사용자는 로그인 입력 페이지로 이동 --%>
<%
	String loginId=(String)session.getAttribute("loginId");

	if(loginId==null) {
		//request.getRequestURI() : 요청 페이지의 URI 주소를 반환하는 메소드
		String uri=request.getRequestURI();
		//request.getQueryString() : 요청 페이지의 QueryString를 반환하는 메소드
		String query=request.getQueryString();
		if(query==null || query.equals("")) {
			query="";
		} else {
			query="?"+query;
		}
		//요청 페이지에 대한 uri 주소를 세션을 이용하여 공유 
		session.setAttribute("uri", uri+query);
		
		session.setAttribute("message", "로그인 사용자만 요청 가능한 페이지입니다.");
		response.sendRedirect("login_form.jsp");
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
	<h1>로그인 사용자 페이지</h1>
	<hr>
	<p>로그인 사용자에게만 보여지는 내용</p>	
	<p>로그인 사용자에게만 보여지는 내용</p>	
	<p>로그인 사용자에게만 보여지는 내용</p>	
	<p>로그인 사용자에게만 보여지는 내용</p>	
	<p>로그인 사용자에게만 보여지는 내용</p>	
	<p>로그인 사용자에게만 보여지는 내용</p>	
	<p>로그인 사용자에게만 보여지는 내용</p>	
	<p>로그인 사용자에게만 보여지는 내용</p>	
	<p>로그인 사용자에게만 보여지는 내용</p>	
	<p>로그인 사용자에게만 보여지는 내용</p>
	<p><a href="login_form.jsp">로그인 입력 페이지 이동</a></p>	
</body>
</html>