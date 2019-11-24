<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 요청에 대한 처리 기능을 제공하는 JSP 문서 --%>
<%-- => 응답 기능을 제공하는 JSP 문서로 포워드 이동 --%>
<%
	String category=request.getParameter("category");
	if(category==null) {
		response.sendRedirect("forward_main.jsp");
		return;
	}
	
	//포워드 이동하기 위한 JSP 문서의 파일명을 저장하기 위한 변수
	// => 전달값에 따라 다른 JSP 문서의 파일명 저장
	String forwardName="";
	if(category.equals("product")) {
		forwardName="forward_product.jsp";
		//request 내장객체를 이용하여 객체 공유 
		// => Request Scope : 스레드가 이동된 JSP 문서에 객체 공유하여 제공
		request.setAttribute("now", new Date());
	} else if(category.equals("cart")) {
		forwardName="forward_cart.jsp";
	} else if(category.equals("order")) {
		forwardName="forward_order.jsp";
	} else {
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);//400
		return;
	}
%>
<%-- JSP 문서 대신 표현식을 이용 가능 --%>
<%-- 다른 JSP 문서로 스레드 이동(포워드 이동) - 클라이언트 브라우저 주소창의 URL 주소 미변경 --%>
<%-- <jsp:forward page="<%=forwardName %>"/> --%>
<%
	//HttpServletRequest.getRequestDispatcher(String jspFileName) : JSP 문서가 저장된
	//RequestDispatcher 객체를 반환하는 메소드
	//RequestDispatcher 객체 : 스레드를 이동하는 기능을 제공하는 객체
	//RequestDispatcher.forward(HttpServletRequest request, HttpServletResponse response)
	// : RequestDispatcher 객체에 저장된 JSP 문서로 스레드를 이동하는 메소드
	request.getRequestDispatcher(forwardName).forward(request, response);
%>



























