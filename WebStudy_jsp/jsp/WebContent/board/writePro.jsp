<%@page import="com.tjoeun.dao.BoardDAO"%>
<%@page import="com.tjoeun.dto.BoardDTO"%>O"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- writeForm.jsp에서 전달된 신규글 또는 답글을 반환 받아 board 
테이블에 저장 후 list.jsp로 이동하는 페이지 --%>    
<%
	//비정상적인 요청에 대한 응답 처리
	if(request.getMethod().equals("GET")) {
		response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		return;
	}

	//입력 데이타에 대한 인코딩 변경
	//request.setCharacterEncoding("utf-8");

	//전달 받은 데이타를 반환하여 저장
	int num=Integer.parseInt(request.getParameter("num"));
	int ref=Integer.parseInt(request.getParameter("ref"));
	int reStep=Integer.parseInt(request.getParameter("reStep"));
	int reLevel=Integer.parseInt(request.getParameter("reLevel"));
	String pageNum=request.getParameter("pageNum");
	if(num==0) pageNum="1";//신규글
	
	String writer=request.getParameter("writer");
	String subject=request.getParameter("subject");
	String email=request.getParameter("email");
	//태그 기호를 Escape 문자로 변환 - 스크립트를 입력하는 XSS 공격에 대한 방어
	String content=request.getParameter("content").replace("<", "&lt;").replace(">", "&gt;");
	String passwd=request.getParameter("passwd");
	
	//게시글 작성 클라이언트의 IP 주소를 반환받아 저장
	String ip=request.getRemoteAddr();
	//System.out.println("ip = "+ip);
	
	//board 테이블의 num 컬럼에 저장된 자동 증가값을 반환받아 저장
	int incrementNum=BoardDAO.getBoardDAO().getAutoIncrement();
	
	//BoardDTO 인스턴스 생성 후 필드값 변경
	BoardDTO article=new BoardDTO();
	article.setNum(incrementNum);
	if(num==0) {//신규글
		article.setRef(incrementNum);				
	} else {//답글
		//글그룹에서 부모글의 reStep보다 큰 re_step 컬럼값을 1증가 변경
		BoardDAO.getBoardDAO().setReStepArticle(ref,reStep);
		article.setRef(ref);//ref 컬럼 = 부모글의 ref
		article.setReStep(reStep+1);//re_step 컬럼 = 부모글의 reStep+1
		article.setReLevel(reLevel+1);//re_level 컬럼 = 부모글의 reLevel+1
	}
	article.setWriter(writer);
	article.setSubject(subject);
	article.setEmail(email);
	article.setContent(content);
	article.setPasswd(passwd);
	article.setIp(ip);
	
	//BoardDAO 클래스의 insertArticle() 메소드를 호출하여 board 
	//테이블에 신규글 또는 답글 저장
	BoardDAO.getBoardDAO().insertArticle(article);
	
	//페이지 이동
	response.sendRedirect("list.jsp?pageNum="+pageNum);
%>