<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 입력 파일을 서버 디렉토리에 저장하고 입력값과 파일명을 출력하는 JSP 문서 --%>
<%
	//입력값이 텍스트 데이타인 경우 request.getParameter() 메소드로 입력값 반환
	// => 입력값이 원시 데이타인 경우 null 반환
	//String uploader=request.getParameter("uploader");
	
	//입력값이 원시 데이타로 전달될 경우 원시 데이타를 처리하는 클래스를 사용
	// => Apache 그룹에서 제공하는 commons 라이브러리의 클래스 사용 - 선택적 파일 업로드
	// => Oreilly 그룹에서 제공하는 cos 라이브러리의 클래스 사용 - 전체적 파일 업로드
	
	//cos 라이브러리를 다운로드 받아 프로젝트 빌드 후 업로드 클래스 사용 가능
	// => http://www.servlets.com >> cos-20.08.zip 다운로드 >> 압축 풀기
	//    >> cos.jar 복사 >> /WebContent/WEB-INF/lib 디렉토리에 붙여넣기
	
	//파일을 저장하기 위한 서버 디렉토리의 경로를 반환받아 저장
	//request.getServletContext() : ServeltContext 객체를 반환하는 메소드
	//ServeltContext.getRealPath(String path) : 컨텍스트 자원에 대한 실제 경로를 반환하는 메소드
	String saveDirectory=request.getServletContext().getRealPath("/upload");
	//System.out.println("saveDirectory = "+saveDirectory);
	
	//MultipartRequest 클래스로 객체(인스턴스) 생성
	// => 클라이언트가 입력한 모든 파일에 대한 업로드 처리
	// => 입력값 또는 입력 파일명을 메소드를 호출하여 반환받아 처리
	
	//MultipartRequest(HttpServletRequest request,String saveDirectory [, int maxSize]
	//		[, String encoding] [, FileRenamePolicy fileRenamePolicy]) 생성자로 객체 생성
	// => HttpServletRequest request : 리퀘스트 메세지가 저장된 객체(인스턴스)
	// => String saveDirectory : 서버 업로드 디렉토리의 실제 경로
	// => int maxSize : 업로드 파일의 최대 크기(Byte)
	// => String encoding : 입력 문자열에 대한 캐릭터셋의 인코딩
	// => FileRenamePolicy fileRenamePolicy : 중복 파일이 존재할 경우 파일명을 변경하는 객체
	//    - 생략될 경우 기존 파일 대신 업로드 처리(덮어씌우기)
	//    - DefaultFileRenamePolicy 클래스 : 파일명을 변경하는 기능을 제공하는 클래스
	MultipartRequest mr=new MultipartRequest
		(request, saveDirectory, 30*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
	
	//MultipartRequest.getParameter(String parameterName) : 입력값을 반환하는 메소드
	String uploader=mr.getParameter("uploader");
	
	//MultipartRequest.getOriginalFileName(String parameterName) : 입력 파일명을 반환하는 메소드
	//String fileOne=mr.getOriginalFileName("fileOne");
	//String fileTwo=mr.getOriginalFileName("fileTwo");
 
	//MultipartRequest.getFilesystemName(String parameterName) : 업로드 파일명을 반환하는 메소드
	String fileOne=mr.getFilesystemName("fileOne");
	String fileTwo=mr.getFilesystemName("fileTwo");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>파일 업로드 결과</h1>
	<hr>
	<p>업로더 = <%=uploader %></p>
	<p>파일-1 = <%=fileOne %></p>
	<p>파일-2 = <%=fileTwo %></p>
</body>
</html>



