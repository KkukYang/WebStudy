<%@page import="com.tjoeun.dao.BoardDAO"%>
<%@page import="com.tjoeun.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- board 테이블에 저장된 게시글 목록을 검색하여 출력하는 페이지 --%>
<%-- => 페이징 처리 : 게시글 목록을 원하는 갯수만큼 검색하여 출력 --%>
<%-- => 글쓰기 버튼을 누른 경우 writeForm.jsp(신규글 쓰기)로 이동 --%>    
<%-- => 제목을 누른 경우 content.jsp(상세 게시글 보기)로 이동 --%>
<%-- => 원하는 게시글 출력에 대한 검색 기능 구현 --%>
<%
	//입력 데이타에 대한 인코딩 변경
	request.setCharacterEncoding("utf-8");

	//입력된 검색 메뉴 및 키워드를 반환받아 저장
	String search=request.getParameter("search");
	if(search==null) search="";
	String keyword=request.getParameter("keyword");
	if(keyword==null) keyword="";

	//출력 페이지 번호를 저장하기 위한 변수 선언 및 초기화
	int pageNum=1;
	
	//출력 페이지 번호를 전달 받은 경우 반환 받아 저장
	if(request.getParameter("pageNum")!=null) {
		pageNum=Integer.parseInt(request.getParameter("pageNum"));
	}
	
	//페이지에 출력될 게시글의 갯수를 저장하기 위한 변수 선언 및 초기화
	int pageSize=10;
	
	//board 테이블에 저장된 전체 게시글에 갯수를 저장하기 위한 변수 선언
	//(board 테이블에 저장된 검색 게시글에 갯수를 저장하기 위한 변수 선언)
	// => BoardDAO 클래스의 getTotalArticle() 메소드를 호출하여 반환받아 저장
	int totalArticle=BoardDAO.getBoardDAO().getTotalArticle(search,keyword);

	//페이지 갯수를 저장하기 위한 변수 선언
	// => 페이지갯수=게시글갯수/페이지글갯수+(게시글갯수%페이지글갯수==0?0:1)
	//int totalPage=totalArticle/pageSize+(totalArticle%pageSize==0?0:1);
	int totalPage=(int)(Math.ceil((double)totalArticle/pageSize));
	
	//전달된 출력 페이지 번호에 대한 유효성 검사
	// => 전달된 출력 페이지 번호가 잘못된 경우 첫번째 페이지 출력
	if(pageNum<=0 || pageNum>totalPage) {
		pageNum=1;
	}
	
	//페이지에 출력될 게시글의 시작 행번호를 저장하기 위한 변수 선언
	// => 시작행번호=(페이지번호-1)*페이지글갯수+1
	int startRow=(pageNum-1)*pageSize+1;//1:1 2:11 3:21 4:31 5:41 ...
	
	//페이지에 출력될 게시글의 마지막 행번호를 저장하기 위한 변수 선언
	// => 마지막행번호=페이지번호*페이지글갯수
	// => 마지막 페이지의 마지막 행번호는 전체 게시글 갯수 저장
	int endRow=pageNum*pageSize;//1:10 2:20 3:30 4:40 5:50 ...
	
	if(endRow>totalArticle) {
		endRow=totalArticle;
	}
	
	//board 테이블에서 시작 행부터 마지막 행의 게시글 목록을 검색하여 반환받아 저장
	//(board 테이블에서 검색 게시글의 시작 행부터 마지막 행의 게시글 목록을 검색하여 반환받아 저장)
	
	// => BoardDAO 클래스의 getArticleList() 메소드 호출
	List<BoardDTO> articleList
		=BoardDAO.getBoardDAO().getArticleList(startRow, endRow, search, keyword);
	
	//페이지에 출력될 게시글의 출력글번호의 시작값을 저장하기 위한 변수 선언
	// => 출력글번호시작값=전체게시글갯수-(페이지번호-1)*페이지글갯수
	int number=totalArticle-(pageNum-1)*pageSize;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/list.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#e0ffff">
<p align="center">
<% if(search.equals("")) { %>
	<b>글목록(전체글:<%=totalArticle %>)</b>
<% } else { %>
	<b>글목록(검색글:<%=totalArticle %>)</b>
<% } %>	
</p>
<table width="700" align="center">
<tr align="right" height="30">
<td align="right" bgcolor="#b0e0e6">
	<input type="button" value="글쓰기" 
		onclick="location.href='writeForm.jsp?pageNum=<%=pageNum%>'">
	<% if(!search.equals("")) { %>
	<input type="button" value="전체글" onclick="location.href='list.jsp';">
	<% } %>
</td>
</tr>
</table>

<table border="1" width="700" cellspacing="0" cellpadding="1" align="center">
	<tr height="30" bgcolor="#5f9ea0">
	<td align="center" width="50">번 호</td>
	<td align="center" width="250">제 목</td>
	<td align="center" width="100">작성자</td>
	<td align="center" width="150">작성일</td>
	<td align="center" width="50">조 회</td>
	<td align="center" width="100">IP</td>
	</tr>
<% if(totalArticle==0) { //검색된 게시글이 없는 경우 %>
	<tr height="30">
		<td align="center" colspan="6">
			검색된 게시글이 존재하지 않습니다.
		</td>
	</tr>
<% } else { //검색된 게시글이 있는 경우 %>
	<%-- 검색된 게시글 출력 => 반복문 시작 --%>
	<% for(BoardDTO article:articleList) { %>	
	<tr height="30">
	<%-- 글번호 출력 --%>
	<td align="center" width="50"><%=number %></td>
	
	<% if(article.getRemove()==0) {//게시글이 삭제되지 않은 경우 %>
	<%-- 제목 출력 => content.jsp 페이지 링크 --%>
	<td width="250">
	<%--답글인 경우 공백 이미지 및 답글 이미지 출력 --%>
	<% if(article.getReLevel()!=0) { //답글인 경우 - getReStep() 메소드 이용 가능 %>
	<img src="images/level.gif" width="<%=article.getReLevel()*10%>" height="16">
	<img src="images/re.gif" height="16">	
	<% } %>
	<a href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>&number=<%=number%>&search=<%=search%>&keyword=<%=keyword%>">
	<%=article.getSubject() %></a>
	<%-- 조횟수가 50 이상인 경우 핫이미지 출력 --%>
	<% if(article.getReadCount()>=50) { %>
	<img src="images/hot.gif" height="16">
	<% } %>
	</td>

	<%-- 작성자 출력 => 메일 전송 프로그램 링크 --%>
	<td align="center" width="100">
	<% if(article.getEmail()!=null) { %>
	<a href="mailto:<%=article.getEmail()%>"><%=article.getWriter() %></a>
	<% } else { %>
	<%=article.getWriter() %>
	<% } %>
	</td>
	
	<%-- 작성일자 출력 --%>
	<td align="center" width="150"><%=article.getRegDate() %></td>
	
	<%-- 조횟수 출력 --%>
	<td align="center" width="50"><%=article.getReadCount() %></td>
	
	<%-- IP 주소 출력 --%>
	<td align="center" width="100"><%=article.getIp() %></td>
	<% } else { //게시글이 삭제 되었을 경우 %>
	<td width="250">
	<% if(article.getReLevel()!=0) { %>
	<img src="images/level.gif" width="<%=article.getReLevel()*10%>" height="16">
	<img src="images/re.gif" height="16">	
	<% } %>
	삭제된 게시글 입니다.
	</td>
	<td align="center" width="100">&nbsp;</td>
	<td align="center" width="150">&nbsp;</td>
	<td align="center" width="50">&nbsp;</td>
	<td align="center" width="100">&nbsp;</td>
	<% } %>
	</tr>
	<% number--; %>
	<% } %>
	<%-- 반복문 종료 --%>
<% } %>	
</table>

<%-- 페이지 번호 출력 및 링크 --%>
<%
	//페이지블럭에 출력될 페이지의 갯수를 저장할 변수 선언 및 초기화
	int blockSize=10;

	//페이지블럭에 출력될 시작 페이지번호를 저장할 변수 선언
	// => 시작페이지=(페이지번호-1)/블럭크기*블럭크기+1
	int startPage=(pageNum-1)/blockSize*blockSize+1;
	
	//페이지블럭에 출력될 마지막 페이지번호를 저장할 변수 선언
	// => 마지막 페이지블럭의 페이지번호는 총 페이지 갯수 저장
	int endPage=startPage+blockSize-1;
	if(endPage>totalPage) {
		endPage=totalPage;
	}
%>

<div class="list_number">
    <div>
	        <div class="list_n_menu">
	        	<% if(startPage>blockSize) { %>
	        	<a href="list.jsp?pageNum=1&search=<%=search%>&keyword=<%=keyword%>">처음</a>
	        	<a href="list.jsp?pageNum=<%=startPage-blockSize%>&search=<%=search%>&keyword=<%=keyword%>">이전</a>
	        	<% } else { %>
	        	<span class="disabled">처음</span>
	        	<span class="disabled">이전</span>
	        	<% } %>
		        <% for(int i=startPage;i<=endPage;i++) { %>
		        	<% if(pageNum==i) { %>
		        	<span class="current"><%=i%></span>
		        	<% } else { %>
		        	<a href="list.jsp?pageNum=<%=i%>&search=<%=search%>&keyword=<%=keyword%>"><%=i%></a>
		        	<% } %>	
		        <% } %>
		        <% if(endPage!=totalPage) { %>
		        <a href="list.jsp?pageNum=<%=startPage+blockSize%>&search=<%=search%>&keyword=<%=keyword%>">다음</a>
		        <a href="list.jsp?pageNum=<%=totalPage%>&search=<%=search%>&keyword=<%=keyword%>">마지막</a>
		        <% } else { %>
		        <span class="disabled">다음</span>
		        <span class="disabled">마지막</span>
		        <% } %>
	        </div>
    </div>
</div>
	

<%-- 검색 메뉴 및 검색 키워드 입력폼 구현 --%>
<form name="searchForm">
<table align="center" width="700">
	<tr align="center">
		<td>
			<select name="search"> 
				<option value="writer" selected="selected"> 작성자 </option>
				<option value="subject"> 제목 </option>
				<option value="content"> 내용 </option>
			</select>
			<input type="text" name="keyword">
			<button type="button" onclick="searchKeyword();">검색</button>
		</td>
	</tr>
</table>
<script type="text/javascript">
function searchKeyword() {
	if(searchForm.keyword.value=="") return;
	searchForm.method="post";
	searchForm.action="list.jsp";
	searchForm.submit();
}
</script>
</form> 
</body>
</html>