<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 회원정보를 입력하여 memberJoinAction.jsp로 전달하는 페이지 --%>
<%-- => 아이디 중복 확인을 위한 입력 아이디를 idCheck.jsp로 전달 --%>    
<%-- => 우편번호 및 기본주소는 postSeatch.jsp로 동이름을 이용하여 검색된 결과를 전달받아 입력 --%>
<%-- => 가입취소 버튼을 누른 경우 memberLogin.jsp 이동 --%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입폼</title>
<script type="text/javascript" src="common.js"></script>
<link rel="stylesheet" type="text/css" href="common.css">
<script type="text/javascript">
	window.onload=function(){
		document.join.id.focus();
	}

	//아이디 중복 확인 버튼을 누른 경우 실행되는 이벤트 핸들러
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
		
		//아이디 중복 확인을 위한 새로운 창 생성 및 idCheck.jsp 실행
		var url="idCheck.jsp?id="+form.id.value;
		window.open(url,"아이디중복확인","width=450,height=200,left=450,top=200");
	}
	
	function idCheckInit(form) {
		if(form.idCheckResult.value=="1") {
			form.idCheckResult.value="0";
		}
	}
	
	function submitCheck(form) {
		if (is_null_field(form))
			return false;

		//아이디 중복 유무 검사 미실행 또는 중복 아이디 사용	
		if(form.idCheckResult.value=='0') {
			alert("아이디 중복 유무 검사를 반드시 해주세요.");
			return false;
		}
		
		if (!isID(form.id)) {
			alert("아이디가 적절하지 않습니다.\n영문자와 숫자,특수문자(_)만 사용해 주세요.");
			return false;
		}
		
		if (!isSame(form.passwd1, form.passwd2)) {
			alert("비밀번호와 재입력이 일치하지 않습니다..");
			return false;
		}

		if (!isEmail(form.email)) {
			alert("E-mail 주소가 적절하지 않습니다..");
			return false;
		}
		
		return true;
	}

	function is_null_field(form) {
		if (is_null(form.id.value) || is_space(form.id.value)) {
			alert("아이디를 입력하여 주십시요.");
			form.id.focus();
			return true;
		}

		if (is_null(form.passwd1.value) || is_space(form.passwd1.value)) {
			alert("비밀번호를 입력하여 주십시요.");
			form.passwd1.focus();
			return true;
		}

		if (is_null(form.name.value) || is_space(form.name.value)) {
			alert("이름을 입력하여 주십시요.");
			form.name.focus();
			return true;
		}

		if (is_null(form.email.value) || is_space(form.email.value)) {
			alert("이메일을 입력하여 주십시요.");
			form.email.focus();
			return true;
		}

		if (is_null(form.mobile2.value) || is_space(form.mobile2.value)) {
			alert("핸드폰 번호를 입력하여 주십시요.");
			form.mobile2.focus();
			return true;
		}

		if (is_null(form.mobile3.value) || is_space(form.mobile3.value)) {
			alert("핸드폰 번호를 입력하여 주십시요.");
			form.mobile3.focus();
			return true;
		} 
		
		if (is_null(form.zipcode.value) || is_space(form.zipcode.value)) {
			alert("우편번호를 입력하여 주십시요.");
			form.zipcode.focus();
			return true;
		}
		
		if (is_null(form.address2.value) || is_space(form.address2.value)) {
			alert("상세주소을 입력하여 주십시요.");
			form.address2.focus();
			return true;
		}
	}
	
	//우편번호 검색 버튼을 누른 경우 호출되는 이벤트 핸들러
	function postSearch() {
		var url="postSearch.jsp";
		window.open(url,"우편번호검색","width=800,height=800,left=350,top=50")
	}
</SCRIPT>
</head>
<body>
	<table cellspacing=0 cellpadding=0 border=0>
		<tr>
			<td height=1></td>
		</tr>
		
	</table>


	<form name="join" action="memberJoinAction.jsp" method="POST" onsubmit="return submitCheck(join);">
		<%-- 아이디 사용 가능 여부를 판단하기 위한 폼변수[0:불가능,1:가능] --%>
		<input type="hidden" name="idCheckResult" value="0">
		<table width="500" cellspacing="0" cellpadding="0" align="center">
			<tr bgcolor="#008baf" valign="middle">
				<td height="25" class="t1" align="center"><b>
				<font color="#FFFFFF" size="2">::: 친구로 등록하기 :::</font></b></td>
			</tr>

			<tr>
				<td height="30" class="t1">
					<table width="100%" border="0" cellspacing="0" cellpadding="2">
						<tr>
							<td width="100%" class="t1" align="right"><font	color="#FF0000"><b>*</b></font> 
							<font color="#0000FF">표시부분은 꼭 입력해줘 친구야 !!!</font></td>
						</tr>
					</table>
				</td>
			</tr>



			<tr>
				<td height="20" class="t1">
					<table width="100%" border="1" cellspacing="0">
						<tr>
							<td width="25%" class="t1" bgcolor="#bddee8"><strong>&nbsp;
							<font color="#FF0000"><b>*</b></font>원하는 ID</strong></td>
							<td width="75%" class="t1">&nbsp;
							<input type="text" name="id" title="ID" maxlength="13" size="13" class="TXTFLD" onkeyup="idCheckInit(join);">&nbsp;&nbsp;&nbsp;
							<%-- 아이디 중복 확인을 위한 버튼 생성 및 이벤트 핸들러 등록 --%>
							<button type="button" class="TXTFLD" onclick="idCheck(join);">아이디 중복 확인</button>
							</td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td height="20" class="t1">
					<table width="100%" border="1" cellspacing="0">
						<tr>
							<td width="25%" class="t1" bgcolor="#bddee8"><strong>&nbsp;
							<font color="#FF0000"><b>*</b></font>비밀번호</strong></td>
							<td width="75%" class="t1">&nbsp;
							<input type="password" name="passwd1" maxlength="13" size="13" class="TXTFLD"></td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td height="20" class="t1">
					<table width="100%" border="1" cellspacing="0">
						<tr>
							<td width="25%" class="t1" bgcolor="#bddee8"><strong>&nbsp;
							<font color="#FF0000"><b>*</b></font>비밀번호 확인</strong></td>
							<td width="75%" class="t1">&nbsp;
							<input type="password" name="passwd2" maxlength="13" size="13" class="TXTFLD"></td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td height="20" class="t1">
					<table width="100%" border="1" cellspacing="0">
						<tr>
							<td width="25%" class="t1" bgcolor="#bddee8"><strong>&nbsp;
							<font color="#FF0000"><b>*</b></font>이름</strong></td>
							<td width="75%" class="t1">&nbsp;
							<input type="text" name="name" maxlength="13" size="13" class="TXTFLD"></td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td height="20" class="t1">
					<table width="100%" border="1" cellspacing="0">
						<tr>
							<td width="25%" class="t1" bgcolor="#bddee8"><strong>&nbsp;
							<font color="#FF0000"><b>*</b></font>이메일</strong></td>
							<td width="75%" class="t1">&nbsp;
							<input type="text" name="email" maxlength="30" size="30" class="TXTFLD"></td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td height="20" class="t1">
					<table width="100%" border="1" cellspacing="0">
						<tr>
							<td width="25%" class="t1" bgcolor="#bddee8"><strong>&nbsp;
							<font color="#FF0000"><b>*</b></font>전화번호</strong></td>
							<td width="75%" class="t1">&nbsp;<select name="mobile1"	size="1" class="TXTFLD">
									<option value="010" selected>010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
							</select>&nbsp;-&nbsp; 
							<input type="text" name="mobile2" maxlength="5"	size="5" class="TXTFLD">&nbsp;-&nbsp; 
							<input type="text" name="mobile3" maxlength="5" size="5" class="TXTFLD">
							</td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td height="20" class="t1">
					<table width="100%" border="1" cellspacing="0">
						<tr>
							<td rowspan="2" width="25%" class="t1" bgcolor="#bddee8"><strong>&nbsp;
							<font color="#FF0000"><b>*</b></font>주소</strong></td>
							<td width="25%" class="t1">&nbsp;
							우편번호 <input type="text" name="zipcode" size="10" class="TXTFLD" readonly="readonly">
							&nbsp;&nbsp;<button type="button" class="TXTFLD" onclick="postSearch();">우편번호 검색</button>
							<input type="text" name="address1" maxlength="45" size="45" class="TXTFLD" readonly="readonly">
							</td>
						</tr>
						<tr>	
							<td width="75%" class="t1">
							
							<input type="text" name="address2" maxlength="45" size="45" class="TXTFLD"></td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td height="10" class="t1">
					<table width="100%" border="0" cellspacing="0" cellpadding="2">
						<tr>
							<td width="75%" class="t1">
							</td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td height="30" class="t1" align="center">
					<button type="submit">회원가입</button>
					<button type="reset">다시입력</button>
					<button type="button" onclick="location.href='memberLogin.jsp';">가입취소</button>
				</td>
			</tr>
		</table>
	</form>


	<table cellspacing=0 cellpadding=0 border=0>
		<tr>
			<td height=20></td>
		</tr>
	</table>

</body>
</html>