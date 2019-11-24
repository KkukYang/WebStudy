<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 로그아웃 처리 후 로그인 입력 페이지로 이동하는 JSP 문서 --%>    
<%
	//session.removeAttribute("loginId");

	//세션으로 공유된 모든 공유객체를 제거하는 메소드
	session.invalidate();

	response.sendRedirect("login_form.jsp");
%>