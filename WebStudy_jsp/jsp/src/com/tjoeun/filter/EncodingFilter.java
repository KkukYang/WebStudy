package com.tjoeun.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

//����Ŭ���� : Ŭ���̾�Ʈ ��û�� ���� ó�� ���� ��û����(������Ʈ)�� �����ϰų� ó�� �� 
//Ŭ���̾�Ʈ���� ������ ��������(��������)�� �����ϱ� ���� ��� �����ϴ� Ŭ����
// => Filter �������̽��� ��ӹ޾� �ۼ�
// => web.xml ������ �̿��Ͽ� ���� ��� �� URL ���� ���� >> @WebFilter ������̼� ���

//���ڵ� ���� : ������Ʈ ĳ���ͼ��� ���ڵ��� �����ϴ� ����
public class EncodingFilter implements Filter {
	//�����ϰ��� �ϴ� ĳ���ͼ��� ���ڵ� ������ �����ϱ� ���� �ʵ�
	private String encoding;
	
	//���� Ŭ������ ��ü�� ������ �� �ڵ� ȣ��Ǵ� �޼ҵ� - 1�� ���� >> �ʱ�ȭ �ۼ�
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		//encoding="UTF-8";
		
		//FilterConfig.getInitParameter(String parameterName) : web.xml ������
		//filter ������Ʈ���� ������ ���� ��ȯ�ϴ� �޼ҵ�
		encoding=filterConfig.getInitParameter("encoding");
	}
	
	//Ŭ���̾�Ʈ ��û�� ���� ���� ����� �����ϱ� ���� �޼ҵ�
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//Ŭ���̾�Ʈ ��û ó�� �� ����� ��� �ۼ� - ������Ʈ ĳ���ͼ��� ���ڵ� ����
		if(request.getCharacterEncoding()==null || 
				!request.getCharacterEncoding().equals(encoding)) {
			request.setCharacterEncoding(encoding);
		}
		
		//FilterChain.doFilter(ServletRequest request, ServletResponse response) :
		//Ŭ���̾�Ʈ ��û�� ���� ó�� ����� �����ϴ� �����ø����̼��� �����ϴ� �޼ҵ�
		chain.doFilter(request, response);
			
		//Ŭ���̾�Ʈ ��û ó�� �� ����� ��� �ۼ�
		
	}

}



