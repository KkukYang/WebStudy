package com.tjoeun.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//�����ø����̼�(���� - Servlet) �ۼ� ��� 
//1.HttpServlet Ŭ������ ��ӹ޴� �ڽ�Ŭ���� ���� - ����Ŭ����
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//2.doGet() �޼ҵ� �Ǵ� doPost() �޼ҵ带 �������̵� ����
	// => doGet() : Ŭ���̾�Ʈ�� GET ��� ��û�� ó���Ͽ� �����ϱ� ���� �޼ҵ�
	// => doPost() : Ŭ���̾�Ʈ�� POST ��� ��û�� ó���Ͽ� �����ϱ� ���� �޼ҵ�
	// => doGet() �޼ҵ� �Ǵ� doPost() �޼ҵ� ��� service() �޼ҵ� �������̵� ���� ����
	//HttpServletRequest : Ŭ���̾�Ʈ�� ��û������ ����� ��ü - ������Ʈ �޼���
	//HttpServletResponse : Ŭ���̾�Ʈ�� ���������� ����� ��ü - �������� �޼���
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//3.Ŭ���̾�Ʈ�� ����� ����� ���� ��������(MimeType)�� ĳ���ͼ� ����
		// => �⺻�� >> �������� : text/html, ĳ���ͼ� : ISO-8859-1(��������)
		//HttpServletResponse.setContentType(String mimeType) : Ŭ���̾�Ʈ�� �������� ���� ���������� �����ϴ� �޼ҵ�
		response.setContentType("text/html;charset=UTF-8");
		
		//4.Ŭ���̾�Ʈ���� ����� �����ϱ� ���� ��½�Ʈ���� ��ȯ�޾� ����
		//HttpServletResponse.getOutputStream() : ���õ���Ÿ�� �����ϱ� ���� ��½�Ʈ��(ServletOutputStream)�� ��ȯ�ϴ� �޼ҵ�
		//HttpServletResponse.getWriter() : �ؽ�Ʈ����Ÿ�� �����ϱ� ���� ��½�Ʈ��(PrintWriter)�� ��ȯ�ϴ� �޼ҵ� 
		PrintWriter out=response.getWriter();
		
		//5.��û�� ���� ó�� �� ���� ��� ����
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset=\"UTF-8\">");
		out.println("<title>JSP</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>����������</h1>");
		out.println("</body>");
		out.println("</html>");
		
		//6.web.xml ���Ͽ��� ���� Ŭ������ �������� ����ϰ� ������ URL �ڿ����� ���� ó�� 
		// => WebContent/WEB-INF/web.xml : ������Ʈ�� ���ؽ�Ʈ�� ��ȯ�� �� �ʿ��� ������ �����ϴ� ����
	}
}










