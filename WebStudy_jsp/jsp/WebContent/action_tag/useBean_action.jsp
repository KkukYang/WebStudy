<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 입력값을 제공받아 처리하고 응답 페이지로 포워드 이동하는 JSP 문서 - 처리 페이지 --%>    
<%
	if(request.getMethod().equalsIgnoreCase("GET")) {
		response.sendRedirect("no_useBean_form.jsp");
		return;
	}

	//리퀘스트 메세지로 전달되는 입력값에 대한 캐릭터셋의 인코딩 변경
	//request.setCharacterEncoding("UTF-8");  
%>
<%-- useBean : 클래스로 객체를 제공하는 ActionTag --%>
<%-- => 객체를 생성하여 공유하거나 공유객체를 반환받아 제공 --%>
<%-- id 속성 : 공유속성명을 속성값으로 설정 --%>
<%-- class 속성 : 객체를 생성하기 위한 클래스를 속성값으로 설정 --%>
<%-- scope 속성 : 객체 공유범위를 속성값으로 설정 >> 기본값 : page --%>
<jsp:useBean id="hewon" class="com.tjoeun.bean.Hewon" scope="request"/>

<%-- setProperty : 공유객체의 필드값을 Setter 메소드를 호출하여 변경하는 메소드 --%>
<%-- => 입력태그의 name 속성값과 같은 이름의 필드에 입력값을 전달받아 자동 변경 --%>
<%-- => JavaBean 클래스을 규칙대로 작성하지 않은 경우 입력값 미저장 --%>
<%-- 
<jsp:setProperty name="hewon" property="name"/>
<jsp:setProperty name="hewon" property="phone"/>
<jsp:setProperty name="hewon" property="address"/>
--%>
<%-- 입력값을 모두 전달받아 같은 이름의 필드에 자동 저장 --%>
<jsp:setProperty name="hewon" property="*"/>

<jsp:forward page="useBean_print.jsp"/>
