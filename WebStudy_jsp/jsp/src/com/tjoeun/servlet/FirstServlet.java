package com.tjoeun.servlet;

import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet : 서블릿 클래스를 서블릿으로 등록처리하고 URL 자원으로 매핑 설정하는 어노테이션(Annotation)
// => web.xml 파일에서 설정한 작업을 어노테이션을 이용하여 처리
// => value 속성의 속성값으로 매핑될 URL 자원 설정 - 다른 속성이 없는 경우 속성값만 설정 가능

//모든 서블릿은 WAS에 의해 생명주기(LifeCycle)가 관리
// => 생명주기 : 서블릿에 대한 객체 생성, 객체 메소드 호출, 객체 소멸
@WebServlet("/first.do")
public class FirstServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//클래스로 객체를 생성하기 위해 WAS에 의해 자동 호출되는 메소드 - 1번 호출 
	public FirstServlet() {
		System.out.println("FirstServlet 클래스의 기본 생성자 호출");
	}
	
	//객체 생성 후 WAS에 의해 자동 호출되는 메소드 - 1번 호출
	// => 객체 초기화 작업(필드 초기값 부여) >> ServletConfig 객체를 제공받아 초기화 작업
	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("FirstServlet 클래스의 init() 메소드 호출");
	}
	
	//클라이언트 요청이 있는 경우 WAS(Web Application Server)에 의해 자동 호출 - 반복
	// => 클라이언트의 요청에 대한 처리와 응답 명령을 작성하는 메소드
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("FirstServlet 클래스의 service() 메소드 호출");
		
		//서버에 존재하는 이미지 파일을 읽어 클라이언트에게 전달
		response.setContentType("image/jpeg");
		//클라이언트 출력스트림을 제공받아 저장
		ServletOutputStream out=response.getOutputStream();
		
		//HttpServletRequest.getServletContext() : ServletContext 객체를 반환하는 메소드
		// => ServletContext 객체 : 컨텍스트 정보를 저장하는 객체
		//ServletContext.getRealPath(String url) : 컨텍스트 내부에 존재하는 자원에 대한 물리적인 실제 경로를 반환하는 메소드 
		String filePath=request.getServletContext().getRealPath("/WEB-INF/images")+"/penguin.jpg";
		//System.out.println("filePath = "+filePath);
		
		//파일 입력스트림 생성
		FileInputStream in=new FileInputStream(filePath);
		
		//클라이언트에게 원시데이타(1Byte) 전달 >> 반복
		while(true) {
			int readByte=in.read();
			if(readByte==-1) break;
			out.write(readByte);
		}
		
		//파일 입력스트림 제거
		in.close();
	}
	
	//객체 소멸 전 WAS에 의해 자동 호출되는 메소드 - 1번 호출
	// => 객체 마무리 작업
	@Override
	public void destroy() {
		System.out.println("FirstServlet 클래스의 destroy() 메소드 호출");
	}
}









