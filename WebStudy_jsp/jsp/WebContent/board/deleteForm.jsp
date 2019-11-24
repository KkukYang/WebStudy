<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- content.jsp에서 전달된 데이타를 반환받아 저장하고 입력 비밀번호와
같이 deletePro.jsp로 전달하는 페이지 --%>
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
	String search=request.getParameter("search");
	String keyword=request.getParameter("keyword");
 %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판</title>
	<link href="css/style.css" rel="stylesheet" type="text/css">
	<script language="JavaScript">
	function deleteSave(){
		if(document.delForm.passwd.value==''){
			alert("비밀번호를 입력하십시오.");
			document.delForm.passwd.focus();
			return false;
		}
	}
	</script>
</head>

<body bgcolor="#e0ffff">
<center><b>글삭제</b></center>
<br>

<form method="post" name="delForm" action="deletePro.jsp" onsubmit="return deleteSave()">
<input type="hidden" name="num" value="<%=num%>">
<input type="hidden" name="pageNum" value="<%=pageNum%>">
<input type="hidden" name="search" value="<%=search%>">
<input type="hidden" name="keyword" value="<%=keyword%>">
<table border="1" align="center" cellspacing="0" cellpadding="0" width="360">
	<tr height="30">
	<td align="center" bgcolor="#b0e0e6">
	<b>비밀번호를 입력해 주세요.</b></td>
	</tr>
	
	<tr height="30">
	<td align="center">비밀번호 : 
		<input type="password" name="passwd" size="8" maxlength="12">
	</td>
	</tr>
	
	<tr height="30">
	<td align="center" bgcolor="#b0e0e6">
	<input type="submit" value="글삭제">
	<input type="button" value="목록보기" onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>&search=<%=search%>&keyword=<%=keyword%>'">
	</td>
	</tr>
</table>
</form>
</body>
</html>