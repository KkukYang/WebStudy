<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- JNDI로 등록된 객체정보를 이용하여 DBCP 객체를 제공받아 Connection 객체를 반환하여 
출력하는 JSP 문서 --%>
<%
	//InitialContext : JDNI 객체를 생성하는 기능을 제공하는 클래스
	InitialContext context=new InitialContext();

	//InitialContext.lookup(String name) : JDNI 객체를 생성하여 반환하는 메소드
	// => Object 타입으로 객체를 반환하므로 명시적 객체 형변환 후 사용
	DataSource ds=(DataSource)context.lookup("java:comp/env/jdbc/OracleDB");
	
	Connection con=ds.getConnection();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>Apache DBCP</h1>
	<hr>
	<p>con = <%=con %></p>
	<% con.close(); %>
</body>
</html>


