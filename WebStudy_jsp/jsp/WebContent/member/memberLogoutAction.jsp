<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 로그아웃 처리 후 memberLogin.jsp로 이동하는 페이지 --%>    
<%
	//세션에 저장되어 공유된 인증정보(MemberDTO 인스턴스)를 제거
	//session.removeAttribute("loginMember");
	session.invalidate();//모든 세션 공유객체 제거

	//페이지 이동
	response.sendRedirect("memberLogin.jsp");
%>