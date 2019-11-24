<%@page import="com.tjoeun.dao.BoardDAO"%>
<%@page import="com.tjoeun.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- list.jsp에서 전달된 데이타를 반환받아 board 테이블에 저장된 
글번호의 게시글을 검색하여 출력하는 페이지  --%>
<%-- => 답글쓰기 버튼을 누른 경우 writeForm.jsp 이동 --%>    
<%-- => 글수정 버튼을 누른 경우 updateForm.jsp 이동 --%>    
<%-- => 글삭제 버튼을 누른 경우 deleteForm.jsp 이동 --%>    
<%-- => 글목록 버튼을 누른 경우 list.jsp 이동 --%>
<%
	//비정상적인 요청에 대한 응답 처리
	if(request.getParameter("num")==null) {
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}

	//입력데이타에 대한 인코딩 변경
	//request.setCharacterEncoding("utf-8");

	//list.jsp에서 전달된 데이타를 반환받아 저장
	int num=Integer.parseInt(request.getParameter("num"));
	String pageNum=request.getParameter("pageNum");
	String number=request.getParameter("number");
	String search=request.getParameter("search");
	String keyword=request.getParameter("keyword");
	
	//board 테이블에 저장된 게시글 중 글번호에 해당하는 게시글을 검색하여 저장
	// => BoardDAO 클래스의 getArticle() 메소드 호출
	BoardDTO article=BoardDAO.getBoardDAO().getArticle(num);
	
	if(article==null) {
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}
	
	//board 테이블에 저장된 게시글 중 글번호에 해당하는 게시글의 조횟수 증가
	// => BoardBAO 클래스의 updateReadCount() 메소드 호출
	BoardDAO.getBoardDAO().updateReadCount(num);	
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="#e0ffff">
<center><b>글내용 보기</b></center><br>

<table width="500" border="1" cellspacing="0" cellpadding="2" bgcolor="#e0ffff" align="center">
	<tr height="30">
	<td width="125" bgcolor="#b0e0e6" align="center">글번호</td>
	<td width="125" align="center"> <%=number %> </td>
	<td width="125" bgcolor="#b0e0e6" align="center">조회수</td>
	<td width="125" align="center"> <%=article.getReadCount()+1 %> </td>
	</tr>
	
	<tr height="30">
	<td width="125" bgcolor="#b0e0e6" align="center">작성자</td>
	<td width="125" align="center"> <%=article.getWriter() %> </td>
	<td width="125" bgcolor="#b0e0e6" align="center">작성일</td>
	<td width="125" align="center"> <%=article.getRegDate().substring(0, 10) %> </td>
	</tr>
	
	<tr height="30">
	<td width="125" bgcolor="#b0e0e6" align="center">글제목</td>
	<td width="375" align="left" colspan="3"><%=article.getSubject() %></td>
	</tr>
	
	<tr height="100">
	<td width="125" bgcolor="#b0e0e6" align="center">글내용</td>
	<td width="375" align="left" colspan="3"><pre><%=article.getContent() %></pre></td>
	</tr>
	
	<tr height="30">
	<td colspan="4" bgcolor="#b0e0e6" align="right">
	<input type="button" value="글수정" onclick="document.location.href='updateForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>&number=<%=number%>&search=<%=search%>&keyword=<%=keyword%>'">
	&nbsp;&nbsp;&nbsp;
	
	<input type="button" value="글삭제" onclick="document.location.href='deleteForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>&search=<%=search%>&keyword=<%=keyword%>'">
	&nbsp;&nbsp;&nbsp;
	
	<input type="button" value="답글쓰기" onclick="document.location.href='writeForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>&ref=<%=article.getRef()%>&reStep=<%=article.getReStep()%>&reLevel=<%=article.getReLevel()%>'">
	&nbsp;&nbsp;&nbsp;
	
	<input type="button" value="글목록" onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>&search=<%=search%>&keyword=<%=keyword%>'">
	</td>
	</tr>
	
</table>
</body>
</html>