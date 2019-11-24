<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 포함 JSP 문서는 요청 JSP 문서의 request 객체와 response 객체를 전달받아 사용 --%>    
<%-- => 전달받은 request 객체와 response 객체에 대한 정보 변경 불가능 --%>    
<%-- => 요청 JSP 문서에서 request 객체와 response 객체에 대한 정보 변경 후 전달 --%>    
<%
	//request 객체와 response 객체에 대한 변경 메소드 미실행
	//response.sendRedirect("action.jsp");
	//request.setCharacterEncoding("UTF-8");
	
	String master=request.getParameter("master");
%>    
    
<hr>
<p>Copyright © Tjoeun Corp. All rights reserved.</p>
<%-- <p>담당자 : 홍길동(abc@google.com)</p> --%>
<p>담당자 : <%=master %></p>