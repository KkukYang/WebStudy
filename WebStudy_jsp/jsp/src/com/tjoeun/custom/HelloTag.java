package com.tjoeun.custom;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

//태그 클래스 : JSP 문서에서 사용할 수 있는 태그를 클래스로 선언
// => TagSupport 클래스를 상속받아 작성

//태그 속성과 내용이 존재하지 않는 태그를 작성하기 위한 클래스
public class HelloTag extends TagSupport {
	private static final long serialVersionUID = 1L;

	//시작태그 사용시 호출되는 메소드
	@Override
	public int doStartTag() throws JspException {
		try {
			pageContext.getOut().println("<p>안녕하세요.</p>");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return SKIP_BODY;
	}
	
	//종료태그 사용시 호출되는 메소드
	@Override
	public int doEndTag() throws JspException {
		return EVAL_PAGE;
	}
}





