<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 신규글 또는 답글을 입력하여 writePro.jsp로 전달하기 위한 페이지 --%>    
<%-- => 신규글 : list.jsp에서 이동 - 전달되는 데이타가 없다. --%>
<%-- => 답글 : content.jsp에서 이동 - 부모글의 데이타가 전달된다. --%>
<%
	//답글 관련 데이타를 저장하기 위한 변수 선언 및 초기화
	int num=0,ref=0,reStep=0,reLevel=0;

	//답글인 경우 content.jsp에서 전달된 부모글 데이타를 반환받아 저장
	// => 신규글인 경우 초기값 저장
	if(request.getParameter("num")!=null) { //답글인 경우
		num=Integer.parseInt(request.getParameter("num"));
		ref=Integer.parseInt(request.getParameter("ref"));
		reStep=Integer.parseInt(request.getParameter("reStep"));
		reLevel=Integer.parseInt(request.getParameter("reLevel"));
	}
	
	//list.jsp 또는 content.jsp에서 전달된 출력 페이지 번호를 반환
	//받아 저장 => 사용자 편의성을 제공하기 위한 데이타
	String pageNum=request.getParameter("pageNum");
	if(pageNum==null) pageNum="1";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script language="JavaScript" src="js/script.js">
</script>
</head>
<body bgcolor="#e0ffff">

<center><b>
<% if(num==0) {//신규글 %>
	글쓰기 
<% } else { //답글 %>
	답글쓰기	
<% } %>
</b><br></center>

<form method="post" name="writeform" action="writePro.jsp" onsubmit="return writeSave()">
<%-- 부모글에 전달받아 저장한 데이타를 writePro.jsp로 전달 --%>
<input type="hidden" name="num" value="<%=num%>">
<input type="hidden" name="ref" value="<%=ref%>">
<input type="hidden" name="reStep" value="<%=reStep%>">
<input type="hidden" name="reLevel" value="<%=reLevel%>">
<input type="hidden" name="pageNum" value="<%=pageNum%>">
<table width="400" border="1" cellspacing="0" cellpadding="3" bgcolor="#e0ffff" align="center">
	<tr>
	<td align="right" colspan="2" bgcolor="#b0e0e6">
	<input type="button" value="목록보기" OnClick="window.location='list.jsp?pageNum=<%=pageNum%>'">
	</td>
	</tr>
	
	
	<!-- 이름 -->
	<tr>
	<td width="80" bgcolor="#b0e0e6" align="center">이 름</td>
	<td width="320">
		<input type="text" size="10" maxlength="10" name="writer">
	</td>
	</tr>
	
	<!-- 글제목 -->
	<tr>
	<td width="80" bgcolor="#b0e0e6" align="center">제 목</td>
	<td width="320">
		<input type="text" size="40" maxlength="50" name="subject">
	</td>
	</tr>
	
	<!-- 이메일 -->
	<tr>
	<td width="80" bgcolor="#b0e0e6" align="center">Email</td>
	<td width="320">
		<input type="text" size="40" maxlength="30" name="email">
	</td>
	</tr>

	<!-- 글내용 -->
	<tr>
	<td width="80" bgcolor="#b0e0e6" align="center">내 용</td>
	<td width="320">
		<textArea name="content" rows="13" cols="40" ></textArea>
	</td>
	</tr>
	
	<!-- 비밀번호 -->
	<tr>
	<td width="80" bgcolor="#b0e0e6" align="center">비밀번호</td>
	<td width="320">
		<input type="password" size="8" maxlength="12" name="passwd">
	</td>
	</tr>
	
	<tr>
	<td colspan=2 bgcolor="#b0e0e6" align="center">
	<input type="submit" value="글쓰기">
	<input type="reset" value="다시작성">
	
	</td>
	</tr>
</table>
</form>

</body>
</html>