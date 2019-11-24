<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>메인 페이지 입니다.</h2>

<%-- 현재 JSP 문서를 기준으로 리소스 파일 경로 표현 --%>
<%-- => 템플릿 페이지를 이용할 경우 요청 JSP 문서(index.jsp)를 기준 --%>
<%-- => 템플릿 페이지와 현재 JSP 문서의 위치가 다르기 때문에 리소스 파일에 대한 404 오류 발생 --%>
<%-- <img src="../images/penguin.jpg" width="200"> --%>

<%-- 템플릿 페이지를 기준으로 리소스 파일 경로 표현 --%>
<%-- <img src="images/penguin.jpg" width="200"> --%>

<%-- 템플릿 사이트로 구현할 경우 리소스 파일은 절대경로로 표현하는 것을 권장 --%>
<%-- <img src="/jsp/action_tag/site/images/penguin.jpg" width="200"> --%>
<%-- 컨텍스트 이름을 변경될 수 있으므로 컨텍스트 이름은 반환받아 사용 --%>
<img src="<%=request.getContextPath() %>/action_tag/site/images/penguin.jpg" width="200">