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

//@WebServlet : ���� Ŭ������ �������� ���ó���ϰ� URL �ڿ����� ���� �����ϴ� ������̼�(Annotation)
// => web.xml ���Ͽ��� ������ �۾��� ������̼��� �̿��Ͽ� ó��
// => value �Ӽ��� �Ӽ������� ���ε� URL �ڿ� ���� - �ٸ� �Ӽ��� ���� ��� �Ӽ����� ���� ����

//��� ������ WAS�� ���� �����ֱ�(LifeCycle)�� ����
// => �����ֱ� : ������ ���� ��ü ����, ��ü �޼ҵ� ȣ��, ��ü �Ҹ�
@WebServlet("/first.do")
public class FirstServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//Ŭ������ ��ü�� �����ϱ� ���� WAS�� ���� �ڵ� ȣ��Ǵ� �޼ҵ� - 1�� ȣ�� 
	public FirstServlet() {
		System.out.println("FirstServlet Ŭ������ �⺻ ������ ȣ��");
	}
	
	//��ü ���� �� WAS�� ���� �ڵ� ȣ��Ǵ� �޼ҵ� - 1�� ȣ��
	// => ��ü �ʱ�ȭ �۾�(�ʵ� �ʱⰪ �ο�) >> ServletConfig ��ü�� �����޾� �ʱ�ȭ �۾�
	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("FirstServlet Ŭ������ init() �޼ҵ� ȣ��");
	}
	
	//Ŭ���̾�Ʈ ��û�� �ִ� ��� WAS(Web Application Server)�� ���� �ڵ� ȣ�� - �ݺ�
	// => Ŭ���̾�Ʈ�� ��û�� ���� ó���� ���� ����� �ۼ��ϴ� �޼ҵ�
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("FirstServlet Ŭ������ service() �޼ҵ� ȣ��");
		
		//������ �����ϴ� �̹��� ������ �о� Ŭ���̾�Ʈ���� ����
		response.setContentType("image/jpeg");
		//Ŭ���̾�Ʈ ��½�Ʈ���� �����޾� ����
		ServletOutputStream out=response.getOutputStream();
		
		//HttpServletRequest.getServletContext() : ServletContext ��ü�� ��ȯ�ϴ� �޼ҵ�
		// => ServletContext ��ü : ���ؽ�Ʈ ������ �����ϴ� ��ü
		//ServletContext.getRealPath(String url) : ���ؽ�Ʈ ���ο� �����ϴ� �ڿ��� ���� �������� ���� ��θ� ��ȯ�ϴ� �޼ҵ� 
		String filePath=request.getServletContext().getRealPath("/WEB-INF/images")+"/penguin.jpg";
		//System.out.println("filePath = "+filePath);
		
		//���� �Է½�Ʈ�� ����
		FileInputStream in=new FileInputStream(filePath);
		
		//Ŭ���̾�Ʈ���� ���õ���Ÿ(1Byte) ���� >> �ݺ�
		while(true) {
			int readByte=in.read();
			if(readByte==-1) break;
			out.write(readByte);
		}
		
		//���� �Է½�Ʈ�� ����
		in.close();
	}
	
	//��ü �Ҹ� �� WAS�� ���� �ڵ� ȣ��Ǵ� �޼ҵ� - 1�� ȣ��
	// => ��ü ������ �۾�
	@Override
	public void destroy() {
		System.out.println("FirstServlet Ŭ������ destroy() �޼ҵ� ȣ��");
	}
}









