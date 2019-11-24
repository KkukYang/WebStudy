<%@page import="java.net.URLEncoder"%>
<%@page import="com.tjoeun.dao.BoardDAO"%>
<%@page import="com.tjoeun.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- updateForm.jsp에서 전달된 변경데이타를 반환받아 board 테이블에
저장된 게시글 변경 후 content.jsp로 이동하는 페이지  --%>
<%-- => 전달된 비밀번호가 게시글의 비밀번호와 같은 경우 게시글 변경 후 content.jsp로 이동 --%>    
<%-- => 전달된 비밀번호가 게시글의 비밀번호와 틀린 경우 에러메세지 출력 후 updateForm.jsp로 이동 --%>
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
	String pageNum=request.getParameter("pageNum");
	String number=request.getParameter("number");
	String search=request.getParameter("search");
	String keyword=request.getParameter("keyword");
	
	String writer=request.getParameter("writer");
	String subject=request.getParameter("subject");
	String email=request.getParameter("email");
	String content=request.getParameter("content");
	String passwd=request.getParameter("passwd");	
	
	//BoardDTO 인스턴스 생성 후 필드값 변경
	BoardDTO article=new BoardDTO();
	article.setNum(num);
	article.setWriter(writer);
	article.setSubject(subject);
	article.setEmail(email);
	article.setContent(content);
	article.setPasswd(passwd);
	
	//board 테이블에 저장된 기존 게시글을 변경
	// => BoardDAO 클래스의 updateArticle() 메소드 호출
	int rows=BoardDAO.getBoardDAO().updateArticle(article);
	
	keyword=URLEncoder.encode(keyword,"utf-8");
	if(rows>0) {//게시글 변경 성공 
		response.sendRedirect("content.jsp?num="+num+"&pageNum="+pageNum
			+"&number="+number+"&search="+search+"&keyword="+keyword);
	} else {//게시글 변경 실패 => 입력 비밀번호가 다른 경우
		session.setAttribute("errorMessage", "입력된 비밀번호가 맞지 않습니다.");	
		response.sendRedirect("updateForm.jsp?num="+num+"&pageNum="+pageNum
			+"&number="+number+"&search="+search+"&keyword="+keyword);
	}
%>    





