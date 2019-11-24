package com.tjoeun.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//웹어플리케이션(서블릿 - Servlet) 작성 방법 
//1.HttpServlet 클래스를 상속받는 자식클래스 선언 - 서블릿클래스
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//2.doGet() 메소드 또는 doPost() 메소드를 오버라이드 선언
	// => doGet() : 클라이언트의 GET 방식 요청을 처리하여 응답하기 위한 메소드
	// => doPost() : 클라이언트의 POST 방식 요청을 처리하여 응답하기 위한 메소드
	// => doGet() 메소드 또는 doPost() 메소드 대신 service() 메소드 오버라이드 선언 가능
	//HttpServletRequest : 클라이언트의 요청정보가 저장된 객체 - 리퀘스트 메세지
	//HttpServletResponse : 클라이언트의 응답정보가 저장된 객체 - 리스폰즈 메세지
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//3.클라이언트에 응답될 결과에 대한 문서형식(MimeType)와 캐릭터셋 변경
		// => 기본값 >> 문서형식 : text/html, 캐릭터셋 : ISO-8859-1(서유럽어)
		//HttpServletResponse.setContentType(String mimeType) : 클라이언트의 응답결과에 대한 문서형식을 변경하는 메소드
		response.setContentType("text/html;charset=UTF-8");
		
		//4.클라이언트에게 결과를 전송하기 위한 출력스트림을 반환받아 저장
		//HttpServletResponse.getOutputStream() : 원시데이타를 전달하기 위한 출력스트림(ServletOutputStream)을 반환하는 메소드
		//HttpServletResponse.getWriter() : 텍스트데이타를 전달하기 위한 출력스트림(PrintWriter)을 반환하는 메소드 
		PrintWriter out=response.getWriter();
		
		//5.요청에 대한 처리 및 응답 결과 전달
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset=\"UTF-8\">");
		out.println("<title>JSP</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>메인페이지</h1>");
		out.println("</body>");
		out.println("</html>");
		
		//6.web.xml 파일에서 서블릿 클래스를 서블릿으로 등록하고 서블릿을 URL 자원으로 매핑 처리 
		// => WebContent/WEB-INF/web.xml : 프로젝트를 컨텍스트로 변환할 때 필요한 정보를 제공하는 파일
	}
}










