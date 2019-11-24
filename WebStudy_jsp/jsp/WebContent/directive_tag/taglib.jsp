<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- taglib : 태그 라이브러리 파일을 불러와 커스텀 태그를 제공하는 디렉티브 --%>
<%-- => prefix : 태그 라이브러리 파일의 커스텀 태그를 사용하기 위한 네임스페이스를 속성값으로 설정 --%>    
<%-- => uri : 태그 라이브러리 파일의 고유값을 속성값으로 설정 --%>    
<%@taglib prefix="simple" uri="http://www.tjoeun.com/jsp/custom" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>커스텀 태그(Custom Tag)</h1>
	<hr>
	<simple:hello/>
	<simple:hello/>
	<simple:hello/>
	<simple:hello/>
	<simple:hello/>
</body>
</html>



