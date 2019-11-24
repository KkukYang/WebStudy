<%-- import 속성 : 외부 패키지의 클래스(인터페이스)을 속성값으로 설정 --%>
<%-- => page 지시어에서 import 속성은 여러 번 선언 가능  --%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<String> nameList=new ArrayList<String>();
	nameList.add("홍길동");
	nameList.add("임꺽정");
	nameList.add("전우치");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>page - import 속성</h1>
	<hr>
	<p><%=nameList %></p>
</body>
</html>
