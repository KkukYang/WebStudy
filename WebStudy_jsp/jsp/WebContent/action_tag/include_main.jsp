<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String category=request.getParameter("category");
	if(category==null) category="main";
	
	String headerName="";
	String master="";
	if(category.equals("main")) {
		headerName="include_header_main.jsp";
		master="홍길동(abc@google.com)";
	} else if(category.equals("blog")) {
		headerName="include_header_blog.jsp";
		master="임꺽정(xyz@daum.net)";
	} else if(category.equals("cafe")) {
		headerName="include_header_cafe.jsp";
		master="전우치(123@naver.com)";
	} else {
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);//400
		return;
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>Action Tag - include</h1>
	<hr>
	<p>JSP 문서에서 다른 JSP 문서로 스레드를 이동하여 처리 후 응답 결과를 제공받아 포함</p>
	<hr>
	<%-- Header 영역 --%>
	<%-- 
	<h2>메인페이지</h2>
	<p>
		<a href="include_main.jsp?category=main">메인</a>&nbsp;&nbsp;
		<a href="include_main.jsp?category=blog">블로그</a>&nbsp;&nbsp;
		<a href="include_main.jsp?category=cafe">카페</a>&nbsp;&nbsp;
	</p>
	<hr>
	--%>
		
	<%-- include Directive : 외부파일의 코드 포함 --%>
	<%-- => 외부파일에서 선언된 변수를 JSP 문서에서 사용 가능 --%>
	<%-- => 외부파일이 변경되면 JSP 문서 재컴파일 --%>
	<%-- => 외부파일명 대신 표현식 사용 불가능 - 정적포함 --%>
	<%-- <%@include file="include_header.jspf" %> --%>
	
	<%-- include ActionTag : JSP 문서의 응답 결과 포함 --%>
	<%-- => 포함 JSP 문서에서 선언된 변수를 JSP 문서에서 사용 불가능 --%>
	<%-- => 포함 JSP 문서가 변경해도 현재 JSP 문서에 대한 재컴파일 불필요 --%>
	<%-- => 포함 JSP 문서 대신 표현식 사용 가능 - 동적포함 --%>
	<%-- <jsp:include page="include_header_main.jsp"/> --%>
	<jsp:include page="<%=headerName %>"/>
	
	<%-- Content 영역 --%>
	<p>요청에 대한 응답 결과</p>	
	<p>요청에 대한 응답 결과</p>	
	<p>요청에 대한 응답 결과</p>	
	<p>요청에 대한 응답 결과</p>	
	<p>요청에 대한 응답 결과</p>	
	<p>요청에 대한 응답 결과</p>	
	<p>요청에 대한 응답 결과</p>	
	<p>요청에 대한 응답 결과</p>	
	<p>요청에 대한 응답 결과</p>	
	<p>요청에 대한 응답 결과</p>
	
	<%-- Footer 영역 --%>
	<%-- 
	<hr>
	<p>Copyright © Tjoeun Corp. All rights reserved.</p>
	<p>담당자 : 홍길동(abc@google.com)</p>
	--%>
	<%-- param ActionTag : 포함 JSP 문서로 값을 전달하는 태그 --%>
	<jsp:include page="include_footer.jsp">
		<jsp:param value="<%=master %>" name="master"/>
	</jsp:include>	
</body>
</html>