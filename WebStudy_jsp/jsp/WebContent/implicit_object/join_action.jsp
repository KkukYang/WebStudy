<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 입력페이지의 입력값을 전달받아 출력(처리)하는 JSP 문서 >> 출력페이지 --%>
<%
	//request.getMethod() : 클라이언트의 요청방식을 반환하는 메소드
	//클라이언트의 요청이 GET 방식인 경우 => 비정상적인 요청
	if(request.getMethod().equalsIgnoreCase("GET")) {
		//response.sendError(int errorCode) : 클라이언트에게 에러코드를 전달하는 메소드
		// => 에러코드 : 4XX 또는 5XX => HttpServletResponse 인터페이스에 상수필드 표현
		//response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);//405
		
		//response.sendRedirect(String url) : 클라이언트에게 301 응답코드와 URL 주소를
		//전달하는 메소드 - 전달한 URL 주소를 이용하여 페이지를 재요청(리다이렉트 이동)
		// => 브라우저의 주소창의 요청 URL 주소 변경
		//URL 주소에서 ASCII 코드에 대한 문자(기호 제외)를 제외한 다른 문자는 전달 불가능
		// => QueryString으로 한글 전달 불가능
		//String message="비정상적인 방법으로 페이지를 요청 하였습니다.";
		//URLEncoder.encode(String value, String charset) : 문자열을 전달받아 원하는 
		//형태의 캐릭터셋으로 부호화(인코딩)하여 반환하는 메소드
		String message=URLEncoder.encode("비정상적인 방법으로 페이지를 요청 하였습니다.","UTF-8");
		//QueryString를 이용하여 메세지를 이동 페이지에게 전달 => 비권장
		response.sendRedirect("join.jsp?message="+message);
		
		return;
	}

	//POST 방식으로 요청되어 전달된 입력값에 대한 캐릭터셋(문자인코딩) 변경 => 기본 인코딩 : ISO-8859-1(서유럽어)
	//request.setCharacterEncoding(String encoding) : 입력값에 대한 인코딩을 변경하는 메소드
	request.setCharacterEncoding("UTF-8");

	//입력값을 반환받아 저장
	//request.getParameter(String parameterName) : 입력값을 문자열로 반환하는 메소드
	// => parameterName : 입력태그의 name 속성의 속성값으로 설정된 이름 
	String keyword=request.getParameter("keyword");
	String id=request.getParameter("id");
	//전달된 입력값에 대한 검증 처리 - Java(서버)
	if(id==null || id.equals("")) {
		String message=URLEncoder.encode("아이디를 입력해 주세요.","UTF-8");
		response.sendRedirect("join.jsp?message="+message);
		return;
	}
	
	//정규표현식에서 클래스문자는 \\을 이용하여 표현
	String regId="^[a-zA-Z]\\w{5,19}$";
	//Pattern : 정규표현식을 저장하기 위한 클래스
	//Pattern.matches(String regex, String input) : 정규표현식과 입력 문자열의 패턴이 
	//동일한 경우 true를 반환하는 메소드
	if(!Pattern.matches(regId, id)) {
		String message=URLEncoder.encode("아이디를 형식에 맞게 입력해 주세요.","UTF-8");
		response.sendRedirect("join.jsp?message="+message);
		return;
	}
	
	String passwd=request.getParameter("passwd");
	String name=request.getParameter("name");
	String gender=request.getParameter("gender");
	//request.getParameterValues(String parameterName) : 여러 개의 입력값을 문자열 배열로 반환하는 메소드
	// => checkbox 입력태그에서 선택된 목록이 여러개인 경우 같은 parameterName으로 값이 여러개 전달
	String[] hobby=request.getParameterValues("hobby");
	String phone1=request.getParameter("phone1");
	String phone2=request.getParameter("phone2");
	String phone3=request.getParameter("phone3");
	String profile=request.getParameter("profile");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>회원정보 확인</h1>
	<hr>
	<ul>
		<li>keyword = <%=keyword %></li>
		<li>id = <%=id %></li>
		<li>passwd = <%=passwd %></li>
		<li>name = <%=name %></li>
		<li>gender = <%=gender %></li>
		<% if(hobby==null) { %>
		<li>hobby = 선택한 취미가 하나도 없습니다.</li>
		<% } else {  %>
		<li>hobby =
			<% for(String temp:hobby) { %>
				<%=temp %>&nbsp;			
			<% } %>
		</li>	
		<% } %>
		<li>phone = <%=phone1 %> - <%=phone2 %> - <%=phone3 %></li>
		<li>profile = <br><%=profile.replace("\n", "<br>") %></li>
	</ul>	
</body>
</html>