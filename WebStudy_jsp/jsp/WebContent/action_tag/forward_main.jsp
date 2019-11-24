<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>ActionTag - forward</h1>
	<hr>
	<p>요청 JSP 문서에서 다른 JSP 문서로 스레드를 이동하여 응답 결과 제공</p>
	<hr>
	<a href="forward_controller.jsp?category=product">제품소개</a>&nbsp;&nbsp;
	<a href="forward_controller.jsp?category=cart">장바구니</a>&nbsp;&nbsp;
	<a href="forward_controller.jsp?category=order">구매내역</a>&nbsp;&nbsp;
</body>
</html>