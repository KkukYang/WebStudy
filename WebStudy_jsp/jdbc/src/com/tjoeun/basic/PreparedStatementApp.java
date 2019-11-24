package com.tjoeun.basic;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

//Ű����� �μ������� �Է¹޾� DEPT ���̺� �����ϴ� JDBC ���α׷� �ۼ� 
public class PreparedStatementApp {
	public static void main(String[] args) throws Exception {
		//Ű���� �Է½�Ʈ�� ����
		BufferedReader br=new BufferedReader(new InputStreamReader(System.in));
		
		//Ű���带 �̿��Ͽ� �μ������� �Է¹޾� ����
		System.out.println("<<�μ����� �Է�>>");
		System.out.print("�μ���ȣ >> ");
		int deptno=Integer.parseInt(br.readLine());
		System.out.print("�μ��̸� >> ");
		String dname=br.readLine();
		System.out.print("�μ���ġ >> ");
		String loc=br.readLine();
		
		//DEPT ���̺� �Է¹��� �μ����� ����
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="scott";
		String password="tiger";
		Connection con=DriverManager.getConnection(url, user, password);
			
		//PreparedStatement : ��ü�� ����� SQL ����� �����Ͽ� ����� ����� ��ȯ�ϴ� ��ü
		// => SQL ��ɿ� InParameter(? : �ܺΰ��� ���޹ޱ� ���� ��ȣ)�� �̿��Ͽ� �ۼ�
		String sql="insert into dept values(?,?,?)";
		//Connection.prepareStatement(String sql) : SQL ����� ����� PreparedStatement ��ü�� ��ȯ�ϴ� �޼ҵ�
		PreparedStatement pstmt=con.prepareStatement(sql);
		//PreparedStatement.setXXX(int index, XXX value) : PreparedStatement ��ü��
		//����� SQL ����� InParameter�� ���� �����ϴ� �޼ҵ�
		// => XXX : Java �ڷ���
		// => InParameter ������ŭ �޼ҵ� ȣ���ؾ߸� SQL ��� �ϼ�
		pstmt.setInt(1, deptno);
		pstmt.setString(2, dname);
		pstmt.setString(3, loc);
		
		//PreparedStatement.executeUpdate() �޼ҵ� �Ǵ� PreparedStatement.executeQuery()
		//�޼ҵ带 ȣ���Ͽ� PreparedStatement ��ü�� ����� SQL ��� ����
		int rows=pstmt.executeUpdate();
		
		System.out.println("[���]"+rows+"���� �μ������� ���� �Ͽ����ϴ�.");
		
		if(pstmt!=null) pstmt.close();
		if(con!=null) con.close();
	}
}





