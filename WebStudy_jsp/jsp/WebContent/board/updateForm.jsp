<%@page import="com.tjoeun.dao.BoardDAO"%>
<%@page import="com.tjoeun.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- content.jsp에서 전달된 데이타를 반환받아 board 테이블에 저장된
글번호 게시글을 검색하여 입력태그에 출력 후 변경 데이타를 updatePro.jsp로 전달하는 페이지 --%>
<%
	//비정상적인 요청에 대한 응답 처리
	if(request.getParameter("num")==null) {
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}

	//입력데이타에 대한 인코딩 변경
	request.setCharacterEncoding("utf-8");

	//content.jsp에서 전달된 데이타를 반환받아 저장
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
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="js/script.js"></script>
</head>

<body bgcolor="#e0ffff">
<center><b>글수정</b></center>
<br>
<form method="post" name="writeform" action="updatePro.jsp" onsubmit="return writeSave()">
<input type="hidden" name="num" value="<%=article.getNum()%>">
<input type="hidden" name="pageNum" value="<%=pageNum%>">
<input type="hidden" name="number" value="<%=number%>">
<input type="hidden" name="search" value="<%=search%>">
<input type="hidden" name="keyword" value="<%=keyword%>">
<table width="400" border="1" cellspacing="0" cellpadding="0" bgcolor="#e0ffff" align="center">
	<tr>
	<td width="70" bgcolor="#b0e0e6" align="center">이름</td>
	
	<td align="left" width="330">
		<input type="text" size="10" maxlength="10" name="writer" value="<%=article.getWriter()%>">
	</td>
	</tr>
	
	<tr>
	<td width="70" bgcolor="#b0e0e6" align="center">제목</td>
	<td align="left" width="330">
		<input type="text" size="40" maxlength="50" name="subject" value="<%=article.getSubject()%>">
	</td>
	</tr>
	
	<tr>
	<td width="70" bgcolor="#b0e0e6" align="center">이메일</td>
	<td align="left" width="330">
		<% if(article.getEmail()==null) { %>
		<input type="text" size="40" maxlength="50" name="email">
		<% } else { %>
		<input type="text" size="40" maxlength="50" name="email" value="<%=article.getEmail()%>">
		<% } %>
	</td>
	</tr>

	<tr>
	<td width="70" bgcolor="#b0e0e6" align="center">내용</td>
	<td align="left" width="330">
		<textarea name="content" rows="13" cols="40"><%=article.getContent()%></textarea>
	</td>
	</tr>
	
	<tr>
	<td width="70" bgcolor="#b0e0e6" align="center">비밀번호</td>
	<td align="left" width="330">
		<input type="password" size="8" maxlength="12" name="passwd">
	</td>
	</tr>
	
	<tr>
	<td colspan=2 bgcolor="#b0e0e6" align="center">
	<input type="submit" value="글수정">
	<input type="reset" value="다시작성">
	<input type="button" value="목록보기" onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>&search=<%=search%>&keyword=<%=keyword%>'">
	</td>
	</tr>
</table>
</form>
<%
	String errorMessage=(String)session.getAttribute("errorMessage");
	if(errorMessage==null) {
		errorMessage="";
	} else {
		session.removeAttribute("errorMessage");
	}
%>
<table width="400" align="center">
	<tr align="center">
		<td style="color: red;"><%=errorMessage %></td>
	</tr>
</table>	
</body>
</html>