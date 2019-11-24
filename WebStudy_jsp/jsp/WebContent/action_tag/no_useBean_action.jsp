<%@page import="com.tjoeun.bean.Hewon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 입력값을 제공받아 처리하고 응답 페이지로 포워드 이동하는 JSP 문서 - 처리 페이지 --%>    
<%
	if(request.getMethod().equalsIgnoreCase("GET")) {
		response.sendRedirect("no_useBean_form.jsp");
		return;
	}

	//리퀘스트 메세지로 전달되는 입력값에 대한 캐릭터셋의 인코딩 변경
	// => 인코딩 필터를 이용할 경우 생략 가능
	//request.setCharacterEncoding("UTF-8");
	
	//입력값을 반환받아 저장
	String name=request.getParameter("name");
	String phone=request.getParameter("phone");
	String address=request.getParameter("address");

	//반환받은 입력값이 저장된 객체 생성
	Hewon hewon=new Hewon();
	hewon.setName(name);	
	hewon.setPhone(phone);
	hewon.setAddress(address);	
	
	//입력값이 저장된 객체(결과)를 공유한 후 응답 페이지로 포워드 이동
	request.setAttribute("hewon", hewon);
	request.getRequestDispatcher("no_useBean_print.jsp").forward(request, response);
%>
