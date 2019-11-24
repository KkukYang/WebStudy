<%@page import="com.tjoeun.dao.BoardDAO"%>
<%@page import="com.tjoeun.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- deleteForm.jsp에서 전달된 데이타를 반환받아 board 테이블에 저장된
해당 게시글을 삭제 후 list.jsp로 이동하는 페이지 --%>    
<%-- => 해당 게시글의 remove 컬럼값을 1로 변경 --%>    
<%-- => 해당 게시글의 비밀번호가 맞지 않으로 deleteForm.jsp로 이동 --%>    
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
	String search=request.getParameter("search");
	String keyword=request.getParameter("keyword");
	String passwd=request.getParameter("passwd");
	
	//board 테이블에 저장된 게시글 중 글번호에 해당하는 게시글을 검색하여 저장
	// => BoardDAO 클래스의 getArticle() 메소드 호출
	BoardDTO article=BoardDAO.getBoardDAO().getArticle(num);
	
	//해당 게시글의 비밀번호와 입력 비밀번호가 틀린 경우
	if(!article.getPasswd().equals(passwd)) {
%>
	<script type="text/javascript">
		alert("입력한 비밀번호가 맞지 않습니다.");
		history.back();
	</script>	
<%		
		return;
	}
	
	//board 테이블에 저장된 해당 글번호의 게시글의 remove 컬럼값을 1로 변경
	// => BoardDAO 클래스의 deleteArticle() 메소드 호출
	BoardDAO.getBoardDAO().deleteArticle(num);

	//페이지 이동
%>
<script type="text/javascript">
	location.href="list.jsp?pageNum=<%=pageNum%>&search=<%=search%>&keyword=<%=keyword%>";
</script>






