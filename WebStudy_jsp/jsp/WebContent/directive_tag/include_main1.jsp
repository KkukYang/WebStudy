<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<%-- Header 영역 : 회사로고, 메뉴, 이미지 슬라이드 등 출력 --%>
	<%-- 
	<h1>Header 영역</h1>
	<hr>
	--%>
	<%-- 외부파일에 선언된 코드를 현재 JSP 문서에 포함 --%>
	<%-- => file 속성 : 포함 시킬 외부파일의 URL 경로 속성값으로 설정 --%>
	<%-- => 외부 파일이 존재하지 않을 경우 에러 발생 --%>
	<%-- web.xml 파일에서 JSP 문서에 포함될 외부파일 설정 가능 --%>
	<%-- <%@include file="include_header.jspf" %> --%>
	
	<%-- Content 영역 : 클라이언트 요청에 대한 응답 결과 출력 --%>
	<h2>Content 영역</h2>
	<ul>
		<li>include_main1.jsp 요청 페이지의 응답 결과</li>
		<li>include_main1.jsp 요청 페이지의 응답 결과</li>
		<li>include_main1.jsp 요청 페이지의 응답 결과</li>
		<li>include_main1.jsp 요청 페이지의 응답 결과</li>
		<li>include_main1.jsp 요청 페이지의 응답 결과</li>
		<li>include_main1.jsp 요청 페이지의 응답 결과</li>
		<li>include_main1.jsp 요청 페이지의 응답 결과</li>
		<li>include_main1.jsp 요청 페이지의 응답 결과</li>
		<li>include_main1.jsp 요청 페이지의 응답 결과</li>
		<li>include_main1.jsp 요청 페이지의 응답 결과</li>
	</ul>
	
	<%-- Footer 영역 : 개인정보 보호 정책, 약관, 저작권 등 출력  --%>
	<%-- 
	<hr>
	<h3>Footer 영역</h3>
	<p>Copyright © tjoeun Corp. All rights reserved.</p>
	--%>
	<%-- <%@include file="include_footer.jspf" %> --%>
</body>
</html>







