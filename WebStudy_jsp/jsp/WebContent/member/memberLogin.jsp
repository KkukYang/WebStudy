<%@page import="com.tjoeun.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 미로그인 사용자 : 아이디와 비밀번호를 입력하여 memberLoginAction.jsp로 전달하는 페이지 --%>
<%-- => memberLoginAction.jsp에서 로그인 실패한 경우 아이디와 메세지를 세션에게 반환받아 출력 --%>
<%-- => 회원가입 버튼을 누른 경우 memberJoin.jsp로 이동 --%>    
<%-- 로그인 사용자 : 환영메세지 출력 --%>
<%-- => 마이페이지 링크를 누른 경우 loginOk.jsp로 이동 --%>
<%-- => 로그아웃 버튼을 누른 경우 memberLogoutAction.jsp로 이동 --%>
<%
	//세션에 저장되어 공유된 인증 정보(MemberDTO 인스턴스)를 반환받아 저장
	// => 미로그인 사용자는 null 저장
	MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");

	//로그인 실패시 세션에 저장되어 공유된 아이디와 메세지를 반환받아 저장
	String errorId=(String)session.getAttribute("errorId");
	String errorMessage=(String)session.getAttribute("errorMessage");
	
	if(errorId==null) { //memberLogin.jsp를 실행한 경우
		errorId="";
	} else { //memberLoginAction.jsp에서 로그인 실패로 실행한 경우
		session.removeAttribute("errorId");
	}
	
	if(errorMessage==null) { //memberLogin.jsp를 실행한 경우
		errorMessage="";
	} else { //memberLoginAction.jsp에서 로그인 실패로 실행한 경우
		session.removeAttribute("errorMessage");
	}
%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<% if(loginMember==null) { %>
<title>로그인폼</title>
<% } else { %>
<title>내정보</title>
<% } %>
<link rel="stylesheet" type="text/css" href="common.css">
<script type="text/javascript">
	window.onload=function(){
		loginForm.id.focus();
	}

	function loginCheck(form) {
		if (form.id.value=="") {
			alert("아이디를 입력하여 주십시요.");
			form.id.focus();
			return;
		}

		if (form.passwd.value=="") {
			alert("비밀번호를 입력하여 주십시요.");
			form.passwd.focus();
			return;
		}
		form.method="post";
		form.action="memberLoginAction.jsp";
		form.submit();
	}
</SCRIPT>
</head>
<body>
	<table cellspacing=0 cellpadding=0 border=0>
		<tr>
			<td height=1></td>
		</tr>
	</table>

<% if(loginMember==null) {//미로그인 사용자 %>
	<form name="loginForm">
		<table width="300" cellspacing="0" cellpadding="0" align="center">
			<tr bgcolor="#008baf" valign="middle">
				<td height="25" class="t1" align="center"><b>
				<font color="#FFFFFF" size="2">::: 로그인 하기 :::</font></b></td>
			</tr>

			<tr>
				<td height="1" background="./images/line.gif" bgcolor="e5e5e5">
				<img src="./images/blank.gif" width="10" height="1"></td>
			</tr>

			<tr>
				<td height="20" class="t1">
					<table width="100%" border="1" cellspacing="0">
						<tr>
							<td width="40%" class="t1" bgcolor="#bddee8" align="center">
								아이디
							</td>
							<td width="60%" class="t1" align="center">
								<input type="text" name="id" title="ID" value="<%=errorId%>"
									maxlength="13" size="13" class="TXTFLD" >
							</td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td height="20" class="t1">
					<table width="100%" border="1" cellspacing="0">
						<tr>
							<td width="40%" class="t1" bgcolor="#bddee8" align="center">
								비밀번호
							</td>
							<td width="60%" class="t1" align="center">
								<input type="password" name="passwd" 
									maxlength="13" size="13" class="TXTFLD">
							</td>
						</tr>
					</table>
				</td>
			</tr>


			<tr>
				<td height="30" class="t1" align="center">
					<input type="button" value="로그인" onclick="loginCheck(loginForm);"> &nbsp;
					<input type="reset" value="입력초기화"> &nbsp;
					<input type="button" value="회원가입" onclick="location.href='memberJoin.jsp';">
				</td>
			</tr>

			<tr>
				<td height="1" background="./images/line.gif">
				<img src="./images/blank.gif" width="10" height="1"></td>
			</tr>

		</table>
	</form>
<% } else {//로그인 사용자 %>
	<table width="300" cellspacing="0"  cellpadding="0" align="center">
			<tr bgcolor="#008baf" valign="middle">
				<td height="25" class="t1" align="center"><b>
				<font color="#FFFFFF" size="2">::: 내정보 :::</font></b></td>
			</tr>

			<tr>
				<td height="1" background="./images/line.gif" bgcolor="e5e5e5">
				<img src="./images/blank.gif" width="10" height="1"></td>
			</tr>

			<tr>
				<td height="20" class="t1">
					<table width="100%" border="1" cellspacing="0">
						<tr>
							<td width="40%" class="t1" bgcolor="#bddee8" align="center">
								<%=loginMember.getName() %>님 환영합니다.&nbsp;
								<a href="loginOk.jsp">마이페이지</a>&nbsp;&nbsp;
								<button type="button" class="TXTFLD" onclick="location.href='memberLogoutAction.jsp';">로그아웃</button>							
							</td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td height="1" background="./images/line.gif">
				<img src="./images/blank.gif" width="10" height="1"></td>
			</tr>

		</table>
<% } %>
	<table cellspacing=0 cellpadding=0 border=0 align="center">
		<tr>
			<td height=20 class="t1" style="color:red;"><%=errorMessage%></td>
		</tr>
	</table>

</body>
</html>