<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 모든 클라이언트 요청에 대한 응답 위한 JSP 문서 --%>    
<%
	if(request.getParameter("group")==null || request.getParameter("part")==null) {
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}
	
	//전달값을 반환받아 저장
	String group=request.getParameter("group");
	String part=request.getParameter("part");
	
	//전달값을 이용하여 Content 영역에 응답 결과를 포함시킬 JSP 문서 생성
	//ex) group=main, part=display >> main/main_display.jsp
	String contentPath=group+"/"+group+"_"+part+".jsp";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
<style type="text/css">
#header {
	margin: 10px;
	height: 120px;
	border: 1px solid red;
	text-align: center;
}

#content {
	margin: 10px;
	min-height: 350px;
	border: 1px solid green;
	text-align: center;
}

#footer {
	margin: 10px;
	height: 80ox;
	border: 1px solid blue;
	text-align: center;
}

a, a:visited {
	text-decoration: none;
	color: black;
}

.menu a:hover {
	color: orange;
}
</style>
</head>
<body>
	<div id="header">
		<h1><a href="index.jsp">회사로고</a></h1>
		<div class="menu">
			<a href="index.jsp?group=product&part=best">제품소개</a>&nbsp;&nbsp;
			<a href="index.jsp?group=cart&part=all">장바구니</a>&nbsp;&nbsp;
			<a href="index.jsp?group=order&part=display">구매내역</a>&nbsp;&nbsp;
			<a href="index.jsp?group=review&part=list">사용후기</a>&nbsp;&nbsp;
		</div>
	</div>
	
	<div id="content">
		<jsp:include page="<%=contentPath %>"/>
	</div>
	
	<div id="footer">
		<p>Copyright ⓒ Thoeun Corp.All rights reserved</p>
	</div>
</body>
</html>




