<%@page import="com.tjoeun.dao.MemberDAO"%>
<%@page import="com.tjoeun.dto.MemberDTO"%>
<%@page import="com.tjoeun.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 회원정보를 전달받아 MEMBER 테이블에 저장 후 로그인 입력 페이지(memberLogin.jsp)로
이동하는 JSP 문서 --%>    
<%
	//비정상적인 요청에 대한 응답 처리
	if(request.getMethod().equalsIgnoreCase("GET")) {
		response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		return;
	}

	//입력값에 대한 캐릭터셋 인코딩 변경 - 인코딩 필터 사용시 생략 가능
	//request.setCharacterEncoding("UTF-8");

	//입력값을 반환받아 저장 >> 유효성 검사
	String id=request.getParameter("id");
	//입력된 비밀번호는 암호화 처리하여 저장
	String passwd=Utility.encrypt(request.getParameter("passwd1"));
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String mobile=request.getParameter("mobile1")+"-"
			+request.getParameter("mobile2")+"-"+request.getParameter("mobile3");
	String zipcode=request.getParameter("zipcode");
	String address1=request.getParameter("address1");
	String address2=request.getParameter("address2");
	
	//DTO 인스턴스 생성 후 입력값을 이용하여 필드값 변경
	MemberDTO member=new MemberDTO();
	member.setId(id);
	member.setPasswd(passwd);
	member.setName(name);
	member.setEmail(email);
	member.setMobile(mobile);
	member.setZipcode(zipcode);
	member.setAddress1(address1);
	member.setAddress2(address2);
	
	//DAO 클래스의 메소드를 호출하여 테이블에 저장 처리
	MemberDAO.getMemberDAO().insertMember(member);
	
	//페이지 이동
	response.sendRedirect("memberLogin.jsp");
%>
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 