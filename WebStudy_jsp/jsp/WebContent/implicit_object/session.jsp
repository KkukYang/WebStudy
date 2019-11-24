<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>세션(Session)</h1>
	<hr>
	<p>세션 : 클라이언트와 서버의 연결에 대한 지속성을 구현하기 위해 필요한 
	정보(객체)를 서버에 저장하는 방법</p>
	<p>로그인 인증 정보를 세션에 저장하여 권한 설정</p>
	<p>세션 바인딩 : 세션 고유값과 클라이언트에서 전달된 JSESSIONID 쿠키값을 비교하여
	같은 세션을 찾아 연결하는 작업</p>	
	<p>JSESSIONID 쿠키값이 없거나 JSESSIONID 쿠키값과 같은 고유값의 세션이 없는 경우
	세션을 생성하여 세션 바인딩 - 생성된 세션 고유값을 JSESSIONID라는 이름의 쿠키로 전달</p>
	<p>JSESSIONID 쿠키값은 브라우저가 종료되면 소멸되어 지속적이 바인딩이 불가능하며
	세션을 지속시간(기본값 : 30분)동안 사용하지 않을 경우 세션 자동 소멸</p>
	<hr>
	<% if(session.isNew()) { %>
		<p>세션을 생성하여 바인딩 처리</p>
	<% } else { %>
		<p>세션을 트렉킹하여 바인딩 처리</p>
	<% } %>
	<p>세션 아이디 = <%=session.getId() %></p>
	<p>세션 생성시간 = <%=session.getCreationTime() %></p>
	<p>세션 지속시간 = <%=session.getMaxInactiveInterval() %></p>
</body>
</html>














