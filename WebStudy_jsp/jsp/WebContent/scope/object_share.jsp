<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 객체를 공유하는 JSP 문서 => 공유된 객체를 반환받아 출력 --%>
<%
	pageContext.setAttribute("pageName", "홍길동");//Page Scope
	request.setAttribute("requestName", "임꺽정");//Request Scope
	session.setAttribute("sessionName", "전우치");//Session Scope
	application.setAttribute("applicationName", "일지매");//Application Scope
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>객체 공유</h1>
	<hr>
	<p>객체를 공유하였습니다.</p>
	<hr>
	<%
		//공유속성명으로 공유된 객체가 없는 경우 null 반환
		// => 공유객체를 Object 클래스의 객체로 반환 - 객체 형변환
		String pageName=(String)pageContext.getAttribute("pageName");
		String requestName=(String)request.getAttribute("requestName");
		String sessionName=(String)session.getAttribute("sessionName");
		String applicationName=(String)application.getAttribute("applicationName");
	%>
	<ul>
		<li>pageName = <%=pageName %></li>
		<li>requestName = <%=requestName %></li>
		<li>sessionName = <%=sessionName %></li>
		<li>applicationName = <%=applicationName %></li>
	</ul>
	<p><a href="object_share_use.jsp">공유객체 사용</a></p>
</body>
</html>









