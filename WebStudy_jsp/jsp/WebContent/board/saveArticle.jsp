<%@page import="com.tjoeun.dao.BoardDAO"%>
<%@page import="com.tjoeun.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 페이징 처리 연습을 위해 board 테이블에 게시글을 1000개 저장하는 페이지 --%>
<%
	for(int i=1;i<=1000;i++) {
		BoardDTO article=new BoardDTO();
		int num=BoardDAO.getBoardDAO().getAutoIncrement();
		article.setNum(num);
		article.setRef(num);
		article.setWriter("홍길동");
		article.setSubject("게시글 제목-"+i);
		article.setContent("게시글 내용-"+i);
		article.setPasswd("1234");
		article.setIp("192.168.14.31");
		BoardDAO.getBoardDAO().insertArticle(article);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>게시글 1000개를 성공적으로 저장 하였습니다.</h1>
</body>
</html>