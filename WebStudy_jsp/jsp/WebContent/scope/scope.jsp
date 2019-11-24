<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>	
	<h1>객체 공유 범위 - Scope</h1>
	<hr>
	<p>JSP 문서에서 생성된 객체를 다른 JSP 문서에서 사용할 수 있도록 공유하기 위한 범위</p>
	<p>내장객체(pageContext, request, session, application)를 이용하여 객체를 공유, 
	사용, 제거 가능 - 내장객체에 따라 공유범위 다르게 설정</p>
	<hr>
	<p>내장객체.setAttribute(String attributeName, Object shareObject) :
	공유속성명을 이용하여 객체를 공유하기 위한 메소드</p>
	<p>내장객체.getAttribute(String attributeName) : 공유속성명을 이용하여 공유객체를
	반환하는 메소드 - Object 클래스로 반환하여 객체 형변환하여 사용</p>
	<p>내장객체.removeAttribute(String attributeName) : 공유속성명을 이용하여 
	공유객체를 제거하는 메소드</p>
	<hr>
	<ul>
		<li>Page Scope : 공유 객체를 공유한 JSP 문서에만 접근하여 사용 - pageContext 내장객체</li>
		<li>Request Scope : 공유 객체를 공유한 JSP 문서와 스레드가 이동된 JSP 문서에서
		접근하여 사용(제어권 이동된 JSP 문서 사용) - request 내장객체</li>
		<li>Session Scope : 공유 객체를 컨텍스트에 존재하는 모든 JSP 문서에서
		접근하여 사용(클라이언트마다 다르게 객체 공유) - session 내장객체</li>
		<li>Application Scope : 공유 객체를 컨텍스트에 존재하는 모든 JSP 문서에서
		접근하여 사용(클라이언트에 같은 객체 공유) - application 내장객체</li>
	</ul>
</body>
</html>













