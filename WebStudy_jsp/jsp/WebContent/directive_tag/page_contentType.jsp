<%-- 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
--%>
<%-- contentType 속성 : 클라이언트에게 전달할 데이타 형태를 속성값 설정 --%>
<%@ page language="java" contentType="application/msword; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
<style type="text/css">
table {
	border: 1px solid black;
	border-collapse: collapse;
}

td {
	border: 1px solid black;
	width: 200px;
	text-align: center;	
}
</style>
</head>
<body>
	<h1>page - contentType 속성</h1>
	<table>
		<tr>
			<td>아이디</td><td>이름</td><td>주소</td>
		</tr>
		<tr>
			<td>aaa</td><td>홍길동</td><td>서울시 강남구</td>
		</tr>
		<tr>
			<td>bbb</td><td>임꺽정</td><td>인천시 월미구</td>
		</tr>
		<tr>
			<td>ccc</td><td>전우치</td><td>수원시 팔달구</td>
		</tr>
	</table>
</body>
</html>