<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- HTML 주석문 : 클라이언트에게 전달되는 설명문 : 소스보기 확인 가능 -->
<%-- JSP 주석문 : 클라이언트에게 전달되지 않는 설명문 : 소스보기 확인 불가능 --%>

<%-- 스크립틀릿 : Java 구문 작성 영역 => HTML 태그 전에 작성하는 것을 권장 --%>
<%
	//시스템의 날짜와 시간정보를 저장하고 있는 Date 객체 생성
	Date now=new Date();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");
	String printDate=sdf.format(now);
%>    

<%!
	//JSP 문서에 대한 서블릿 클래스에 선언된 필드 => 객체 소멸전까지 값 유지
	int count=0;
%>

<%
	//_jspService() 메소드 안에 선언되어 생성된 지역변수
	// => 메소드 종료시 자동 소멸
	//int count=0;

	count++;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>스트립트 태그</h1>
	<hr>
	<%-- out 객체 : 클라이언트에 값을 전달(출력)하기 위한 출력스트림 --%>
	<%-- <p>현재 날짜와 시간은 <% out.println(printDate); %>입니다.</p> --%>
	
	<%-- 표현식 : 값을 문자열로 변환하여 출력하는 영역 --%>
	<p>현재 날짜와 시간은 <%=printDate %>입니다.</p>
	<hr>
	<p>요청 횟수 = <%=count %></p>
</body>
</html>











