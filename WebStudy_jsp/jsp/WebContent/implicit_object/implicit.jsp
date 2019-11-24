<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>내장객체(Implicit Object)</h1>
	<hr>
	<p>JSP 문서에 기본적으로 제공되는 객체(인스턴스)</p>
	<ul>
		<li>page : JSP 문서를 표현하기 위한 객체(클래스의 this와 유사)</li>
		<li>out : 클라이언트에게 값을 전달하기 위한 객체(출력스트림)</li>
		<li>config : web.xml 파일에 존재하는 값을 얻어오기 위해 사용하는 객체</li>
		<li>request : 클라이언트(브라이저)의 정보 및 요청값을 얻어오기 위해 사용하는 객체</li>
		<li>response : 클라이언트에게 응답코드 및 응답값을 전달하기 위해 사용하는 객체</li>
		<li>session : 클라이언트의 정보를 서버에 저장하거나 제공하기 위한 객체</li>
		<li>application : WAS(Web Application Server)의 정보를 제공하기 위한 객체</li>
		<li>pageContext : 문서의 모든 정보를 제공하기 위한 객체</li>
		<li>excpetion : 문서의 예외정보를 제공하기 위한 객체 
		- page Directive에서 isErrorpage 속성값이 true인 경우에만 제공</li>
	</ul>
</body>
</html>