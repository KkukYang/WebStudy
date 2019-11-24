package com.tjoeun.custom;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

//�±� Ŭ���� : JSP �������� ����� �� �ִ� �±׸� Ŭ������ ����
// => TagSupport Ŭ������ ��ӹ޾� �ۼ�

//�±� �Ӽ��� ������ �������� �ʴ� �±׸� �ۼ��ϱ� ���� Ŭ����
public class HelloTag extends TagSupport {
	private static final long serialVersionUID = 1L;

	//�����±� ���� ȣ��Ǵ� �޼ҵ�
	@Override
	public int doStartTag() throws JspException {
		try {
			pageContext.getOut().println("<p>�ȳ��ϼ���.</p>");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return SKIP_BODY;
	}
	
	//�����±� ���� ȣ��Ǵ� �޼ҵ�
	@Override
	public int doEndTag() throws JspException {
		return EVAL_PAGE;
	}
}





