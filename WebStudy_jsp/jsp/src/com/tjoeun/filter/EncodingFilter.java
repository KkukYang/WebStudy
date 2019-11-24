package com.tjoeun.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

//필터클래스 : 클라이언트 요청에 대한 처리 전에 요청정보(리퀘스트)를 변경하거나 처리 후 
//클라이언트에게 전달할 응답정보(리스폰즈)를 변경하기 위한 기능 제공하는 클래스
// => Filter 인터페이스를 상속받아 작성
// => web.xml 파일을 이용하여 필터 등록 및 URL 패턴 설정 >> @WebFilter 어노테이션 사용

//인코딩 필터 : 리퀘스트 캐릭터셋의 인코딩을 변경하는 필터
public class EncodingFilter implements Filter {
	//변경하고자 하는 캐릭터셋의 인코딩 정보를 저장하기 위한 필드
	private String encoding;
	
	//필터 클래스가 객체로 생성된 후 자동 호출되는 메소드 - 1번 실행 >> 초기화 작성
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		//encoding="UTF-8";
		
		//FilterConfig.getInitParameter(String parameterName) : web.xml 파일의
		//filter 엘리먼트에서 제공된 값을 반환하는 메소드
		encoding=filterConfig.getInitParameter("encoding");
	}
	
	//클라이언트 요청에 대한 필터 기능을 제공하기 위한 메소드
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//클리이언트 요청 처리 전 실행될 명령 작성 - 리퀘스트 캐릭터셋의 인코딩 변경
		if(request.getCharacterEncoding()==null || 
				!request.getCharacterEncoding().equals(encoding)) {
			request.setCharacterEncoding(encoding);
		}
		
		//FilterChain.doFilter(ServletRequest request, ServletResponse response) :
		//클라이언트 요청에 대한 처리 기능을 제공하는 웹어플리케이션을 연결하는 메소드
		chain.doFilter(request, response);
			
		//클라이언트 요청 처리 후 실행될 명령 작성
		
	}

}



