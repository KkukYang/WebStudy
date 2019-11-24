<%@page import="com.tjoeun.dao.ZipcodeDAO"%>
<%@page import="com.tjoeun.dto.ZipcodeDTO"%>
<%@page import="com.tjoeun.dao.MemberDAO"%>
<%@page import="com.tjoeun.dto.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 동이름을 입력하여 우편번호 및 주소를 zipcode 테이블에서 검색하여 출력하는 페이지 --%>
<%-- => 검색된 주소를 선택한 경우 우편번호와 주소를 회원정보 입력 페이지에 전달 후 창닫기 --%>
<%
	//입력데이타에 대한 인코딩 변경
	//request.setCharacterEncoding("utf-8");

	List<ZipcodeDTO> zipcodeList=null;
	if(request.getParameter("dong")!=null) {
		//입력데이타를 반환받아 저장 => 동이름
		String dong=request.getParameter("dong");

		//동이름에 대한 우편번호 및 주소 목록을 zipcode 테이블에서 검색하여 저장
		// => ZipcodeDAO 클래스의 getZipcodeList() 메소드 호출
		zipcodeList=ZipcodeDAO.getZipcodeDAO().selectZipcodeList(dong);
	}
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="common.css">
<script type="text/javascript">
window.onload=function() {
	postForm.dong.focus();	
}

function searchDong() {
	if(postForm.dong.value=="") {
		alert("동이름을 반드시 입력해 주세요.");
		postForm.dong.focus();	
		return;
	}
	postForm.submit();
}

//우편번호와 주소를 전달받아 부모창의 입력태그에 출력 후 창닫기
function postSendClose(code,addr) {
	opener.join.zipcode.value=code;
	opener.join.address1.value=addr;
	window.close();
}
</script>
</head>
<body>
	<form name="postForm" action="postSearch.jsp" method="post">
	<table align="center">
		<%-- 입력행 => 동이름 입력 --%>
		<tr align="center">
			<td class="t1">
				동이름 : <input type="text" name="dong" class="TXTFLD">
				<button type="button" onclick="searchDong();">주소 검색</button>
			</td>
		</tr>
		
		<%-- 출력행 => 검색된 우편번호 및 주소 목록 출력 --%>
		<%-- 동이름을 입력하지 않은 경우(최초 실행) 출력행이 실행되지 않도록 설정 --%>
		<% if(zipcodeList==null) return; %>
		
		<tr align="center">
			<td>
				<table border="1" cellspacing="0" width="450">
					<tr>
						<th width="80" class="t1">우편번호</th>
						<th width="370" class="t1">주소</th>
					</tr>				
					<%-- 검색 우편번호 및 주소 목록 출력 - 반복문 시작 --%>
					<% for(ZipcodeDTO zipcode:zipcodeList) { %>
					<tr class="t1">
						<td align="center"><%=zipcode.getZipcode()%></td>
						<%-- a 태그에서 javascript 함수를 호출하고자 할 경우 javascript 접두사 사용 --%>
						<td><a href="javascript:postSendClose('<%=zipcode.getZipcode()%>','<%=zipcode.getAddress()%>');">
							<%=zipcode.getAddress()%></a></td>
					</tr>
					<% } %>
					<%-- 반복문 종료 --%>
				</table>
			</td>		
		</tr>
	</table>	
	</form>
</body>
</html>