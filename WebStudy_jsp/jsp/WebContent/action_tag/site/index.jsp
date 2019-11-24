<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 클라이언트의 요청을 받아 템플릿 페이지로 제어권을 이동하는 JSP 문서 --%>
<%-- => 템플릿 페이지를 구성하는 정보를 전달 --%>    
<%
	String group=request.getParameter("group");
	if(group==null) group="main";
	
	String part=request.getParameter("part");
	if(part==null) part="display";
%>
<jsp:forward page="template.jsp">
	<jsp:param value="<%=group %>" name="group"/>
	<jsp:param value="<%=part %>" name="part"/>
</jsp:forward>