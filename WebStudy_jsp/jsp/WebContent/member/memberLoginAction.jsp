<%@page import="com.tjoeun.dao.MemberDAO"%>
<%@page import="com.tjoeun.dto.MemberDTO"%>
<%@page import="com.tjoeun.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 아이디와 비밀번호를 전달받아 인증처리 후 페이지 이동하는 JSP 문서 --%>  
<%-- => 로그인 성공 : 세션으로 인증 정보 공유 후 loginOk.jsp 또는 이전 문서 이동 --%>  
<%-- => 로그인 실패 : 세션으로 아이디와 메세지를 공유 후 memberLogin.jsp 이동 --%>  
<%
	//비정상적인 요청에 대한 응답 처리
	if(request.getMethod().equalsIgnoreCase("GET")) {
		response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		return;
	}

	//입력값을 반환받아 저장
	String id=request.getParameter("id");
	String passwd=Utility.encrypt(request.getParameter("passwd"));

	//DAO 클래스의 메소드를 호출하여 아이디 검사
	MemberDTO member=MemberDAO.getMemberDAO().selectMember(id);
	
	//입력받은 아이디의 회원정보가 없는 경우 - 인증 실패
	if(member==null) {
		session.setAttribute("errorId", id);
		session.setAttribute("errorMessage", "입력 아이디가 존재하지 않습니다.");
		response.sendRedirect("memberLogin.jsp");
		return;
	}
	
	//입력받은 비밀번호가 다른 경우 - 인증 실패
	if(!member.getPasswd().equals(passwd)) {
		session.setAttribute("errorId", id);
		session.setAttribute("errorMessage", "입력 비밀번호가 맞지 않습니다.");
		response.sendRedirect("memberLogin.jsp");
		return;
	}
	
	//인증 성공 - 권한 처리를 위한 인증정보를 세션을 이용하여 공유
	//session.setAttribute("loginId", id);
	session.setAttribute("loginMember", member);
	
	//페이지 이동
	String uri=(String)session.getAttribute("uri");
	if(uri==null) {//이전 페이지가 없는 경우
		response.sendRedirect("loginOk.jsp");
	} else {//이전 페이지가 있는 경우
		response.sendRedirect(uri);
		session.removeAttribute("uri");
	}
%>









