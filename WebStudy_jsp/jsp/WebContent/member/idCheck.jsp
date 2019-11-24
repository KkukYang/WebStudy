<%@page import="com.tjoeun.dao.MemberDAO"%>
<%@page import="com.tjoeun.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- memberJoin.jsp에서 전달된 아이디를 반환받아 중복 유무 확인 후 결과 출력 --%>
<%-- => 아이디가 중복될 경우 아이디를 다시 입력 받아 중복 유무 확인 --%>    
<%-- => 아이디가 중복되지 않을 경우 아이디 사용 가능하도록 설정 후 창닫기 --%>    
<%
	//전달된 아이디를 반환받아 저장
	String id=request.getParameter("id");

	//반환받은 아이디를 member 테이블에서 검색하여 결과를 반환 받아 저장
	// => MemberDAO 클래스의 getMember() 메소드 호출
	// => 반환 결과 : MemberDTO 인스턴스 - 아이디에 대한 회원정보 존재(아이디 중복)
	// => 반환 결과 : null - 아이디에 대한 회원정보 미존재(아이디 미중복)
	MemberDTO member=MemberDAO.getMemberDAO().selectMember(id);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="common.js"></script>
<link rel="stylesheet" type="text/css" href="common.css">
<script type="text/javascript">
function idCheck(form) {
	if(form.id.value=="") {
		alert("중복 확인 하고자 하는 아이디를 입력해 주세요.");
		form.id.focus();
		return;
	}
	
	if(!isID(form.id)) {
		alert("아이디가 적절하지 않습니다.\n영문자와 숫자,특수문자(_)만 사용해 주세요.");
		form.id.focus();
		return;
	}
	
	form.method="post";
	form.action="idCheck.jsp";
	form.submit();
}

function windowClose() {
	//사용 가능한 아이디를 부모창(opener)의 아이디 입력태그에 출력
	opener.join.id.value="<%=id%>";
	
	//부모창의 아이디 사용 가능 여부 확인 폼변수 변경
	opener.join.idCheckResult.value="1";
	
	//현재 창닫기
	window.close();
}
</script>
</head>
<body>
	<% if(member==null) {//아이디가 중복되지 않은 경우 %>
	<table width="100%" height="90%">
		<tr>
			<td align="center" class="t1">
				입력한 [<span style="color:red;"><%=id%></span>]는 사용 가능한 아이디 입니다.<br><br>
			</td>
		</tr>
		<tr>
			<td align="center" valign="bottom">
				<button type="button" onclick="windowClose();">사용</button>
			</td>
		</tr>		
	</table>	
	<% } else {//아이디가 중복될 경우 => 아이디 재검사 %>
	<form name="idCheckForm">
	<table width="100%" height="90%">
		<tr>
			<td align="center" class="t1">
				입력한 [<span style="color:red;"><%=id%></span>]는 이미 사용 중인 아이디 입니다.<br>
				다른 아이디를 입력 후 확인 버튼을 눌러주세요.
			</td>
		</tr>
		<tr>
			<td align="center" valign="bottom">
				<input type="text" name="id" maxlength="13" size="13" class="TXTFELD">
				<button type="button" onclick="idCheck(idCheckForm);">확인</button>
			</td>
		</tr>
	</table>
	</form>
	<% } %>
</body>
</html>



