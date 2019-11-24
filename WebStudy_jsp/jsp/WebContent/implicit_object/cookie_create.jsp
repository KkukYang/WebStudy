<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 클라이언트에게 쿠키를 전달하는 JSP 문서 --%>
<%-- => 쿠키를 전달받은 클라이언트는 서버명을 이용하여 쿠키 저장 --%>    
<%
	//Cookie : 쿠키 관련 기능을 제공하는 클래스
	// => Cookie 객체는 쿠키명(String)과 쿠키값(String)을 제공받아 생성
	Cookie idCookie=new Cookie("id", "abc123");
	Cookie countCookie=new Cookie("count", "0");
	
	//Cookie.setMaxAge(int sec) : 쿠키의 지속시간(초)을 변경하는 메소드
	// => 지속시간 : 클라이언트가 쿠키를 저장하는 시간
	// => 지속시간을 변경하지 않은 경우 기본값을 0으로 설정 - 브라우저가 종료되면 소멸
	countCookie.setMaxAge(24*60*60);//지속시간 : 하루
	
	//response.addCookie(Cookie cookie) : 클라이언트에게 Cookie 객체를 전달하는 메소드
	// => 클라이언트에 쿠키 저장
	response.addCookie(idCookie);//지속시간 미변경 - 브라우저 메모리에 쿠키 저장
	response.addCookie(countCookie);//지속시간 변경 - 브라우저 파일에 쿠키 저장
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>쿠키(Cookie) - 쿠키 전달</h1>
	<hr>
	<p>쿠키 : 클라이언트와 서버의 연결에 대한 지속성을 구현하기 위해 필요한 
	정보(문자열)를 클라이언트에 저장하는 방법</p>
	<hr>
	<p>네 안에 쿠키 있다.</p>
	<hr>
	<p><a href="cookie_use.jsp">쿠키 사용</a></p>
</body>
</html>









