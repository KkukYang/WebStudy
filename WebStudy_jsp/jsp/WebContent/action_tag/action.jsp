<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>액션 태그(Action Tag)</h1>
	<hr>
	<p>Java 명령을 JSP 문서에 태그 제공</p>
	<ul>
		<li>include 태그 : 다른 JSP 문서의 실행 결과를 포함 시키는 태그</li>
		<li>forward 태그 : 다른 JSP 문서로 스레드를 이동하는 태그</li>
		<li>param 태그 : 다른 JSP 문서로 값을 전달하는 태그(include 태그 및 forward 태그의 하위태그)</li>
		<li>useBean 태그 : 인스턴스를 생성하여 공유하거나 공유된 인스턴스 사용하기 위한 태그</li>
		<li>setProperty 태그 : 공유 인스턴스의 필드값을 변경하는 태그(useBean 태그의 종속태그)</li>
		<li>getProperty 태그 : 공유 인스턴스의 필드값을 사용하는 태그(useBean 태그의 종속태그)</li>
	</ul>
</body>
</html>
