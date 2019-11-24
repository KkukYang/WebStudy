<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 업로더 이름과 파일을 입력받아 처리 페이지로 전달하는 JSP 문서 --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>파일 업로드</h1>
	<hr>
	<%-- 파일을 입력받아 전달하기 위한 form 태그의 작성 규칙 --%>
	<%-- 1.method 속성값은 "post"로 설정 --%>
	<%-- 2.enctype 속성값은 "multipart/form-data"로 설정  --%>
	<%-- => 모든 입력값을 원시데이타로 전달 --%>
	<form action="file_action.jsp" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<td>업로더</td>
			<td><input type="text" name="uploader"></td>
		</tr>
		<tr>
			<td>파일-1</td>
			<td><input type="file" name="fileOne"></td>
		</tr>
		<tr>
			<td>파일-2</td>
			<td><input type="file" name="fileTwo"></td>
		</tr>
		<tr>
			<td colspan="2"><button type="submit">업로드</button></td>
		</tr>
	</table>
	</form>
</body>
</html>








