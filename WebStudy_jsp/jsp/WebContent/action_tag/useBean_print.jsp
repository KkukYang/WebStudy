<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 공유객체를 제공받아 응답하는 JSP 문서 - 출력 페이지 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>회원정보 확인</h1>
	<hr>
	<%-- 공유객체를 반환받아 객체 생성 --%>
	<jsp:useBean id="hewon" class="com.tjoeun.bean.Hewon" scope="request"/>
	<ul>
	<%-- getProperty : 공유객체의 필드값을 반환하기 위한 Getter를 호출하는 ActionTag --%>
		<li>이름 = <jsp:getProperty name="hewon" property="name"/></li>
		<li>전화번호 = <jsp:getProperty name="hewon" property="phone"/></li>
		<li>주소 = <jsp:getProperty name="hewon" property="address"/></li>
	</ul>
</body>
</html>






