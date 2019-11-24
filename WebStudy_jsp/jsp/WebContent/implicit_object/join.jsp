<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 회원정보를 입력받아 처리(출력)페이지로 전달하는 JSP 문서 - 입력페이지 --%>
<%-- => form 태그로 전달되는 입력값에 대한 검증처리 후 전달 >> JavaScript(클라이언트) --%>
<%
	String message=request.getParameter("message");
	if(message==null) message="";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>회원가입</h1>
	<hr>
	<%-- form : 값을 입력받아 처리페이지로 전달하는 태그 --%>
	<%-- => 입력태그(input, textarea, select 등)와 전송태그(input, button 등 - submit 기능)가 하위태그로 반드시 선언 --%>
	<%-- action 속성 : 입력태그의 입력값을 전달받기 위한 페이지의 URL 주소를 속성값으로 설정 --%>
	<%-- => 속성을 생략할 경우 현재 요청 URL 주소와 동일한 페이지에 입력값 전달 --%>
	<%-- method 속성 : 요청방식(GET 또는 POST) 둘 중 하나를 속성값 설정 --%>
	<%-- => GET : 입력값을 URL 주소의 QueryString으로 전달하여 페이지 요청 - 소용량과 비보안성 --%>
	<%-- => POST : 입력값을 리퀘스트 메세지의 바디(BODY)로 전달하여 페이지 요청 - 대용량 또는 보안성 --%>
	<%-- => 속성을 생략할 경우 GET 방식 요청으로 처리 --%>
	<%-- enctype 속성 : 값을 전달하기 위한 데이타 형식(MimeType)을 속성값 설정--%>
	<%-- => application/x-www-form-urlencoded : 입력값을 텍스트(인코딩) 값(2Byte)으로 전달 --%>
	<%-- => multipart/form-data : 입력값을 원시값(1Byte)으로 전달 >> 파일 전달 --%>
	<%-- => 속성을 생략할 경우 application/x-www-form-urlencoded 속성값으로 처리 --%>
	<%-- name 속성 : 태그의 이름을 속성값으로 설정 >> JavaScript에서 속성값을 객체로 사용 --%>
	<%-- onsubmit 속성 : 전송태그를 이용하여 입력값이 전송되기 전 실행될 명령을 속성값으로 설정 - 입력값에 대한 유효성 검사 --%>
	<%-- => 이벤트 핸들러 함수가 false를 반환할 경우 미전송, true를 반환할 경우 전송 --%>
	<%-- => onXXX 속성 : 태그에서 이벤트가 발생된 경우 이벤트를 처리할 이벤트 핸들러 명령(JavaScript)를 속성값으로 설정 --%>
	<form name="joinForm" action="join_action.jsp" method="post" onsubmit="return submitCheck();">
		<%-- input : 값을 입력받기 위한 태그 --%>
		<%-- type 속성 : 입력값에 대한 입력방식을 속성값으로 설정 --%>
		<%-- => hidden : 값을 입력받지 않고 value 속성으로 설정된 기본값을 전달 --%>
		<%-- => text : 문자열 입력 --%>
		<%-- => password : 문자열 입력(입력문자를 기호로 변형) --%>
		<%-- => radio : 문자열 목록 중 하나만 선택하여 입력 --%>
		<%-- => checkbox : 문자열 목록 중 여러개 선택하여 입력 --%>
		<%-- name 속성 : 입력값을 전달하기 위한 이름을 속성값으로 설정 --%>
		<%-- value 속성 : 입력태그에 저장될 기본값을 속성값으로 설정 --%>
		<%-- checked 속성 : radio 또는 checkbox 입력에서 미리 선택되도록 설정하는 속성 => 속성값 생략 가능 --%>
		<%-- size 속성 : 입력태그의 출력길이를 속성값으로 설정 --%>
		<%-- maxlength 속성 : 입력태그의 최대 입력 글자수를 속성값으로 설정 --%>
		<input type="hidden" name="keyword" value="홍길동">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="passwd"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<input type="radio" name="gender" value="남자" checked>남자&nbsp;&nbsp;
					<input type="radio" name="gender" value="여자">여자
				</td>
			</tr>
			<tr>
				<td>취미</td>
				<td>
					<input type="checkbox" name="hobby" value="낚시" checked>낚시&nbsp;&nbsp;
					<input type="checkbox" name="hobby" value="등산">등산&nbsp;&nbsp;
					<input type="checkbox" name="hobby" value="게임">게임&nbsp;&nbsp;
					<input type="checkbox" name="hobby" value="독서">독서
				</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>
					<%-- select 태그 : 목록 중 하나를 선택하여 입력하는 태그 --%>
					<%-- option 태그 : 선택 목록을 제공하는 태그 --%>
					<%-- selected 속성 : 목록 중 하나를 미리 선택되도록 설정하는 속성 - 속성값 생략 가능 --%>
					<select name="phone1">
						<option value="010" selected>010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select>
					- <input type="text" name="phone2" size="4" maxlength="4"> 
					- <input type="text" name="phone3" size="4" maxlength="4">
				</td>
			</tr>	
			<tr>
				<td>자기소개</td>
				<td>
					<%-- textarea : 여러 줄의 문자열을 입력받기 위한 태그 --%>
					<%-- => 태그내용이 입력태그의 기본값으로 설정 --%>
					<%-- rows 속성 : 행의 갯수를 속성값으로 설정 --%>
					<%-- cols 속성 : 열의 갯수를 속성값으로 설정 --%>
					<textarea rows="5" cols="50" name="profile"></textarea>
				</td>
			</tr>
			
			<tr>
				<td>
					<%-- input 태그의 type 속성에서 submit 속성값을 설정한 경우 전송기능을 제공하는 버튼 출력 --%>
					<%-- => 버튼을 클릭한 경우 form 태그의 action 속성값으로 설정된 페이지로 입력값을 전달하여 요청 --%>
					<%-- <input type="submit" value="회원가입">	--%>
					
					<%-- button : 버튼을 출력하는 태그 --%>
					<%-- type 속성 : 버튼 기능을 속성값으로 설정 --%>
					<%-- => 속성을 생략할 경우 submit 속성값을 기본값으로 사용 --%>
					<button type="submit">회원가입</button>
					
					<%-- input 태그의 type 속성에서 reset 속성값을 설정한 경우 입력태그의 초기화 기능을 제공하는 버튼 출력 --%>
					<%-- => 버튼을 클릭한 경우 form 태그의 입력태그 입력값이 기본값으로 설정 --%>
					<%-- <input type="reset" value="다시입력"> --%>
					<button type="reset">다시입력</button>
				</td>
			</tr>
		</table>
	</form>
	<hr>
	<div style="color: red;"><%=message %></div>
	
	<%-- JavaScript는 script 태그 안에 작성 --%>
	<%-- => DOM(Document Object Model) 조작을 위해 script 태그는 모든 태그 아래에 작성하는 것을 권장 --%>
	<%-- 
	<script type="text/javascript">
	joinForm.id.focus();
	
	//입력값에 대한 유효성 검사
	function submitCheck() {
		//입력값은 form 태그와 입력태그의 name 속성값을 객체로 하여 value 속성으로 접근 가능
		//입력값 유무에 대한 유효성 검사
		if(joinForm.id.value=="") {//입력값이 없는 경우
			alert("아이디를 반드시 입력해 주세요.");
			joinForm.id.focus();
			return false;	
		}
		
		//입력값에 대한 입력패턴을 이용한 유효성 검사 => 정규표현식 이용
		var idReg=/^[a-zA-Z]\w{5,19}$/g;
		if(!idReg.test(joinForm.id.value)) {
			alert("입력된 아이디가 형식에 맞지 않습니다.");
			joinForm.id.focus();
			return false;
		}
		
		//비밀번호, 이름 등 입력값에 대한 유효성 검사
		
		return true;
	}
	</script>
	--%>
</body>
</html>











